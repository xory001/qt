#include <QVideoFrame>
#include <QImage>
#include <QRandomGenerator>
//#include <QAbstractVideoBuffer>
#include "cvideoprovider.h"

CVideoProvider::CVideoProvider(QObject *parent)
    : QObject{parent}
{
    connect( &m_timerFrameGenerate, &QTimer::timeout, this, &CVideoProvider::onTimerOut );
}

QVideoSink *CVideoProvider::videoSink() const
{
    return m_pVideoSink;
}

void CVideoProvider::setVideoSink(QVideoSink *newVideoSink)
{
    if (m_pVideoSink == newVideoSink)
        return;
    m_pVideoSink = newVideoSink;
    emit videoSinkChanged();
    //m_timerFrameGenerate.setInterval( 20 );

    if ( m_pVideoSink )
    {
        m_timerFrameGenerate.start(100);
    }
    else
    {
        m_timerFrameGenerate.stop();
    }
}

void CVideoProvider::onTimerOut()
{
    if ( m_pVideoSink )
    {
        // QImage frame(4000, 3000, QImage::Format_RGB32); //Format_RGB32

        // int value = QRandomGenerator::global()->bounded(256);  // [0, 255]
        // frame.fill( QColor( value, 0, 0)); // 模拟帧数据

        // // 转换为 QVideoFrame
        // QVideoFrame videoFrame(frame);

        const int width = 4000;
        const int height = 3000;
        QVideoFrameFormat format(QSize(width, height), QVideoFrameFormat::Format_YUYV);
        QVideoFrame videoFrame(format);

        if (!videoFrame.map(QVideoFrame::WriteOnly)) {
            //qDebug() << "无法映射 QVideoFrame";
            return;
        }

        uchar *yuyvData = videoFrame.bits(0);
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; x += 2) {
                // 渐变效果：Y 随 x 变化，U/V 固定为蓝色
                int y0 = (x * 255) / width; // Y0 随 x 渐变
                int y1 = ((x + 1) * 255) / width; // Y1
                int u0 = QRandomGenerator::global()->bounded(256);//255; // 蓝色 U
                int v0 = QRandomGenerator::global()->bounded(256)/ 2; //107; // 蓝色 V

                int index = (y * width + x) * 2;
                yuyvData[index + 0] = y0; // Y0
                yuyvData[index + 1] = u0; // U0
                yuyvData[index + 2] = y1; // Y1
                yuyvData[index + 3] = v0; // V0
            }
        }

        videoFrame.unmap();

        m_pVideoSink->setVideoFrame( videoFrame );
    }
}
