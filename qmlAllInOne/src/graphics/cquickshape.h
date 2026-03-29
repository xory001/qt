#ifndef CQUICKSHAPE_H
#define CQUICKSHAPE_H

#include <QQuickPaintedItem>

class CQuickShape : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
public:
    CQuickShape();

public: // from QQuickPaintedItem
    virtual void paint(QPainter *painter);

signals:
};

#endif // CQUICKSHAPE_H
