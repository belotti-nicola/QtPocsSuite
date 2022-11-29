#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("QtPocsSuite/utils/icon.ico"));

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QtPocsSuite/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
