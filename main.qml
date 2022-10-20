/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "Gage.qml"

//imports .qml files with user defined object types (e.g. gage)
Item {
    id: window
    width: 1920 * dpi_scale
    height: 1080 * dpi_scale
    visible: true
    property real dpi_scale: 0.6
    scale: 1

    function updateElements() {



        // Refresh Helium PTs
        pth001.fetchNewVal()
        pth002.fetchNewVal()
        pth003.fetchNewVal()
        pth004.fetchNewVal()
        pth005.fetchNewVal()
        pth006.fetchNewVal()
        // Refresh LOx PTs
        pto101.fetchNewVal()
        pto102.fetchNewVal()
        pto103.fetchNewVal()
        // Refresh Kerosene PTs
        ptf201.fetchNewVal()
        ptf202.fetchNewVal()
        ptf203.fetchNewVal()
        ptf204.fetchNewVal()


        tch001.fetchNewVal()
        tch002.fetchNewVal()
        tch003.fetchNewVal()

        tco101.fetchNewVal()
        tco102.fetchNewVal()
        tco103.fetchNewVal()
        tco104.fetchNewVal()

        tcf201.fetchNewVal()
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
                    id: pth001
                    name: "PTH001"
                    x: 519
                    y: 27
                    width: 195
                    height: 31
                }
                Gage {
                    id: tch001
                    name: "TCH001"
                    x: 1081
                    y: 125
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: tch002
                    name: "TCH002"
                    x: 1131
                    y: 172
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pth004
                    name: "PTH004"
                    x: 1311
                    y: 258
                    width: 195
                    height: 33
                }

                Gage {
                    id: tch003
                    name: "TCH003"
                    x: 1311
                    y: 288
                    width: 195
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: pth005
                    name: "PTH005"
                    x: 1311
                    y: 352
                    width: 195
                    height: 33
                }

                Gage {
                    id: tco101
                    name: "TCO101"
                    x: 1311
                    y: 382
                    width: 195
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: ptf201
                    name: "PTF201"
                    x: 1013
                    y: 668
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: tco104
                    name: "TCO104"
                    x: 1012
                    y: 741
                    width: 194
                    height: 30
                    unit: "ºC"
                }

                Gage {
                    id: ptf202
                    name: "PTF202"
                    x: 718
                    y: 800
                    width: 194
                    height: 31
                }

                Gage {
                    id: tcf201
                    name: "TCF201"
                    x: 468
                    y: 737
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: ptf203
                    name: "PTF203"
                    x: 468
                    y: 668
                    width: 195
                    height: 31
                }

                Gage {
                    id: tco102
                    name: "TCO102"
                    x: 994
                    y: 431
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pth002
                    name: "PTH002"
                    x: 494
                    y: 122
                    width: 194
                    height: 31
                }

                Gage {
                    id: pth003
                    name: "PTH003"
                    x: 292
                    y: 165
                    width: 195
                    height: 33
                }

                Gage {
                    id: pth006
                    name: "PTH006"
                    x: 292
                    y: 210
                    width: 194
                    height: 31
                }

                Gage {
                    id: pto101
                    name: "PTO101"
                    x: 292
                    y: 260
                    width: 194
                    height: 31
                }

                Gage {
                    id: pto102
                    name: "PTO102"
                    x: 292
                    y: 311
                    width: 194
                    height: 34
                }

                Gage {
                    id: tco103
                    name: "TCO103"
                    x: 292
                    y: 342
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pto103
                    name: "PTO103"
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

