use qmetaobject::prelude::*;
use self::coding::CodingMode;

pub mod coding;

#[derive(Default, QObject)]
pub struct Bridge {
    base: qt_base_class!(trait QObject),
    format: qt_method!(fn(&self, mode: String, src: String) -> String),
    encoding: qt_method!(fn(&self, mode: String, src: String) -> String),
    decoding: qt_method!(fn(&self, mode: String, src: String) -> String),
}

impl Bridge {
    pub fn format(&self, coding_mode: String, src: String) -> String {
        let code_mode: CodingMode = coding_mode.as_str().into();

        code_mode.format(src.as_str())
    }

    pub fn encoding(&self, coding_mode: String, src: String) -> String {
        let code_mode: CodingMode = coding_mode.as_str().into();

        code_mode.encoding(src.as_str())
    }

    pub fn decoding(&self, coding_mode: String, src: String) -> String {
        let code_mode: CodingMode = coding_mode.as_str().into();

        code_mode.decoding(src.as_str())
    }
}
