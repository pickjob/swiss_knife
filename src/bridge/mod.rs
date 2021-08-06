use crate::bridge::transform::{JsonFormat, UrlFormat};

use qmetaobject::prelude::*;

mod transform;

#[derive(Default, QObject)]
pub struct Bridge {
    base: qt_base_class!(trait QObject),
    transform: qt_method!(fn(&self, src: String, transform_type: u8) -> String),
}

impl Bridge {

    pub fn transform(&self, src: String, transform_type: u8) -> String{
        log::debug!("src: {}, type: {}", src, transform_type);
        let mut result = String::new();
        if transform_type == 1 {
            result = JsonFormat::transform_form_data(src);
        } else if transform_type == 2 {
            result = JsonFormat::pretty_print(src);
        } else if transform_type == 3 {
            result = UrlFormat::encoding(src);
        } else if transform_type == 4 {
            result = UrlFormat::decoding(src);
        }
        return result;
    }
}