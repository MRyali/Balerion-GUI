import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "content"

Item {
    id: window
//    width: 1920 * dpi_scale
//    height: 1080 * dpi_scale
    width: 2150 * dpi_scale
    height: 1250 * dpi_scale
    visible: true
    property real dpi_scale: 0.6
    scale: 1

    function updateElements() {
        // Refresh Helium PTs
        pto1.fetchNewVal()
        pto2.fetchNewVal()
        ptf5.fetchNewVal()
        ptx1.fetchNewVal()
        ptx2.fetchNewVal()
        ptf4.fetchNewVal()

        // Refresh LOx PTs
        ptc3.fetchNewVal()
        ptc2.fetchNewVal()
        ptc1.fetchNewVal()

        // Refresh Kerosene PTs
        ptf1.fetchNewVal()
        ptf2.fetchNewVal()
        ptf3.fetchNewVal()
        ptf204.fetchNewVal()

        // Refresh Temperature TCs
        tco1.fetchNewVal()
        tcf3.fetchNewVal()
        tcx1.fetchNewVal()

        tcx2.fetchNewVal()
        tcc1.fetchNewVal()
        tcc2.fetchNewVal()
        tcf1.fetchNewVal()

        tcf2.fetchNewVal()
        tcf202.fetchNewVal() 
        //ssh pi@192.168.50.3
    }

    Rectangle {
        id: background
        width: 2150
        height: 1250
        visible: true
        color: "#000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        transformOrigin: Item.Center
        scale: dpi_scale

        Rectangle {
            id: p8id
            width: 1720
            height: 878
            color: "#000000"
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: logo.bottom
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: 19
            anchors.leftMargin: 100
            anchors.rightMargin: 100

            Item {
                id: p8id_bg
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.leftMargin: 100
                anchors.topMargin: 8
                anchors.bottomMargin: 0
                Image {
                    id: engineOutline9
                    x: -1
                    y: 8
                    width: 1720
                    height: 847
                    source: "EngineOutline9.png"
                    sourceSize.width: 3000
                    fillMode: Image.PreserveAspectFit
                }
                Gage {
                    id: pto1
                    name: "PTO001"
                    x: 1272
                    y: 258
                    width: 184
                    height: 27
                }
                Gage {
                    id: tco1
                    name: "TCO001"
                    x: 1272
                    y: 52
                    width: 184
                    height: 29
                    unit: "ºC"
                }

                Gage {
                    id: tcf3
                    name: "TCF003"
                    x: 1272
                    y: 134
                    width: 184
                    height: 28
                    unit: "ºC"
                }

                Gage {
                    id: ptx1
                    name: "PTX001"
                    x: 1272
                    y: 315
                    width: 172
                    height: 33
                }

                Gage {
                    id: tcx1
                    name: "TCX001"
                    x: 1272
                    y: 345
                    width: 172
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: ptx2
                    name: "PTX002"
                    x: 1271
                    y: 415
                    width: 172
                    height: 33
                }

                Gage {
                    id: tcx2
                    name: "TCX002"
                    x: 1271
                    y: 445
                    width: 172
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: ptf1
                    name: "PTF001"
                    x: 1272
                    y: 753
                    width: 185
                    height: 29
                }

                Gage {
                    id: tcf1
                    name: "TCF001"
                    x: 1271
                    y: 815
                    width: 185
                    height: 29
                    unit: "ºC"
                }

                Gage {
                    id: ptf2
                    name: "PTF002"
                    x: 758
                    y: 686
                    width: 184
                    height: 29
                }

                Gage {
                    id: tcf2
                    name: "TCF002"
                    x: 1271
                    y: 548
                    width: 185
                    height: 30
                    unit: "ºC"
                }

                Gage {
                    id: ptf3
                    name: "PTF003"
                    x: 1271
                    y: 619
                    width: 185
                    height: 29
                }

                Gage {
                    id: tcc1
                    name: "TCC001"
                    x: 762
                    y: 421
                    width: 183
                    height: 29
                    unit: "ºC"
                }

                Gage {
                    id: pto2
                    name: "PTO002"
                    x: 800
                    y: 91
                    width: 186
                    height: 28
                }

                Gage {
                    id: ptf5
                    name: "PTF005"
                    x: 799
                    y: 14
                    width: 185
                    height: 29
                }

                Gage {
                    id: ptf4
                    name: "PTF004"
                    x: 795
                    y: 220
                    width: 184
                    height: 29
                }

                Gage {
                    id: ptc3
                    name: "PTC003"
                    x: 245
                    y: 315
                    width: 182
                    height: 27
                }

                Gage {
                    id: ptc2
                    name: "PTC002"
                    x: 246
                    y: 362
                    width: 176
                    height: 34
                }

                Gage {
                    id: tcc2
                    name: "TCC002"
                    x: 246
                    y: 392
                    width: 176
                    height: 29
                    unit: "ºC"
                }

                Gage {
                    id: ptc1
                    name: "PTC001"
                    x: 247
                    y: 461
                    width: 176
                    height: 28
                }
                Gage {
                    id: ptf204
                    name: "PTF204"
                    x: 188
                    y: 436
                    width: 176
                    height: 28
                    visible: false
                }
                Gage {
                    id: tcf202
                    name: "TCF202"
                    x: 188
                    y: 436
                    width: 176
                    height: 28
                    visible: false
                }


            }
        }


        Rectangle {
            id: logo
            width: 476
            height: 150
            color: "#000000"
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 100
            anchors.topMargin: 10

            Image {
                id: croppedLPL_Logo_512_square2
                x: 26
                width: 200
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "logo white.png"
                mipmap: true
                anchors.topMargin: 14
                anchors.bottomMargin: 14
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text1
                x: 250
                width: 200
                height: 63
                color: "#ffffff"
                text: qsTr("HOT FIRE MONITORING")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 29
                verticalAlignment: Text.AlignVCenter
                lineHeight: 1
                wrapMode: Text.WordWrap
                anchors.verticalCenterOffset: 0
                font.bold: false
                font.underline: false
            }
        }

        Rectangle {
            id: status_box
            x: 500
            width: 1207
            height: 150
            color: "#000000"
            border.color: "#ffffff"
            anchors.left: logo.right
            anchors.top: parent.top
            anchors.right: p8id.right
            anchors.leftMargin: 37
            anchors.topMargin: 10
            

            TextField {
                placeholderText: qsTr("Some Status Messages...")
                readOnly: true
                placeholderTextColor: "#000000"
                text:updateElements()
                font.pixelSize: 24
                anchors.fill: status_box
                anchors.leftMargin: 12
                anchors.rightMargin: 8
                anchors.topMargin: 10
                anchors.bottomMargin: 10
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/

