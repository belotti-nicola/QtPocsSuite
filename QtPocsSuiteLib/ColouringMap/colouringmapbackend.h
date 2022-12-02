#ifndef COLOURINGMAPBACKEND_H
#define COLOURINGMAPBACKEND_H

#include <QObject>

class ColouringMapBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Colors Color READ Color  WRITE setColor  NOTIFY ColorChanged)

public:

    enum Colors{
        NONE=0,
        GREEN=1,
        RED=2,
        PURPLE=3,
        BLUE=4
    };
    Q_ENUM(Colors)


    void setColor(Colors c);
    explicit ColouringMapBackend(QObject *parent = nullptr);

signals:
    void ColorChanged();

private:
    Colors m_color;

};

#endif // COLOURINGMAPBACKEND_H
