#include <QColor>

#include "../../headers/models/brushesModel.h"



BrushesModel::BrushesModel(QObject *parent): QAbstractListModel(parent) {
    m_brushNames[BrushName] = "brushname";
    m_brushNames[ConcreteBrush] = "concretebrush";

    m_data.append(QColor("white"));
    m_data.append(QColor("grey"));
    m_data.append(QColor("black"));

}

BrushesModel::~BrushesModel(){
}

int BrushesModel::rowCount(const QModelIndex &parent) const{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant BrushesModel::data(const QModelIndex &index, int role) const{
    int row = index.row();
    if(row < 0 || row >= m_data.count()) {
        return QVariant();
    }
    const QColor& color = m_data.at(row);

    switch(role) {
    case BrushName:
        return color.name();
    case ConcreteBrush:
        return "a";
    }
    return QVariant();
}

QHash<int, QByteArray> BrushesModel::roleNames() const{
    return m_brushNames;
}

