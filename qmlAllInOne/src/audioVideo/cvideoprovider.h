#ifndef CVIDEOPROVIDER_H
#define CVIDEOPROVIDER_H

#include <QObject>
#include <QVideoSink>
#include <QTimer>

class CVideoProvider : public QObject
{
    Q_OBJECT
public:
    explicit CVideoProvider(QObject *parent = nullptr);

public:
    Q_PROPERTY(QVideoSink* videoSink READ videoSink WRITE setVideoSink NOTIFY videoSinkChanged FINAL);

    QVideoSink *videoSink() const;
    void setVideoSink(QVideoSink *newVideoSink);

public slots:
   // void start(){ m_timerFrameGenerate.start( 20 ); }
   // void stop(){ m_timerFrameGenerate.stop(); }

signals:
    void videoSinkChanged();

private:
    void fillFrame();
    void onTimerOut();

private:
    QTimer m_timerFrameGenerate;
    QVideoSink *m_pVideoSink = nullptr;
};

#endif // CVIDEOPROVIDER_H
