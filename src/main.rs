// #![windows_subsystem = "windows"]
use anyhow::Result;
use flexi_logger::{
    colored_detailed_format, Age, Cleanup, Criterion, Duplicate, FileSpec, LevelFilter,
    LogSpecification, Logger, Naming,
};
use qmetaobject::init_qt_to_rust;
use qmetaobject::prelude::*;
use qmetaobject::QObjectPinned;
use std::cell::RefCell;
use std::error::Error;

pub mod bridge;

qrc!(
    init_resource,
    "" {
        "qtquickcontrols2.conf",
    },
    // "qml" {
    //     "qml/swiss_knife/main.qml" as "main.qml",
    //     "qml/swiss_knife/en-de-coding.qml" as "en-de-coding.qml",
    // },
);

fn main() -> Result<(), Box<dyn Error>> {
    setup_logger()?;
    init_qt_to_rust();
    init_resource();
    let mut engine = QmlEngine::new();
    let obj = RefCell::new(self::bridge::Bridge::default());
    engine.set_object_property("_bridge".into(), unsafe { QObjectPinned::new(&obj) });
    // engine.load_file("qrc:/qml/main.qml".into());
    engine.load_file("qml/swiss_knife/main.qml".into());
    engine.exec();

    Ok(())
}

fn setup_logger() -> Result<()> {
    let mut builder = LogSpecification::builder();
    builder.default(LevelFilter::Trace);
    let logger = Logger::with(builder.build());
    logger
        .format(colored_detailed_format)
        .duplicate_to_stdout(Duplicate::Trace)
        .log_to_file(
            FileSpec::default()
                .directory("logs")
                .basename("app")
                .suffix("log")
                .suppress_timestamp(),
        )
        .append()
        .rotate(
            Criterion::Age(Age::Day),
            Naming::Timestamps,
            Cleanup::KeepCompressedFiles(7),
        )
        .print_message()
        .start()?;

    Ok(())
}
