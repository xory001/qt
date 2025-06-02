#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backend.h"
#include "cthreadinfo.h"
#include "logs.h"
#include "ctaskmanager.h"

QObject* GetBackend(QQmlEngine *, QJSEngine *)
{
    return CBackend::Inst();
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    logsInit( app, "" );
    LDEBUG( "app start, name =" << app.applicationName() );

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    CThreadInfo threadInfo;
    engine.rootContext()->setContextProperty( "g_threadInfo", &threadInfo );

    QThread thread;
    QSharedPointer<CTask> task = QSharedPointer<CTask>::create();
    task->moveToThread( &thread );
    thread.start();

    engine.rootContext()->setContextProperty( "g_task", task.get() );

    qmlRegisterSingletonType<CBackend>("My.CBackend", 1,0, "CBackend", GetBackend );
    engine.rootContext()->setContextProperty("CBackend2", new CBackend2(engine.rootContext()) );
    engine.loadFromModule("QMLTest", "Main");

    {
        QObject::connect( &app, &QCoreApplication::aboutToQuit, &app, [&]{
            LDEBUG( "app exit, name =" << app.applicationName() );
            thread.quit();
        });
    }


    return app.exec();
}

