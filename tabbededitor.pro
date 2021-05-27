# Qt Creator linking

QTC_PLUGIN_NAME = TabbedEditor
QTC_LIB_DEPENDS += \
    extensionsystem \
    utils
QTC_PLUGIN_DEPENDS += \
    coreplugin \
    projectexplorer \
    texteditor

# Qt Creator linking

IDE_SOURCE_PATH = "/home/cst/qt-creator-opensource-src-4.11.1"

## Either set the IDE_SOURCE_TREE when running qmake,
## or set the QTC_SOURCE environment variable, to override the default setting
isEmpty(IDE_SOURCE_TREE): IDE_SOURCE_TREE = $$(QTC_SOURCE)
isEmpty(IDE_SOURCE_TREE): IDE_SOURCE_TREE = $${IDE_SOURCE_PATH}

## Either set the IDE_BUILD_TREE when running qmake,
## or set the QTC_BUILD environment variable, to override the default setting
isEmpty(IDE_BUILD_TREE): IDE_BUILD_TREE = $$(QTC_BUILD)
isEmpty(IDE_BUILD_TREE): IDE_BUILD_TREE = $${IDE_SOURCE_PATH}

## uncomment to build plugin into user config directory
## <localappdata>/plugins/<ideversion>
##    where <localappdata> is e.g.
##    "%LOCALAPPDATA%\QtProject\qtcreator" on Windows Vista and later
##    "$XDG_DATA_HOME/data/QtProject/qtcreator" or "~/.local/share/data/QtProject/qtcreator" on Linux
##    "~/Library/Application Support/QtProject/Qt Creator" on Mac
# USE_USER_DESTDIR = yes

include($${IDE_SOURCE_PATH}/src/qtcreatorplugin.pri)

DEFINES += TABBEDEDITOR_LIBRARY

# TabbedEditor files

SOURCES += \
    plugin.cpp \
    tabbar.cpp

HEADERS += \
    constants.h \
    plugin.h \
    tabbar.h

HEADERS +=./include/plog/*h
HEADERS +=./include/plog/Appenders/*
HEADERS +=./include/plog/Converters/*
HEADERS +=./include/plog/Appenders/*
HEADERS +=./include/plog/Formatters/*

RESOURCES += \
    resources/res.qrc

INCLUDEPATH+=./include/

OTHER_FILES += \
    README.md
