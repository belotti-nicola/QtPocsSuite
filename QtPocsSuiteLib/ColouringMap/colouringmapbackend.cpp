#include "colouringmapbackend.h"
#include <QDebug>

ColouringMapBackend::ColouringMapBackend(QObject *parent)
    : QObject{parent}
{
    m_color = NONE;
    m_img = QImage("qrc:/QtPocsSuite/utils/worldmap.png");
}

