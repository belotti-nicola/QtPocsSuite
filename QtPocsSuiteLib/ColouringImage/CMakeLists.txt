include_directories(colouringimage PRIVATE
    "headers"
    "sources"
)

add_library(colouringimage
    "headers/ColouringSupportedDefinitions.h"
    "sources/colouringimagebackend.cpp"    "headers/colouringimagebackend.h"
    "sources/paintingpreview_provider.cpp" "headers/paintingpreview_provider.h"
)

target_link_libraries(colouringimage
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Quick
)
