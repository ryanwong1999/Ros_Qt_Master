#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "desktop.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    qmlRegisterType<MyDesktop>("myDesktop", 1, 0, "MyDesktop");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    MyDesktop *myDesktop = new MyDesktop();
    engine.rootContext()->setContextProperty("myDesktop", myDesktop);

    engine.load(url);

    return app.exec();
}
