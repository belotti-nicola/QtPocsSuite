#ifndef COLOURINGMAPBACKEND_H
#define COLOURINGMAPBACKEND_H

#include <QObject>

class ColouringMapBackend : public QObject
{
    Q_OBJECT
public:
    explicit ColouringMapBackend(QObject *parent = nullptr);
signals:

};

#endif // COLOURINGMAPBACKEND_H
