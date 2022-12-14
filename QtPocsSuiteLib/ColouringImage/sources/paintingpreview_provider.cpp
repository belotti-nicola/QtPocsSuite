#include <paintingpreview_provider.h>
#include <QQuickImageProvider>
#include <QPainter>
#include <QDebug>

PaintingPreview_Provider :: PaintingPreview_Provider()
    : QQuickImageProvider(QQuickImageProvider::Pixmap)
{
}

QPixmap PaintingPreview_Provider :: requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    int width =  50;
    int height = 50;

    if (size)
        *size = QSize(width, height);
    QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                           requestedSize.height() > 0 ? requestedSize.height() : height);
    pixmap.fill(QColor("red").rgba());

    return pixmap;
}

