#ifndef PAINTINGPREVIEW_PROVIDER_H
#define PAINTINGPREVIEW_PROVIDER_H


#include <QQuickImageProvider>

class PaintingPreview_Provider : public QQuickImageProvider
{
public:
    QImage preview;
    PaintingPreview_Provider();
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize) override;
};
#endif // PAINTINGPREVIEW_PROVIDER_H
