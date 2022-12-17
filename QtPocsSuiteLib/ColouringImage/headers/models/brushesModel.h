#ifndef BRUSHESMODEL_H
#define BRUSHESMODEL_H

#include <QAbstractListModel>

class BrushesModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum BrushM {

    };
    BrushesModel(QObject *parent = nullptr);

};


#endif // BRUSHESMODEL_H
