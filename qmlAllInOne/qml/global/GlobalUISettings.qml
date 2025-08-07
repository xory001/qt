pragma Singleton

import QtQuick

QtObject {
    property int btnFontSizeStd: 16
    property int btnFontSizeLarge2: btnFontSizeStd + 2
    property int btnFontSizeLarge4: btnFontSizeStd + 4
    property int btnFontSizeSmall2: btnFontSizeStd - 2
    property int btnFontSizeSmall4: btnFontSizeStd - 4

    //return Button Return
    property int btnReturnWid: 100
    property int btnReturnHei: 50
    property string btnReturnText: qsTr("Return")

    //header
    property int headerHeight: 50
}
