#ifndef CTHREADINFO_H
#define CTHREADINFO_H

#include <QObject>
#include <QThread>
#include <QDebug>

class CThreadInfo : public QObject
{
    Q_OBJECT
public:
    explicit CThreadInfo(QObject *parent = nullptr);

    Q_PROPERTY(QString info READ info WRITE setInfo NOTIFY infoChanged FINAL);
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged FINAL);


public slots:
    quintptr GetThreadId( const QString& strPrefix ){
        qDebug() << "[" << __FUNCTION__ << ":" << __LINE__ << "][" << "strPrefix = " << strPrefix;
        return (quintptr)QThread::currentThreadId();
    }

    QString GetThreadIdStr( const QString& strPrefix ){
        qDebug() << "[" << __FUNCTION__ << ":" << __LINE__ << "][" << "strPrefix = " << strPrefix;
        return QString::number( (quintptr)QThread::currentThreadId() );
    }

public:
    Q_INVOKABLE int Add( int a, int b ){
        qDebug() << "Add, " << "a = " << a << ", b = " << b;
        return a + b;
    }

    QString info() const;
    void setInfo(const QString &newInfo);

    int age() const;
    void setAge(int newAge);

signals:
    void infoChanged();
    void ageChanged();

private:
    QString m_info;
    int m_age;
};

#endif // CTHREADINFO_H
