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
    pixmap.fill(QColor(id).rgba());

    // write the color name
    QPainter painter(&pixmap);
    QFont f = painter.font();
    f.setPixelSize(20);
    painter.setFont(f);
    painter.setPen(Qt::black);
    if (requestedSize.isValid())
        painter.scale(requestedSize.width() / width, requestedSize.height() / height);
    painter.drawText(QRectF(0, 0, width, height), Qt::AlignCenter, id);

    return pixmap;
}

