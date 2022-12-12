#ifndef COLOURINGIMAGEBACKEND_H
#define COLOURINGIMAGEBACKEND_H

#include <QObject>
#include <QImage>

class ColouringImageBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Color color MEMBER m_color NOTIFY ColorChanged)
    Q_PROPERTY(QImage image MEMBER m_image NOTIFY ImageChanged)
    Q_PROPERTY(Brush brush MEMBER m_brush NOTIFY BrushChanged)
    Q_PROPERTY(int borderWidth MEMBER m_borderWidth NOTIFY BorderWidthChanged)
public:
    enum Color{
        NONE=0,
        GREEN=1,
        RED=2,
        PURPLE=3,
        BLUE=4
    };
    Q_ENUM(Color)

    enum Brush{
        SOLID,
        DENSE1,
        DENSE2,
        DENSE3,
        DENSE4,
        DENSE5,
        DENSE6,
        DENSE7,
        DENSE8,
        HORIZONTAL,
        VERTICAL,
        CROSS,
        BDIAG,
        FDIAG,
        DIAGCROSS,
        LINEARGRADIENT,
        RADIALGRADIENT,
        CONICALGRADIENT
    };
    Q_ENUM(Brush)


    explicit ColouringImageBackend(QObject *parent = nullptr);

public slots:
    void paint();

signals:
    void ColorChanged();
    void ImageChanged();
    void BrushChanged();
    void BorderWidthChanged();
private:
    Color m_color;
    QImage m_image;
    QImage m_painting_preview;
    Brush m_brush;
    int m_borderWidth;
    void preview_generator(Color c,Brush b,int borderWidth);

};

#endif // COLOURINGIMAGEBACKEND_H
