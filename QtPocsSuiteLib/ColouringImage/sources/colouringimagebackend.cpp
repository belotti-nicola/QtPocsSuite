#include "colouringimagebackend.h"
#include <QDebug>
#include <QPainterPath>
#include <QPainter>
#include <QBrush>

#include <paintingpreview_provider.h>
#include "ColouringSupportedDefinitions.h"

ColouringImageBackend::ColouringImageBackend(QObject *parent)
    : QObject{parent}
{
    //default values
    m_color = ColouringSupportedDefinitions::RED;
    m_image = QImage(":/QtPocsSuite/utils/maps/concrete_maps/canvas1.png");
    m_brush = ColouringSupportedDefinitions::SOLID;
    m_borderWidth = 2;

    this->preview_generator(ColouringSupportedDefinitions::RED,ColouringSupportedDefinitions::SOLID,1);
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

void ColouringImageBackend::preview_generator(ColouringSupportedDefinitions::Color c,ColouringSupportedDefinitions::Brush b,int borderWidth){
//this method is called every times a property changes.
//connection is in the main.cpp file.


}


