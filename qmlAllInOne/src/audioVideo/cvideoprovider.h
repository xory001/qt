#ifndef CVIDEOPROVIDER_H
#define CVIDEOPROVIDER_H

#include <QObject>

class CVideoProvider : public QObject
{
    Q_OBJECT
public:
    explicit CVideoProvider(QObject *parent = nullptr);

signals:
};

#endif // CVIDEOPROVIDER_H
