cmake_minimum_required(VERSION 3.16)

project(qmlAllInOne VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Multimedia)


qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appqmlAllInOne
    main.cpp
)

target_link_libraries(appqmlAllInOne PRIVATE Qt6::Multimedia)
target_link_libraries(appqmlAllInOne PRIVATE Qt6::Quick)

set(qml_singletons
    qml/global/GlobalUISettings.qml
    qml/global/GlobalTest.qml

)
set_source_files_properties(${qml_singletons} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appqmlAllInOne
    URI qmlAllInOne
    VERSION 1.0
    QML_FILES qml/Main.qml
    QML_FILES qml/Navigate.qml
    QML_FILES qml/baseComponent/PixLine.qml
    QML_FILES ${qml_singletons}
    QML_FILES qml/audioVideo/AVDisplay.qml

    SOURCES src/audioVideo/cvideoprovider.h src/audioVideo/cvideoprovider.cpp



)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqmlAllInOne PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqmlAllInOne
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)



include(GNUInstallDirs)
install(TARGETS appqmlAllInOne
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
