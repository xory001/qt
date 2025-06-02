#ifndef __LOGS_H__
#define __LOGS_H__

#include <QCoreApplication>
#include <QDebug>
#include "clogwriter.h"

#define LDEBUG(msg) qDebug() << msg
#define LDEBUG_THIS(msg)  qDebug() << msg << "[0x" << this << "]"

#define LINFO(msg) qInfo() << msg
#define LINFO_THIS(msg)  qInfo() << msg << "[0x" << this << "]"

#define LWARN(msg) qWarning() << msg
#define LWARN_THIS(msg)  qWarning() << msg << "[0x" << this << "]"

#define LCRIT(msg) qCritical() << msg
#define LCRIT_THIS(msg)  qCritical() << msg << "[0x" << this << "]"

#define LFATAL(msg) qFatal() << msg
#define LFATAL_THIS(msg)  qFatal() << msg << "[0x" << this << "]"

inline void onLogsApplicationQuit( const QCoreApplication& app );

inline void logsInit( const QCoreApplication& app, const QString& logPath )
{
    qSetMessagePattern("[%{time yyyy-MM-dd hh:mm:ss.zzz}] [%{type}] [t=%{threadid}][%{function}:%{line}] [%{message}]");
    QObject::connect( &app, &QCoreApplication::aboutToQuit, [&app]() {
        onLogsApplicationQuit(app);
    } );

    CLogWriter::inst().init( logPath );
}

inline void onLogsApplicationQuit( const QCoreApplication& app )
{
    LINFO( "app exit");
    CLogWriter::inst().stop();
    CLogWriter::inst().wait();
}

/*
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QQueue>
#include <QMutex>
#include <QThread>

class LogWriter : public QObject {
    Q_OBJECT
    QFile logFile;
    QTextStream logStream;
    QQueue<QString> logQueue;
    QMutex queueMutex;

public:
    LogWriter() : logFile("debug.log") {
        if (logFile.open(QIODevice::Append | QIODevice::Text)) {
            logStream.setDevice(&logFile);
        }
    }

    ~LogWriter() { logFile.close(); }

public slots:
    void writeLog(const QString &msg) {
        QMutexLocker locker(&queueMutex);
        logQueue.enqueue(msg);
        while (!logQueue.isEmpty()) {
            logStream << logQueue.dequeue() << "\n";
            logStream.flush();
        }
    }
};

void fileMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString &msg) {
    static LogWriter* writer = nullptr;
    if (!writer) {
        writer = new LogWriter;
        writer->moveToThread(new QThread);
        writer->thread()->start();
    }
    QString logMsg = QString("[%1] [%2] [0x%3] [%4:%5] %6")
                        .arg(QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss.zzz"),
                             type == QtDebugMsg ? "Debug" : "Other",
                             QString::number((quintptr)context.object ? (quintptr)context.object : 0, 16),
                             context.function,
                             QString::number(context.line),
                             msg);
    QMetaObject::invokeMethod(writer, "writeLog", Qt::QueuedConnection, Q_ARG(QString, logMsg));
}
 */

#endif // LOGS_H
