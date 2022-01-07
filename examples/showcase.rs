use anyhow::Result;
use flexi_logger::{
    colored_detailed_format, Age, Cleanup, Criterion, Duplicate, FileSpec, LevelFilter,
    LogSpecification, Logger, Naming,
};
use qmetaobject::init_qt_to_rust;
use qmetaobject::prelude::*;

qrc!(
    init_resource,
    "" {
        "qtquickcontrols2.conf",
        "qml/showcase/TextDemo.qml" as "TextDemo.qml",
        "qml/showcase/main.qml" as "main.qml",
        "qml/showcase/ButtonDemo.qml" as "ButtonDemo.qml",
        "qml/showcase/ChoiceButtonDemo.qml" as "ChoiceButtonDemo.qml",
        "qml/showcase/SelectorDemo.qml" as "SelectorDemo.qml",
        "qml/showcase/IndicatorDemo.qml" as "IndicatorDemo.qml",
        "qml/showcase/ListViewDemo.qml" as "ListViewDemo.qml",
        "qml/showcase/DragDropDemo.qml" as "DragDropDemo.qml",
        "qml/showcase/DialogDemo.qml" as "DialogDemo.qml",
        "qml/showcase/AnimatorDemo.qml" as "AnimatorDemo.qml",
        "qml/showcase/AnimationDemo.qml" as "AnimationDemo.qml",
        "qml/showcase/LayoutDemo.qml" as "LayoutDemo.qml",
    },
);

fn main() -> Result<()> {
    setup_logger()?;
    init_qt_to_rust();
    init_resource();
    let mut engine = QmlEngine::new();
    // engine.load_file("qrc:main.qml".into());
    engine.load_file("qml/showcase/main.qml".into());
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
