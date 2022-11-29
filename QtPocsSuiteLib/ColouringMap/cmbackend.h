#ifndef CMBACKEND_H
#define CMBACKEND_H

#include <QObject>
#include <QPoint>

enum class Colors {
    Green,
    Purple,
    Red,
    Blue
};

class CMBackend
{
public:
    CMBackend();
    Colors currentColor;
    QPoint currentPoint;

};

#endif // CMBACKEND_H
