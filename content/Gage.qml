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
        var P_chamber = 375
        var P_LOX_Inlet = 470
        var P_Fuel_Inlet = 560
        var P_Fuel_Injector= 450
        var P_Siphon = 375
        var P_Nozzle= 550
        var T_chamber = 2464
        var T_LOX_Inlet = 30
        var T_Fuel_Inlet = 100
        var T_Fuel_Injector= 150
        var T_Siphon = 100

        text2.text = qsTr(bridge.updateGage(name))
        if (text2.text==="N/A"){
           value_color= "#FF0000"; //red
        }
        else if(name==="PTC001" || name==="PTC002" || name==="PT003"){ //PT Chamber sensors
           if(Math.abs(parseInt(text2.text)-P_chamber) <=2) {//within +/- 2 psi of expected value
               value_color= "#00FF00"; //green
        }
           else if(Math.abs(parseInt(text2.text)-P_chamber) >2 && Math.abs(parseInt(text2.text)-P_chamber)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
               value_color= "#FFFF00"; //yellow
        }
           else if(Math.abs(parseInt(text2.text)-P_chamber) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
               value_color= "#FF0000"; //red
        }
    }
        else if(name==="TCC001" || name==="TCC002"){ //TC Chamber sensors
            if(Math.abs(parseInt(text2.text)-T_chamber) <=10) {//within +/- 2 K of expected value
                value_color= "#00FF00"; //green
         }
            else if(Math.abs(parseInt(text2.text)-T_chamber) >10 && Math.abs(parseInt(text2.text)-T_chamber)<=50) { //more than +/- 2 K but within +/-10 K of expected value
                value_color= "#FFFF00"; //yellow
         }
            else if(Math.abs(parseInt(text2.text)-T_chamber) >50) { //more than +/- 2 K but within +/- 5 K of expected value
                value_color= "#FF0000"; //red
         }
     }
        else if(name==="PTX001" || name=="PTX002"){ //PT Siphon Lines sensors
            if(Math.abs(parseInt(text2.text)-P_Siphon) <=2) {//within +/- 2 psi of expected value
                value_color= "#00FF00"; //green
         }
            else if(Math.abs(parseInt(text2.text)-P_Siphon) >2 && Math.abs(parseInt(text2.text)-P_Siphon)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
                value_color= "#FFFF00"; //yellow
         }
            else if(Math.abs(parseInt(text2.text)-P_Siphon) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
                value_color= "#FF0000"; //red
         }
     }
        else if(name==="TCX001" || name==="TCX002"){ //TC Siphone Lines sensors
            if(Math.abs(parseInt(text2.text)-T_Siphon) <=10) {//within +/- 2 K of expected value
                value_color= "#00FF00"; //green
         }
            else if(Math.abs(parseInt(text2.text)-T_Siphon) >10 && Math.abs(parseInt(text2.text)-T_Siphon)<=50) { //more than +/- 2 K but within +/-10 K of expected value
                value_color= "#FFFF00"; //yellow
         }
            else if(Math.abs(parseInt(text2.text)-T_Siphon) >50) { //more than +/- 2 K but within +/- 5 K of expected value
                value_color= "#FF0000"; //red
         }
     }
        else if(name==="PTO001" || name==="PTO002"){ //PT LOX Inlet Sensors
           if(Math.abs(parseInt(text2.text)-P_LOX_Inlet) <=2) {//within +/- 2 psi of expected value
               value_color= "#00FF00"; //green
        }
           else if(Math.abs(parseInt(text2.text)-P_LOX_Inlet) >2 && Math.abs(parseInt(text2.text)-P_LOX_Inlet)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
               value_color= "#FFFF00"; //yellow
        }
           else if(Math.abs(parseInt(text2.text)-P_LOX_Inlet) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
               value_color= "#FF0000"; //red
        }
    }
        else if(name==="TCO001"){ //TC LOX Inlet sensor
            if(Math.abs(parseInt(text2.text)-T_LOX_Inlet) <=10) {//within +/- 2 K of expected value
                value_color= "#00FF00"; //green
         }
            else if(Math.abs(parseInt(text2.text)-T_LOX_Inlet) >10 && Math.abs(parseInt(text2.text)-T_LOX_Inlet)<=50) { //more than +/- 2 K but within +/-10 K of expected value
                value_color= "#FFFF00"; //yellow
         }
            else if(Math.abs(parseInt(text2.text)-T_LOX_Inlet) >50) { //more than +/- 2 K but within +/- 5 K of expected value
                value_color= "#FF0000"; //red
         }
     }
        else if(name==="PTF004" || name==="PTF005"){ //PT Fuel Injector Sensors
           if(Math.abs(parseInt(text2.text)-P_Fuel_Injector) <=2) {//within +/- 2 psi of expected value
               value_color= "#00FF00"; //green
        }
           else if(Math.abs(parseInt(text2.text)-P_Fuel_Injector) >2 && Math.abs(parseInt(text2.text)-P_Fuel_Injector)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
               value_color= "#FFFF00"; //yellow
        }
           else if(Math.abs(parseInt(text2.text)-P_Fuel_Injector) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
               value_color= "#FF0000"; //red
        }
    }
        else if(name==="TCF003"){ //TC Fuel Injector sensor
            if(Math.abs(parseInt(text2.text)-T_Fuel_Injector) <=10) {//within +/- 2 K of expected value
                value_color= "#00FF00"; //green
         }
            else if(Math.abs(parseInt(text2.text)-T_Fuel_Injector) >10 && Math.abs(parseInt(text2.text)-T_Fuel_Injector)<=50) { //more than +/- 2 K but within +/-10 K of expected value
                value_color= "#FFFF00"; //yellow
         }
            else if(Math.abs(parseInt(text2.text)-T_Fuel_Injector) >50) { //more than +/- 2 K but within +/- 5 K of expected value
                value_color= "#FF0000"; //red
         }
     }
        else if(name==="PTF001" || name==="PTF003"){ //PT Fuel Inlet Sensor
           if(Math.abs(parseInt(text2.text)-P_Fuel_Inlet) <=2) {//within +/- 2 psi of expected value
               value_color= "#00FF00"; //green
        }
           else if(Math.abs(parseInt(text2.text)-P_Fuel_Inlet) >2 && Math.abs(parseInt(text2.text)-P_Fuel_Inlet)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
               value_color= "#FFFF00"; //yellow
        }
           else if(Math.abs(parseInt(text2.text)-P_Fuel_Inlet) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
               value_color= "#FF0000"; //red
        }
        }
        else if(name==="TCF001" || name==="TCF002"){ //TC Fuel Inlet sensor
               if(Math.abs(parseInt(text2.text)-T_Fuel_Inlet) <=10) {//within +/- 2 K of expected value
                   value_color= "#00FF00"; //green
            }
               else if(Math.abs(parseInt(text2.text)-T_Fuel_Inlet) >10 && Math.abs(parseInt(text2.text)-T_Fuel_Inlet)<=50) { //more than +/- 2 K but within +/-10 K of expected value
                   value_color= "#FFFF00"; //yellow
            }
               else if(Math.abs(parseInt(text2.text)-T_Fuel_Inlet) >50) { //more than +/- 2 K but within +/- 5 K of expected value
                   value_color= "#FF0000"; //red
            }
        }
        else if(name==="PTF002"){ //PT Nozzle Sensor
           if(Math.abs(parseInt(text2.text)-P_Nozzle) <=2) {//within +/- 2 psi of expected value
               value_color= "#00FF00"; //green
        }
           else if(Math.abs(parseInt(text2.text)-P_Nozzle) >2 && Math.abs(parseInt(text2.text)-P_Nozzle)<=10) { //more than +/- 2 psi but within +/-10 psi of expected value
               value_color= "#FFFF00"; //yellow
        }
           else if(Math.abs(parseInt(text2.text)-P_Nozzle) >10) { //more than +/- 2 psi but within +/- 5 psi of expected value
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

