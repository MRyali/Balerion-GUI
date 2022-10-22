import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "content"

Item {
    id: window
    width: 1920 * dpi_scale
    height: 1080 * dpi_scale
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


        tco1.fetchNewVal()
        tcf3.fetchNewVal()
        tcx1.fetchNewVal()

        tcx2.fetchNewVal()
        tcc1.fetchNewVal()
        tcc2.fetchNewVal()
        tcf1.fetchNewVal()

        tcf2.fetchNewVal()
        tcf202.fetchNewVal()
    }

    Rectangle {
        id: background
        width: 1920
        height: 1080
        visible: true
        color: "#565656"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        transformOrigin: Item.Center
        scale: dpi_scale

        Rectangle {
            id: p8id
            width: 1600
            height: 850
            color: "#404040"
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: logo.bottom
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: 33
            anchors.leftMargin: 100
            anchors.rightMargin: 100

            Item {
                id: p8id_bg
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: -6
                Image {
                    id: mainPic
                    x: 274
                    y: 8
                    width: 1248
                    height: 840
                    source: "MainPic.png"
                    sourceSize.width: 3000
                    fillMode: Image.PreserveAspectFit
                }

               Gage {
                    id: pto1
                    name: "PT-O1"
                    x: 519
                    y: 27
                    width: 195
                    height: 31
                }
                Gage {
                    id: tco1
                    name: "TC-O1"
                    x: 1081
                    y: 125
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: tcf3
                    name: "TC-F3"
                    x: 1131
                    y: 172
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: ptx1
                    name: "PT-X1"
                    x: 1311
                    y: 258
                    width: 195
                    height: 33
                }

                Gage {
                    id: tcx1
                    name: "TC-X1"
                    x: 1311
                    y: 288
                    width: 195
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: ptx2
                    name: "PT-X2"
                    x: 1311
                    y: 352
                    width: 195
                    height: 33
                }

                Gage {
                    id: tcx2
                    name: "TC-X2"
                    x: 1311
                    y: 382
                    width: 195
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: ptf1
                    name: "PT-F1"
                    x: 1013
                    y: 668
                    width: 194
                    height: 31
                }

                Gage {
                    id: tcf1
                    name: "TC-F1"
                    x: 1012
                    y: 741
                    width: 194
                    height: 30
                    unit: "ºC"
                }

                Gage {
                    id: ptf2
                    name: "PT-F2"
                    x: 718
                    y: 800
                    width: 194
                    height: 31
                }

                Gage {
                    id: tcf2
                    name: "TC-F2"
                    x: 468
                    y: 737
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: ptf3
                    name: "PT-F3"
                    x: 468
                    y: 668
                    width: 195
                    height: 31
                }

                Gage {
                    id: tcc1
                    name: "TC-C1"
                    x: 994
                    y: 431
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pto2
                    name: "PT-O2"
                    x: 494
                    y: 122
                    width: 194
                    height: 31
                }

                Gage {
                    id: ptf5
                    name: "PT-F5"
                    x: 292
                    y: 165
                    width: 195
                    height: 33
                }

                Gage {
                    id: ptf4
                    name: "PT-F4"
                    x: 292
                    y: 210
                    width: 194
                    height: 31
                }

                Gage {
                    id: ptc3
                    name: "PT-C3"
                    x: 292
                    y: 260
                    width: 194
                    height: 31
                }

                Gage {
                    id: ptc2
                    name: "PT-C2"
                    x: 292
                    y: 311
                    width: 194
                    height: 34
                }

                Gage {
                    id: tcc2
                    name: "TC-C2"
                    x: 292
                    y: 342
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: ptc1
                    name: "PT-C1"
                    x: 292
                    y: 389
                    width: 194
                    height: 31
                }
                Gage {
                    id: tcf202
                    name: "TCF202"
                    x: 292
                    y: 389
                    width: 194
                    height: 31
                    visible: false
                }

                Gage {
                    id: ptf204
                    name: "PTF204"
                    x: 292
                    y: 389
                    width: 194
                    height: 31
                    visible: false
                }

            }
        }

        Rectangle {
            id: logo
            width: 476
            height: 150
            color: "#404040"
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
            color: "#404040"
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

