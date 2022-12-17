#ifndef COLOURINGIMAGEBACKEND_H
#define COLOURINGIMAGEBACKEND_H

#include <QObject>
#include <QImage>
#include <QQmlEngine>

#include "ColouringSupportedDefinitions.h"


class ColouringImageBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(ColouringSupportedDefinitions::Color color MEMBER m_color NOTIFY ColorChanged)
    Q_PROPERTY(QImage image MEMBER m_image NOTIFY ImageChanged)
    Q_PROPERTY(ColouringSupportedDefinitions::Brush brush MEMBER m_brush NOTIFY BrushChanged)
    Q_PROPERTY(int borderWidth MEMBER m_borderWidth NOTIFY BorderWidthChanged)

public:

    explicit ColouringImageBackend(QObject *parent = nullptr);

public slots:
    void paint();

signals:
    void ColorChanged();
    void ImageChanged();
    void BrushChanged();
    void BorderWidthChanged();
private:
    ColouringSupportedDefinitions::Color m_color;
    QImage m_image;
    QImage m_painting_preview;
    ColouringSupportedDefinitions::Brush m_brush;
    int m_borderWidth;
    void preview_generator(ColouringSupportedDefinitions::Color c,
                           ColouringSupportedDefinitions::Brush b,
                                                          int borderWidth);

};

#endif // COLOURINGIMAGEBACKEND_H
