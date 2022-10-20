import QtQuick
import QtQuick.Controls

Row {
    id: reading
    property string name: "XXX000"
    width: 180
    height: 31


    property color value_color: "#f20515"
    property string value: "0000.00"
    property string unit: "PSI"

    function fetchNewVal() {
        text2.text = qsTr(bridge.updateGage(name))
        if (text2.text==="N/A"){
           value_color= "#f20515"; //red color
        }
        else{
           value_color= "#2ad12f"; //green color
        }
        //add more color ranges based on readings...

    }


    padding: 5
    layoutDirection: Qt.LeftToRight

    Text {
        id: text1
        color: "#ffffff"
        text: qsTr(name + ":")
        font.pixelSize: 17
        rightPadding: 0
        font.family: "Arial"
    }

    Text {
        id: text2
        width: 74
        color: value_color
        text: qsTr(value)
        font.pixelSize: 17
        horizontalAlignment: Text.AlignRight
        rightPadding: 6
        font.family: "Arial"
    }

    Text {
        id: text3
        color: "#69eef0"
        text: qsTr(unit)
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
    }
}

