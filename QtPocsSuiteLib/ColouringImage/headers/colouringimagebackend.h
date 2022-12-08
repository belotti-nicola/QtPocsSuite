#ifndef COLOURINGIMAGEBACKEND_H
#define COLOURINGIMAGEBACKEND_H

#include <QObject>
#include <QImage>

class ColouringImageBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Color color MEMBER m_color NOTIFY ColorChanged)
    Q_PROPERTY(QImage img MEMBER m_img NOTIFY ImgChanged)
public:
    enum Color{
        NONE=0,
        GREEN=1,
        RED=2,
        PURPLE=3,
        BLUE=4
    };
    Q_ENUM(Color)

    explicit ColouringImageBackend(QObject *parent = nullptr);

public slots:
    void paint();


signals:
    void ColorChanged();
    void ImgChanged();

private:
    Color m_color;
    QImage m_img;
};

#endif // COLOURINGIMAGEBACKEND_H
