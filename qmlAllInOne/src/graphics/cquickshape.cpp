#include <QPainter>
#include "cquickshape.h"

CQuickShape::CQuickShape() {}

void CQuickShape::paint(QPainter *painter)
{
    QRect rect;
    rect.setRect( 4, 4, width() - 8, height() - 8 );
    painter->fillRect( rect, QColor( 0xff, 0xff, 0 ));
}
