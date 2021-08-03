use log::info;
use qmetaobject::{init_qt_to_rust, prelude::*};

qrc!(
    init_resource,
    // qml
    // "qml" {
    //     "qml/showcase/main.qml" as "main.qml",
    // },
    "" {
        "qtquickcontrols2.conf",
    },
);

fn main() {
    match log4rs::init_file("log4rs.yml", Default::default()) {
        Ok(_) => info!("log4rs loading success"),
        _ => unreachable!(),
    };
    init_qt_to_rust();
    init_resource();
    let mut engine = QmlEngine::new();
    engine.load_file("qml/showcase/main.qml".into());
    engine.exec();
}
