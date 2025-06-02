#include "backend.h"

CBackend::CBackend(QObject *parent)
    : QObject{parent}
{}

void CBackend::receive(const QString &msg)
{
    emit message( msg );
}

CBackend2::CBackend2(QObject *parent) : QObject{parent}
{

}

void CBackend2::receive(const QString &msg)
{
    emit message( msg );
}
