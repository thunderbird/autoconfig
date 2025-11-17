/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pub mod error;
pub mod types;
mod validate;

pub use crate::validate::*;

use crate::error::ValidationError;
use crate::types::ClientConfig;

/// Deserializes the provided XML and returns the result as an instance of
/// `ClientConfig`.
pub fn parse_client_config(bytes: &[u8]) -> Result<ClientConfig, ValidationError> {
    let de = &mut quick_xml::de::Deserializer::from_reader(bytes);
    let cfg: ClientConfig = serde_path_to_error::deserialize(de)?;
    Ok(cfg)
}

#[cfg(test)]
mod tests {
    // TODO: Test parsing an invalid file.
    use super::*;
    use crate::error::TestError;
    use std::{env, fs};

    /// Reads and returns the contents of the test data file with the provided
    /// name.
    ///
    /// Test data files are located in `resources/test_data/` from the root of
    /// the crate (not the workspace).
    fn read_test_data(filename: &str) -> Result<Vec<u8>, TestError> {
        let root = env::var("CARGO_MANIFEST_DIR")?;
        let path = format!("{root}/resources/test_data/{filename}");

        let content = fs::read(path)?;
        Ok(content)
    }

    /// Tests that a valid autoconfig file parses correctly.
    #[test]
    fn test_de() -> Result<(), TestError> {
        let valid_sample = read_test_data("valid_config.xml")?;
        parse_client_config(valid_sample.as_slice())?;

        Ok(())
    }
}
