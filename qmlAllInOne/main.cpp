#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "src/audioVideo/cvideoprovider.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    //regisger cpp module to qml
    QQmlContext* rootCtx = engine.rootContext();

    CVideoProvider* pVideoProvider = new CVideoProvider( &app );
    rootCtx->setContextProperty( "cppVideoProvider", pVideoProvider );

    //qmlRegisterType<CVideoProvider>( "AudioVideo", 1, 0, "VideoProvider");

    engine.loadFromModule("qmlAllInOne", "Main");

    return app.exec();
}
