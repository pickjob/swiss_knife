#![windows_subsystem = "windows"]

use core::cell::RefCell;
use qmetaobject::QObjectPinned;
use qmetaobject::init_qt_to_rust;
use qmetaobject::prelude::*;

mod bridge;

qrc!(
    init_resource,
    "" {
        "qtquickcontrols2.conf",
    },
    // "qml" {
    //     "qml/swiss_knife/main.qml" as "main.qml",
    //     "qml/swiss_knife/json2formdata.qml" as "json2formdata.qml",
    //     "qml/swiss_knife/urlencoding.qml" as "urlencoding.qml",
    // },
);

fn main() {
    match log4rs::init_file("log4rs.yml", Default::default()) {
        Ok(_) => log::info!("log4rs loading success"),
        _ => unreachable!(),
    };
    init_qt_to_rust();
    init_resource();
    let mut engine = QmlEngine::new();
    let obj = RefCell::new(bridge::Bridge::default());
    engine.set_object_property("_bridge".into(), unsafe { QObjectPinned::new(&obj) });
    engine.load_file("qml/swiss_knife/main.qml".into());
    engine.exec();
}
