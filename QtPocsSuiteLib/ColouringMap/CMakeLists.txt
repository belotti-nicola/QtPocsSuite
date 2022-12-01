add_library(colouringmap
    "colouringmapbackend.cpp" "colouringmapbackend.h"
)

target_link_libraries(colouringmap
    PRIVATE Qt6::Core
)
