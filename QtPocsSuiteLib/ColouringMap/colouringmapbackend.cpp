#include "colouringmapbackend.h"
#include <QDebug>

ColouringMapBackend::ColouringMapBackend(QObject *parent)
    : QObject{parent}
{


}

void ColouringMapBackend::setColor(ColouringMapBackend::Colors c) {
    qDebug() << c;
}

