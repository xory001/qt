pragma Singleton

import QtQuick

QtObject {
    property int btnFontStdSize: 16
    property int btnFontSizeLarge2: btnFontStdSize + 2
    property int btnFontSizeLarge4: btnFontStdSize + 4
    property int btnFontSizeSmall2: btnFontStdSize - 2
    property int btnFontSizeSmall4: btnFontStdSize - 2

    //return Button Return
    property int btnReturnWid: 100
    property int btnReturnHei: 50
    property string btnReturnText: qsTr("Return")
}
