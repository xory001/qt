#include "ctaskmanager.h"
#include "logs.h"

CTask::CTask()
{
    connect( this, &CTask::sgAddLog, this, &CTask::stAddLog );
}

bool CTask::stAddLog( const QString& log )
{
    m_log = log;
    LDEBUG( "log = " << log );
    emit sgOnAddLog( m_log );
    return true;
}

Q_INVOKABLE bool CTask::addLog( const QString& log )
{
    m_log = log;
    LDEBUG( "log = " << log );
    emit sgAddLog( m_log + " from addLog" );
    return true;
}


CTaskManager::CTaskManager(QObject *parent)
    : QObject{parent}
{}



QString CTask::logText() const
{
    LDEBUG( "m_logText = " << m_logText );
    return m_logText;
}

void CTask::setLogText(const QString &newLogText)
{
    LDEBUG( "newLogText = " << newLogText );
    if (m_logText == newLogText)
        return;
    m_logText = newLogText;
    emit logTextChanged();
}
