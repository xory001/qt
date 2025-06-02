#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class CBackend : public QObject
{
    Q_OBJECT
public:
    explicit CBackend(QObject *parent = nullptr);
    static CBackend* Inst()
    {
        static CBackend _sbackend;
        return &_sbackend;
    }

    Q_INVOKABLE void receive(const QString& msg );

signals:
    void message( QString msg );
};

class CBackend2 : public QObject
{
    Q_OBJECT
public:
    explicit CBackend2(QObject *parent = nullptr);

    Q_INVOKABLE void receive(const QString& msg );

signals:
    void message( QString msg );
};

#endif // BACKEND_H
