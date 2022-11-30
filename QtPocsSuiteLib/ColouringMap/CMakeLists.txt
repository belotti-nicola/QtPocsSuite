target_link_libraries(appQtPocsSuite
    PRIVATE Qt6::Core
)

add_executable(colouringmap
    "cmbackend.cpp" "cmbackend.h"
)
