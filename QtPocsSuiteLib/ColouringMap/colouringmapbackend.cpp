#include "colouringmapbackend.h"
#include <QDebug>

ColouringMapBackend::ColouringMapBackend(QObject *parent)
    : QObject{parent}
{
    m_color = GREEN;

}


