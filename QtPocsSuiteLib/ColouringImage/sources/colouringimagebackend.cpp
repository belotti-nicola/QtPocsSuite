#include "colouringimagebackend.h"
#include <QDebug>
#include <QPainterPath>
#include <QPainter>
#include <QBrush>

#include <paintingpreview_provider.h>

ColouringImageBackend::ColouringImageBackend(QObject *parent)
    : QObject{parent}
{
    //default values
    m_color = RED;
    m_image = QImage(":/QtPocsSuite/utils/maps/concrete_maps/canvas1.png");
    m_brush = SOLID;
    m_borderWidth = 1;

    this->preview_generator(RED,SOLID,1);
}

void ColouringImageBackend::paint(){

    QPolygon poly;
    QPainterPath path;
    poly << QPoint(128, 28)
             << QPoint(33, 97)
             << QPoint(69, 209)
             << QPoint(187, 209)
             << QPoint(223, 97);
    path.addPolygon(poly);

    QPainter painter(&m_image);
    painter.fillPath(path,QBrush(Qt::green));
}

void ColouringImageBackend::preview_generator(Color c,Brush b,int borderWidth){

}
