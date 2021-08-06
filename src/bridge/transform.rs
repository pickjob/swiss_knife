use std::convert::TryInto;

use json::JsonValue;
pub struct JsonFormat {
}

pub struct UrlFormat {
}

impl JsonFormat {

    pub fn pretty_print(src: String) -> String {
        let parsed_json = match self::JsonFormat::parse(src) {
            Some(json) => json,
            None => return String::new(),
        };

        json::stringify_pretty(parsed_json, 4)
    }

    pub fn transform_form_data(src: String) -> String {
        let mut result = String::new();
        let parsed_json = match self::JsonFormat::parse(src) {
            Some(json) => json,
            None => return result,
        };

        for entry in parsed_json.entries() {
            result += entry.0;
            result += ":";
            result += &format!("{:}", entry.1);
            result += "\n";
        }
        result
    }

    fn parse(src: String) -> Option<JsonValue> {
        let parsed_json = match json::parse(&src) {
            Ok(json) => Some(json),
            Err(err) => {
                log::error!("wrong {:} occur with text {:}", err, src);
                None
            },
        };

        parsed_json
    }
}

impl UrlFormat {
    
    pub fn encoding(src: String) -> String {
        let encoded = urlencoding::encode(src.as_str());
        let encoding_str = match encoded.try_into() {
            Ok(r) => r,
            Err(err) => {
                log::error!("wrong {:} occur with text {:}", err, src);
                String::new()
            },
        };

        encoding_str
    }

    pub fn decoding(src: String) -> String {
        let decoded = match urlencoding::decode(src.as_str()) {
            Ok(r) => r,
            Err(err) => {
                log::error!("wrong {:} occur with text {:}", err, src);
                "".into()
            }
        };

        decoded.to_string()
    }
}