/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

use serde::Deserialize;

/// The top-level `clientConfig` element.
#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ClientConfig {
    #[serde(rename = "@version")]
    pub version: String,

    pub email_provider: EmailProvider,
}

/// An email provider (the `emailProvider` element).
#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct EmailProvider {
    #[serde(rename = "@id")]
    pub provider_id: String,

    pub display_name: String,
    pub display_short_name: String,

    #[serde(rename = "domain")]
    pub domains: Vec<String>,

    #[serde(rename = "incomingServer")]
    pub incoming_servers: Vec<IncomingServer>,

    #[serde(rename = "outgoingServer")]
    pub outgoing_servers: Vec<OutgoingServer>,
}

/// An incoming server, represented with the `incomingServer` element in the
/// autoconfig file.
#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct IncomingServer {
    #[serde(rename = "@type")]
    pub server_type: IncomingServerType,

    pub hostname: String,
    pub port: u16,
    pub socket_type: SocketType,
    pub username: String,
    pub authentication: AuthType,
    pub use_global_preferred_server: Option<bool>,

    /// Additional configuration for servers of type `exchange`.
    #[serde(rename = "ewsURL")]
    pub ews_url: Option<String>,
    #[serde(rename = "owaURL")]
    pub owa_url: Option<String>,

    /// Additional configuration for servers of type `pop3`.
    pub pop3: Option<POP3Config>,
}

/// The supported values for an incoming server's `type` attribute.
#[derive(Clone, Debug, Deserialize, PartialEq)]
#[serde(rename_all = "lowercase")]
pub enum IncomingServerType {
    IMAP,
    POP3,
    Exchange,
}

/// The supported values for a server's `socketType` attribute.
#[derive(Debug, Deserialize)]
pub enum SocketType {
    #[serde(rename = "plain")]
    Plain,
    SSL,
    STARTTLS,
}

/// The supported values for a server's `authentication` attribute.
#[derive(Debug, Deserialize)]
pub enum AuthType {
    #[serde(rename = "password-cleartext")]
    PasswordCleartext,
    #[serde(rename = "password-encrypted")]
    PasswordEncrypted,
    NTLM,
    GSSAPI,
    #[serde(rename = "client-IP-address")]
    ClientIPAddress,
    #[serde(rename = "TLS-client-cert")]
    TLSClientCert,
    OAuth2,
    None,
}

/// Additional configuration for POP3 servers.
#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct POP3Config {
    pub leave_messages_on_server: Option<bool>,
    pub download_on_biff: Option<bool>,
    pub check_interval: Option<POP3CheckInterval>,
}

/// A setting for POP3 servers to indicate how long to wait before checking for
/// new messages.
#[derive(Debug, Deserialize)]
pub struct POP3CheckInterval {
    #[serde(rename = "@minutes")]
    pub minutes: u32,
}

/// An outgoing server, represented with the `outgoingServer` element in the
/// autoconfig file.
#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OutgoingServer {
    #[serde(rename = "@type")]
    pub server_type: OutgoingServerType,

    pub hostname: String,
    pub port: u16,
    pub socket_type: SocketType,
    pub username: String,
    pub authentication: AuthType,
}

/// The supported values for an outgoing server's `type` attribute.
#[derive(Debug, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum OutgoingServerType {
    SMTP,
}
