include_directories(colouringmap PRIVATE
    "headers"
    "sources"
)

add_library(colouringmap
    "sources/colouringmapbackend.cpp"
    "headers/colouringmapbackend.h"
)

target_link_libraries(colouringmap
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
)
