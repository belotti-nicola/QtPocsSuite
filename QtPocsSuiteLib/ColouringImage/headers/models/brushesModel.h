#ifndef BRUSHESMODEL_H
#define BRUSHESMODEL_H

#include <QAbstractListModel>

class BrushesModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum RoleNames {
        BrushName = Qt::UserRole,
        ConcreteBrush = Qt::UserRole+1,
    };
    BrushesModel(QObject *parent = nullptr);
    ~BrushesModel();
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
protected:
    // return the roles mapping to be used by QML
    virtual QHash<int, QByteArray> roleNames() const override;
private:
    QList<QColor> m_data;
    QHash<int, QByteArray> m_brushNames;
};

#endif // BRUSHESMODEL_H
