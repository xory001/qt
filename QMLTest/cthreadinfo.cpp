#include "cthreadinfo.h"

CThreadInfo::CThreadInfo(QObject *parent)
    : QObject{parent}
{

}

QString CThreadInfo::info() const
{
    return m_info;
}

void CThreadInfo::setInfo(const QString &newInfo)
{
    if (m_info == newInfo)
        return;
    m_info = newInfo;
    emit infoChanged();
}

int CThreadInfo::age() const
{
    return m_age;
}

void CThreadInfo::setAge(int newAge)
{
    if (m_age == newAge)
        return;
    m_age = newAge;
    emit ageChanged();
}
