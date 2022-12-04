#include "colouringmapbackend.h"
#include <QDebug>
#include <QPainterPath>
#include <QPainter>
#include <QBrush>

ColouringMapBackend::ColouringMapBackend(QObject *parent)
    : QObject{parent}
{
    m_color = NONE;
    m_img = QImage(":/QtPocsSuite/utils/worldmap.png");
    qDebug() << m_img;
}

void ColouringMapBackend::paint(){

    QPolygon poly;
    QPainterPath path;
    poly << QPoint(128, 28)
             << QPoint(33, 97)
             << QPoint(69, 209)
             << QPoint(187, 209)
             << QPoint(223, 97);
    path.addPolygon(poly);

    QPainter painter(&m_img);
    painter.fillPath(path,QBrush(Qt::green));
}
