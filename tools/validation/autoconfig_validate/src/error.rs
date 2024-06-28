/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

use std::{env, io};
use thiserror::Error;

use crate::types::IncomingServerType;

/// An error that arose while deserializing or validating the autoconfig file.
#[derive(Debug, Error)]
pub enum ValidationError {
    #[error("failed to deserialize structure from XML: {0}")]
    Deserialize(#[from] serde_path_to_error::Error<quick_xml::DeError>),

    #[error("unsupported clientConfig version: {0}")]
    UnsupportedVersion(String),

    #[error(
        "found protocol-specific config for {found:?} on incoming server of type {server_type:?}"
    )]
    InvalidIncomingConfig {
        server_type: IncomingServerType,
        found: IncomingServerType,
    },

    #[error("invalid username template: {0}")]
    InvalidUsernameTemplate(String),

    #[error("encountered an unexpected error: {0}")]
    Unexpected(#[source] anyhow::Error),
}

/// An error that arose in a test.
#[derive(Debug, Error)]
pub(crate) enum TestError {
    #[error("failed to read variable from environment: {0}")]
    EnvRead(#[from] env::VarError),

    #[error("failed to read file: {0}")]
    Io(#[from] io::Error),

    #[error("validation error: {0}")]
    Validation(#[from] ValidationError),
}
