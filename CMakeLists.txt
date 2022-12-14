cmake_minimum_required(VERSION 3.16)

project(QtPocsSuite VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appQtPocsSuite
    main.cpp
)

qt_add_qml_module(appQtPocsSuite
    URI QtPocsSuite
    VERSION 1.0
    QML_FILES
        "main.qml"
        "QtPocsSuite/components/pocs/PocsHeader.qml"
        "QtPocsSuite/concretepocs/ColouringImage.qml"
        "QtPocsSuite/concretepocs/VideoStream/ChooseConcreteVideoStream.qml"
        "QtPocsSuite/concretepocs/VideoStream/HTTP.qml"
    RESOURCES
        "utils/maps/concrete_maps/canvas1.png"
        "utils/maps/concrete_maps/canvas2.png"
        "utils/maps/concrete_maps/worldmap.png"
        "utils/maps/concrete_maps/europemap.jpg"
        "utils/maps/concrete_maps/italymap.png"
        "utils/icon.ico"
)

add_subdirectory(QtPocsSuiteLib/ColouringImage)

set_target_properties(appQtPocsSuite PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtPocsSuite PRIVATE
    colouringimage
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Core)

install(TARGETS appQtPocsSuite
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
