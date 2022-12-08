include_directories(colouringimage PRIVATE
    "headers"
    "sources"
)

add_library(colouringimage
    "sources/colouringimagebackend.cpp"
    "headers/colouringimagebackend.h"
)

target_link_libraries(colouringimage
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
)
