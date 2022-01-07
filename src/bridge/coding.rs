use log::{error, info};
use serde_json::Value;

#[derive(Copy, Clone, Debug)]
#[repr(u32)]
pub enum CodingMode {
    // Json2FormData,
    // Json2PrettyString,
    Base64,
    UrlEncoding,
    FireFox,
    Unknow,
}

impl From<&str> for CodingMode {
    fn from(trans_type: &str) -> Self {
        match trans_type {
            "Base64" => Self::Base64,
            "UrlEncoding" => Self::UrlEncoding,
            "FireFox" => Self::FireFox,
            _ => Self::Unknow,
        }
    }
}

impl CodingMode {
    pub fn format(&self, src: &str) -> String {
        info!("format: {:?}, src: {}", self, src);

        match self {
            Self::FireFox => JsonFormat::pretty_print(src),
            _ => String::new(),
        }
    }

    pub fn encoding(&self, src: &str) -> String {
        info!("encoding: {:?}, src: {}", self, src);

        match self {
            Self::Base64 => Base64Format::encoding(src),
            Self::UrlEncoding => UrlFormat::encoding(src),
            Self::FireFox => JsonFormat::json_to_formdata(src),
            _ => String::new(),
        }
    }

    pub fn decoding(&self, src: &str) -> String {
        info!("decoding: {:?}, src: {}", self, src);

        match self {
            Self::Base64 => Base64Format::decoding(src),
            Self::UrlEncoding => UrlFormat::decoding(src),
            // Self::FireFox => String::new(),
            _ => String::new(),
        }
    }
}

pub struct JsonFormat {}

pub struct UrlFormat {}

pub struct Base64Format {}

impl JsonFormat {
    pub fn pretty_print(src: &str) -> String {
        if let Some(parsed_json) = Self::parse(src) {
            let result = match serde_json::to_string_pretty(&parsed_json) {
                Ok(res) => res,
                Err(err) => {
                    error!("{:?}", err);
                    String::default()
                }
            };

            result
        } else {
            String::new()
        }
    }

    pub fn json_to_formdata(src: &str) -> String {
        if let Some(parsed_json) = Self::parse(src) {
            let mut result = String::new();
            for entry in parsed_json.as_object().unwrap() {
                result += entry.0;
                result += ":";
                result += &format!("{:}", entry.1);
                result += "\n";
            }

            result
        } else {
            String::default()
        }
    }

    fn parse(src: &str) -> Option<Value> {
        let result: serde_json::error::Result<Value> = serde_json::from_str(src);
        let result = match result {
            Ok(j) => {
                if j.is_object() {
                    Some(j)
                } else {
                    None
                }
            }
            Err(err) => {
                error!("{:?}", err);
                None
            }
        };

        result
    }
}

impl UrlFormat {
    pub fn encoding(src: &str) -> String {
        let encoded = urlencoding::encode(src);
        let encoding_str = encoded.into_owned();

        encoding_str
    }

    pub fn decoding(src: &str) -> String {
        let decoded = match urlencoding::decode(src) {
            Ok(decoded) => decoded.into_owned(),
            Err(err) => {
                error!("{:?}", err);
                String::default()
            }
        };

        decoded
    }
}

impl Base64Format {
    pub fn encoding(src: &str) -> String {
        base64::encode(src.as_bytes())
    }

    pub fn decoding(src: &str) -> String {
        let decoded = match base64::decode(src) {
            Ok(decoded) => std::str::from_utf8(&decoded).unwrap().to_owned(),
            Err(err) => {
                error!("{:?}", err);
                String::default()
            }
        };

        decoded
    }
}
