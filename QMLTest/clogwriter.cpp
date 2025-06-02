#include "clogwriter.h"
#include "logs.h"

CLogWriter::CLogWriter(QObject *parent)
    : QThread{parent}
{

}


void CLogWriter::run()
{
    qDebug( "CLogWriter::run enter" );

    QList<QString> list;

    while( !m_bExit )
    {
        {
            QMutexLocker locker( &m_mutex );
            if ( m_listLog.empty() )
            {
                m_waitCondition.wait( &m_mutex, 100 );
                continue;
            }

             m_listLog.swap( list );
        }

        if ( !list.empty() )
        {
            //write to file
            LDEBUG( "list size =" << m_listLog.size() );
            for ( auto& log : list )
            {
                qDebug() << "write to file, line =" << log;
            }
            list.clear();
        }
    }

    {
        QMutexLocker locker( &m_mutex );
        if ( !m_listLog.empty() )
        {
           m_listLog.swap( list );
        }
    }

    if ( !list.empty() )
    {
        //write to file
        LDEBUG( "list size =" << m_listLog.size() );
        for ( auto& log : list )
        {
            qDebug() << "write to file, line =" << log;
        }
        list.clear();
    }

    qDebug( "CLogWriter::run exit" );
}
