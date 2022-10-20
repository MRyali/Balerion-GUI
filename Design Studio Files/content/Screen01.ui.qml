

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import BalerionGUI3
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
                    source: "images/MainPic.png"
                    sourceSize.width: 3000
                    fillMode: Image.PreserveAspectFit
                }

                Gage {
                    id: pt001
                    name: "PT001"
                    x: 519
                    y: 27
                    width: 195
                    height: 31
                }
                Gage {
                    id: tc001
                    name: "TC001"
                    x: 1081
                    y: 125
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: tc002
                    name: "TC002"
                    x: 1131
                    y: 172
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pt004
                    name: "PT004"
                    x: 1311
                    y: 258
                    width: 195
                    height: 33
                }

                Gage {
                    id: tc003
                    name: "TC003"
                    x: 1311
                    y: 288
                    width: 195
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: pt005
                    name: "PT005"
                    x: 1311
                    y: 352
                    width: 195
                    height: 33
                }

                Gage {
                    id: tc004
                    name: "TC004"
                    x: 1311
                    y: 382
                    width: 195
                    height: 32
                    unit: "ºC"
                }

                Gage {
                    id: pt010
                    name: "PT010"
                    x: 1013
                    y: 668
                    width: 194
                    height: 31
                }

                Gage {
                    id: tc007
                    name: "TC007"
                    x: 1012
                    y: 741
                    width: 194
                    height: 30
                    unit: "ºC"
                }

                Gage {
                    id: pt011
                    name: "PT011"
                    x: 718
                    y: 800
                    width: 194
                    height: 31
                }

                Gage {
                    id: tc008
                    name: "TC008"
                    x: 468
                    y: 737
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pt012
                    name: "PT012"
                    x: 468
                    y: 668
                    width: 195
                    height: 31
                }

                Gage {
                    id: tc005
                    name: "TC005"
                    x: 994
                    y: 431
                    width: 195
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pt002
                    name: "PT002"
                    x: 494
                    y: 122
                    width: 194
                    height: 31
                }

                Gage {
                    id: pt003
                    name: "PT003"
                    x: 292
                    y: 165
                    width: 195
                    height: 33
                }

                Gage {
                    id: pt006
                    name: "PT006"
                    x: 292
                    y: 210
                    width: 194
                    height: 31
                }

                Gage {
                    id: pt007
                    name: "PT007"
                    x: 292
                    y: 260
                    width: 194
                    height: 31
                }

                Gage {
                    id: pt008
                    name: "PT008"
                    x: 292
                    y: 311
                    width: 194
                    height: 34
                }

                Gage {
                    id: tc006
                    name: "TC006"
                    x: 292
                    y: 342
                    width: 194
                    height: 31
                    unit: "ºC"
                }

                Gage {
                    id: pt009
                    name: "PT009"
                    x: 292
                    y: 389
                    width: 194
                    height: 31
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
                source: "../logo white.png"
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

