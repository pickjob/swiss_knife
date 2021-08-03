use core::cell::RefCell;
use log::{debug, error, info};
use qmetaobject::{QObjectPinned, init_qt_to_rust, prelude::*};

qrc!(
    init_resource,
    "" {
        "qtquickcontrols2.conf",
    },
);

#[derive(Default, QObject)]
struct Bridge {
    base: qt_base_class!(trait QObject),
    transform: qt_method!(fn(&self, src: String, transform_type: u8) -> String),
}

impl Bridge {

    pub fn transform(&self, src: String, transform_type: u8) -> String{
        debug!("src: {}, type: {}", src, transform_type);
        let mut result = String::new();
        if (transform_type == 1) {
            let parsed_json = match json::parse(&src) {
                Ok(r) => r,
                Err(err) => {
                    error!("wrong {:} occur with text {:}", err, src);
                    return result;
                },
            };
            
            for entry in parsed_json.entries() {
                result += entry.0;
                result += ":";
                result += &format!("{:}", entry.1);
                result += "\n";
            }
            // parsed_json
        }
        return result;
    }
}

fn main() {
    match log4rs::init_file("log4rs.yml", Default::default()) {
        Ok(_) => info!("log4rs loading success"),
        _ => unreachable!(),
    };
    init_qt_to_rust();
    init_resource();
    let mut engine = QmlEngine::new();
    let obj = RefCell::new(Bridge::default());
    engine.set_object_property("_bridge".into(), unsafe { QObjectPinned::new(&obj) });
    engine.load_file("qml/swiss_knife/main.qml".into());
    engine.exec();
}
