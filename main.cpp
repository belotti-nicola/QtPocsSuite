#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>
#include <QQuickView>

#include <QtQml/qqmlregistration.h>
#include <QQmlContext>
#include <QQmlApplicationEngine>


#include <QtPocsSuiteLib/ColouringImage/headers/colouringimagebackend.h>
#include <QtPocsSuiteLib/ColouringImage/headers/paintingpreview_provider.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;
    app.setWindowIcon(QIcon("QtPocsSuite/utils/icon.ico"));

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QtPocsSuite/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QQmlContext* rootContext = engine.rootContext();
    ColouringImageBackend cmbackend;
    rootContext->setContextProperty("cmbackend",&cmbackend);

    engine.addImageProvider("ColouringImage", new PaintingPreview_Provider);
    view.setSource(QUrl("QtPocsSuite/concretepocs/ColouringImage.qml"));
    view.show();



    engine.load(url);
    return app.exec();
}
