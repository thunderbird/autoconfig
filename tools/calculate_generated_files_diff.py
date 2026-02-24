import argparse
import difflib
import os.path
import requests

GENERATED_FILES_NAME = "generated_files.json"

GITHUB_COMMENT_TEMPLATE_WITH_DIFF = """This PR will cause the following changes to the production `generated_files.json` file:

<details>
<summary>
Expand to view diff
</summary>

```diff
{deltas}
```

</details>
"""

GITHUB_COMMENT_TEMPLATE_NO_DIFF = (
    "This PR will not cause any change to the production `generated_files.json` file."
)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-b", metavar="base_url", help="base URL serving ISPDB files")
    parser.add_argument("-t", metavar="api_token", help="Github API token")
    parser.add_argument("-r", metavar="repo", help="Github repository")
    parser.add_argument("-n", metavar="number", help="The Github or issue number")
    parser.add_argument(
        "folder", help="the folder containing the local ISPDB files to compare"
    )

    args = parser.parse_args()

    # Strip out any trailing slash in the base URL so we don't accidentally end
    # up doubling it.
    base_url: str = args.b.strip("/")

    resp = requests.get(f"{base_url}/{GENERATED_FILES_NAME}")

    # At the time of writing, all of the domains in ISPDB are made up of ASCII
    # characters, but that might not stay true forever.
    resp.encoding = "utf-8"

    with open(os.path.join(args.folder, GENERATED_FILES_NAME), "r") as fp:
        local_list = fp.readlines()

        # We call the local version "staging" as a shortcut, because by this
        # time we expect to have already validated that the
        deltas = list(
            difflib.unified_diff(
                resp.text.splitlines(keepends=True),
                local_list,
                fromfile="production",
                tofile="staging",
            )
        )

        comment = (
            GITHUB_COMMENT_TEMPLATE_WITH_DIFF.format(deltas="".join(deltas))
            if len(deltas) > 0
            else GITHUB_COMMENT_TEMPLATE_NO_DIFF
        )

        # Create the comment via the Github API.
        # See <https://docs.github.com/en/rest/issues/comments?apiVersion=2022-11-28#create-an-issue-comment>
        resp = requests.post(
            f"https://api.github.com/repos/{args.r}/issues/{args.n}/comments",
            headers={
                "Accept": "application/vnd.github+json",
                "Authorization": f"Bearer {args.t}",
            },
            json={"body": comment},
        )

        print(f"Posted comment {resp.json()["html_url"]}")


if __name__ == "__main__":
    main()
