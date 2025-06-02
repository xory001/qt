#ifndef CTASKMANAGER_H
#define CTASKMANAGER_H

#include <QObject>
#include <QThread>
#include <QSharedPointer>

//call slot function "processSlot" in main thread, but "processSlot" runs in sub thread.
//QMetaObject::invokeMethod(worker, "processSlot", Qt::QueuedConnection, Q_ARG(QString, "text"));

class IMsg : public QObject
{
    Q_OBJECT
public:
    IMsg() {}
    virtual ~IMsg() {}

public:
    virtual void onMsgHandle() = 0;

};


class CTask : public QObject
{
    Q_OBJECT
public:
    CTask();
    virtual ~CTask() {}

    Q_PROPERTY(QString logText READ logText WRITE setLogText NOTIFY logTextChanged FINAL); //qml script use inst.logText, make sure this instance is in main thread. otherwise error.
signals:
    void sgAddLog( const QString& log );
    void sgOnAddLog( const QString& log );
    //void addMsg( const QSharedPointer<IMsg>& msg );
    //void onAddMsg();

    void logTextChanged();

public slots:
    bool stAddLog( const QString& log );

public:
    Q_INVOKABLE bool addLog( const QString& log ); //Q_INVOKABLE func, qml script direct calls "addLog" in main thread, and executes "addLog" in main thread, even this instance has called moveToThread.

    QString logText() const;
    void setLogText(const QString &newLogText);

private:
    QString m_log;
    QString m_logText;
};

class CTaskManager : public QObject
{
    Q_OBJECT
public:
    explicit CTaskManager(QObject *parent = nullptr);

signals:

public slots:

public:

private:
    QThread m_thread;
    QSharedPointer<CTask> m_task;
};

#endif // CTASKMANAGER_H
