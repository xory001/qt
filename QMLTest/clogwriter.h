#ifndef CLOGWRITER_H
#define CLOGWRITER_H

#include <QObject>
#include <QThread>
#include <QMutexLocker>
#include <QMutex>
#include <QWaitCondition>

/*
 * Usage:
 * 1. call init() when app start;
 * 2. call stop() when app exit;
 */

class CLogWriter : public QThread
{
    Q_OBJECT

public:
static CLogWriter& inst()
    {
    static CLogWriter _slogWriter;
        return _slogWriter;
    }

public:
    void init( const QString& logPath )
    {
        m_logPath = logPath;
        start();
    }

    Q_INVOKABLE void addLog( const QString& log )
    {
        {
            QMutexLocker locker( &m_mutex );
            if ( m_bExit )
            {
                return;
            }
            m_listLog.push_back( log );
        }
        m_waitCondition.notify_one();
    }

    void stop()
    {
        {
            QMutexLocker locker( &m_mutex );
            m_bExit = true;
        }
        m_waitCondition.notify_one();
    }

protected:
    virtual void run() override;


private:
    explicit CLogWriter(QObject *parent = nullptr);

private:
    bool m_bExit = false;
    QString m_logPath;

    QWaitCondition m_waitCondition;
    QMutex m_mutex;
    QList<QString> m_listLog;
};

#endif // CLOGWRITER_H
