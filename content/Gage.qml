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


    function fetchNewVal() { //updates value + changes color based on a range (range is TBC)
        text2.text = qsTr(bridge.updateGage(name))
        if (text2.text==="N/A"){
           value_color= "#FF0000"; //red
        }
        else if(name==="PTC001" || name==="PTC002" || name==="PT003"){ //PT Chamber sensors
           if(Math.abs(parseInt(text2.text)-375) <=2) {//within +/- 2 psi of expected value
               value_color= "#00FF00"; //green
        }
           else if(Math.abs(parseInt(text2.text)-375) >2 && Math.abs(parseInt(text2.text)-375)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
               value_color= "#FFFF00"; //yellow
        }
           else if(Math.abs(parseInt(text2.text)-375) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
               value_color= "#FF0000"; //red
        }
    }
        else if(name==="TCC001" || name==="TCC002"){ //TC Chamber sensors
            if(Math.abs(parseInt(text2.text)-2464) <=10) {//within +/- 2 K of expected value
                value_color= "#00FF00"; //green
         }
            else if(Math.abs(parseInt(text2.text)-2464) >10 && Math.abs(parseInt(text2.text)-2464)<=50) { //more than +/- 2 K but within +/-10 K of expected value
                value_color= "#FFFF00"; //yellow
         }
            else if(Math.abs(parseInt(text2.text)-2464) >50) { //more than +/- 2 K but within +/- 5 K of expected value
                value_color= "#FF0000"; //red
         }
     }

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

