import QtQuick 2.15
import QtQuick.Controls 2.15
import "content/QML objects/Valve"
import "content/QML objects/Gage"
import "content/QML objects/visual elements"
//import "content/QML objects/visual elements/TitleBar.qml"



Item {
    id: window
    width: 1920*dpi_scale
    height: 1080*dpi_scale
    visible: true
    property real dpi_scale: 0.7
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

        svh001t.update()
        svh002t.update()
        svh003t.update()
        svh004t.update()

        svo101t.update()
        svo102t.update()
        svo103t.update()
        svo104t.update()

        svf201t.update()
        svf202t.update()
        svf203t.update()
        svf204t.update()

        svh001.update()
        svh002.update()
        svh003.update()
        svh004.update()

        svo101.update()
        svo103.update()
        svo102.update()
        svo104.update()

        svf201.update()
        svf202.update()
        svf203.update()
        svf204.update()

    }

    Rectangle {
        id: background
        width: 1920
        height: 1080
        visible: true
        color: "#010c1e"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        transformOrigin: Item.Center
        scale: dpi_scale




        Rectangle {
            id: p8id
            width: 1400
            height: 789
            color: "#0c182e"
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.top: logo.bottom
            anchors.topMargin: 10
            anchors.leftMargin: 10

            Item {
                id: p8id_bg
                anchors.fill: parent




                Image {
                    id: gages_frames1
                    anchors.fill: parent
                    source: "content/QML objects/Gage/Gages_frames.png"
                    fillMode: Image.PreserveAspectFit
                }
                Image {
                    id: pipes
                    x: 0
                    y: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.top: parent.top
                    source: "content/QML objects/P&ID/Pipes.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    clip: true
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    fillMode: Image.PreserveAspectFit
                }
            }

            Item {
                id: gages
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.bottomMargin: -19
                anchors.leftMargin: 0
                anchors.topMargin: 19

                Column {
                    id: gageCluster1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 1143
                    anchors.leftMargin: 77
                    anchors.bottomMargin: 197
                    anchors.topMargin: 460

                    Gage {
                        id: pth001
                        name: "PTH001"
                    }

                    Gage {
                        id: pth002
                        name: "PTH002"
                    }

                    Gage {
                        id: tch001
                        name: "TCH001"
                        unit: "ºC"
                    }
                }

                Column {
                    id: gageCluster2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 919
                    anchors.leftMargin: 301
                    anchors.bottomMargin: 197
                    anchors.topMargin: 460

                    Gage {
                        id: pth003
                        name: "PTH003"
                    }

                    Gage {
                        id: pth004
                        name: "PTH004"
                    }

                    Gage {
                        id: tch002
                        name: "TCH002"
                        unit: "ºC"
                    }
                }
                Column {
                    id: gageCluster3
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 879
                    anchors.leftMargin: 341
                    anchors.bottomMargin: 426
                    anchors.topMargin: 231

                    Gage {
                        id: pth005
                        name: "PTH005"
                    }

                    Gage {
                        id: pth006
                        name: "PTH006"
                    }

                    Gage {
                        id: tch003
                        name: "TCH003"
                        unit: "ºC"
                    }
                }
                Column {
                    id: gageCluster4
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 532
                    anchors.leftMargin: 688
                    anchors.bottomMargin: 521
                    anchors.topMargin: 136

                    Gage {
                        id: ptf201
                        name: "PTF201"
                    }

                    Gage {
                        id: ptf202
                        name: "PTF202"
                    }

                    Gage {
                        id: tcf201
                        name: "TCF201"
                        unit: "ºC"
                    }
                }
                Column {
                    id: gageCluster5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 53
                    anchors.leftMargin: 1167
                    anchors.bottomMargin: 478
                    anchors.topMargin: 179

                    Gage {
                        id: ptf203
                        name: "PTF203"
                    }

                    Gage {
                        id: ptf204
                        name: "PTF204"
                    }

                    Gage {
                        id: tcf202
                        name: "TCF202"
                        unit: "ºC"
                    }
                }
                Column {
                    id: gageCluster6
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 510
                    anchors.leftMargin: 710
                    anchors.bottomMargin: 140
                    anchors.topMargin: 517

                    Gage {
                        id: pto101
                        name: "PTO101"
                    }

                    Gage {
                        id: tco101
                        name: "TCO101"
                        unit: "ºC"
                    }

                    Gage {
                        id: tco102
                        name: "TCO102"
                        unit: "ºC"
                    }
                }
                Column {
                    id: gageCluster7
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 55
                    anchors.leftMargin: 1165
                    anchors.bottomMargin: 175
                    anchors.topMargin: 482

                    Gage {
                        id: pto102
                        name: "PTO102"
                    }

                    Gage {
                        id: pto103
                        name: "PTO103"
                    }

                    Gage {
                        id: tcf104
                        name: "TCF104"
                        unit: "ºC"
                    }
                }
                Gage {
                    id: tcf103
                    name: "TCF103"
                    x: 815
                    y: 646
                    width: 176
                    height: 31
                    unit: "ºC"
                }
            }

            TitleBar {
                title: "P&ID"

            }







            Item {
                id: valves
                x: 0
                y: 20
                width: 200
                height: 200

                Valve{
                    id: svh001
                    name: "SVH001"
                    x: 196
                    y: 356
                    state: "OD"
                }

                Valve{
                    id: svh002
                    name: "SVH002"
                    x: 286
                    y: 356
                    state: "OD"
                }

                Valve{
                    id: svh003
                    name: "SVH003"
                    x: 235
                    y: 289
                    ang_Open: 90
                    state: "OD"
                }

                Valve{
                    id: svh004
                    name: "SVH004"
                    x: 477
                    y: 356
                    ang_Open: 0
                    state: "OD"
                }
                Valve{
                    id: svo101
                    name: "SVO101"
                    x: 1040
                    y: 691
                    ang_Open: 0
                    state: "OD"
                }
                Valve{
                    id: svo103
                    name: "SVO103"
                    x: 598
                    y: 489
                    clip: true
                    ang_Open: 90
                    state: "OD"
                }
                Valve{
                    id: svo102
                    name: "SVO102"
                    x: 929
                    y: 421
                    ang_Open: 0
                    state: "OD"
                }
                Valve{
                    id: svo104
                    name: "SVO104"
                    x: 1033
                    y: 421
                    ang_Open: 0
                    state: "OD"
                }
                Valve{
                    id: svf201
                    name: "SVF201"
                    x: 598
                    y: 215
                    ang_Open: 90
                    state: "OD"
                }
                Valve{
                    id: svf202
                    name: "SVF202"
                    x: 906
                    y: 35
                    ang_Open: 0
                    state: "OD"
                }
                Valve{
                    id: svf203
                    name: "SVF203"
                    x: 1036
                    y: 284
                    ang_Open: 0
                    state: "OD"
                }
                Valve{
                    id: svf204
                    name: "SVF204"
                    x: 1036
                    y: 35
                    ang_Open: 0
                    state: "OD"
                }
            }

            Item {
                id: labels
                x: 0
                y: 21
                width: 200
                height: 200
                Text {
                    x: 211
                    y: 204
                    color: "#ffffff"
                    text: qsTr("Atmosphere")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 54
                    y: 369
                    color: "#ffffff"
                    text: qsTr("Helium")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 812
                    y: 436
                    color: "#ffffff"
                    text: qsTr("LOx")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 790
                    y: 296
                    color: "#ffffff"
                    text: qsTr("Kerosene")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 575
                    y: 603
                    color: "#ffffff"
                    text: qsTr("Atmosphere")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 1182
                    y: 704
                    color: "#ffffff"
                    text: qsTr("Atmosphere")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 575
                    y: 140
                    color: "#ffffff"
                    text: qsTr("Atmosphere")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                }
                Text {
                    x: 768
                    y: 41
                    width: 94
                    height: 37
                    color: "#ffffff"
                    text: qsTr("QDF201 Fuel Fill")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.underline: false
                    font.family: "Arial"
                }
                Text {
                    x: 1176
                    y: 41
                    width: 94
                    height: 37
                    color: "#ffffff"
                    text: qsTr("QDF202 Fuel Drain")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.underline: false
                    font.family: "Arial"
                }
                Text {
                    x: 1176
                    y: 101
                    width: 94
                    height: 37
                    color: "#ffffff"
                    text: qsTr("QDN302 Fuel Purge")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.underline: false
                    font.family: "Arial"
                }
                Text {
                    x: 1175
                    y: 609
                    width: 109
                    height: 37
                    color: "#ffffff"
                    text: qsTr("QDO102 Engine Chill")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.underline: false
                    font.family: "Arial"
                }
                Text {
                    x: 1176
                    y: 655
                    width: 109
                    height: 37
                    color: "#ffffff"
                    text: qsTr("QDN301 LOx Purge")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.underline: false
                    font.family: "Arial"
                }
                Text {
                    x: 833
                    y: 696
                    width: 94
                    height: 37
                    color: "#ffffff"
                    text: qsTr("QDO101 LOx Fill")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.underline: false
                    font.family: "Arial"
                }

                Item {
                    id: valve_labels
                    width: 200
                    height: 200

                    Text {

                        x: 187
                        y: 407
                        color: "#ffffff"
                        text: qsTr("SVH001")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 277
                        y: 407
                        color: "#ffffff"
                        text: qsTr("SVH002")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 165
                        y: 303
                        color: "#ffffff"
                        text: qsTr("SVH003")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 468
                        y: 407
                        color: "#ffffff"
                        text: qsTr("SVH004")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 1030
                        y: 742
                        color: "#ffffff"
                        text: qsTr("SVO101")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 920
                        y: 474
                        color: "#ffffff"
                        text: qsTr("SVO102")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 526
                        y: 502
                        color: "#ffffff"
                        text: qsTr("SVO103")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 1024
                        y: 474
                        color: "#ffffff"
                        text: qsTr("SVO104")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 533
                        y: 230
                        color: "#ffffff"
                        text: qsTr("SVF201")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 898
                        y: 86
                        color: "#ffffff"
                        text: qsTr("SVF202")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 1029
                        y: 336
                        color: "#ffffff"
                        text: qsTr("SVF203")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }

                    Text {
                        x: 1028
                        y: 87
                        color: "#ffffff"
                        text: qsTr("SVF204")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                    }
                }
            }
        }

        Rectangle {
            id: logo
            width: 310
            height: 106
            color: "#263551"
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Image {
                id: croppedLPL_Logo_512_square2
                x: 0
                width: 157
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "content/Images/cropped-LPL_Logo_512_square-2.png"
                mipmap: true
                anchors.topMargin: 14
                anchors.bottomMargin: 14
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text1
                x: 161
                width: 124
                height: 63
                color: "#ffffff"
                text: qsTr("MISSION CONTROL")
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
            id: valve_buttons
            x: 1432
            y: 126
            width: 463
            height: 640
            color: "#0c182e"
            border.color: "#ffffff"

            TitleBar{
                id: buttons_title
                title: "VALVES"

            }

            Section_Header{
                id: helium_header
                height: 43
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: buttons_title.bottom
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                hederText: "HELIUM"

            }

            Section_Header{
                id: oxygen_header
                y: 231
                anchors.left: parent.left
                anchors.right: parent.right
                hederText: "OXYGEN"
                anchors.rightMargin: 0
                anchors.leftMargin: 0

            }
            Section_Header{
                id: kerosene_header
                y: 427
                anchors.left: parent.left
                anchors.right: parent.right
                hederText: "KEROSENE"
                anchors.rightMargin: 0
                anchors.leftMargin: 0

            }

            ValveToggle{
                id: svh001t
                name: "SVH001"
                x: 13
                y: 79
                width: 208
                anchors.left: parent.left
                anchors.leftMargin: 15
                nrml_Opn: false

            }
            ValveToggle{
                id: svh002t
                name: "SVH002"
                x: 241
                y: 79
                anchors.right: parent.right
                anchors.rightMargin: 15
                nrml_Opn: false
            }
            ValveToggle{
                id: svh003t
                name: "SVH003"
                x: 13
                y: 156
                width: 208
                anchors.left: parent.left
                anchors.leftMargin: 15
                nrml_Opn: false

            }
            ValveToggle{
                id: svh004t
                name: "SVH004"
                x: 240
                y: 156
                anchors.right: parent.right
                anchors.rightMargin: 15
                nrml_Opn: false
            }
            ValveToggle{
                id: svo101t
                name: "SVO101"
                x: 13
                y: 280
                width: 208
                anchors.left: parent.left
                anchors.leftMargin: 15
                nrml_Opn: false

            }
            ValveToggle{
                id: svo102t
                name: "SVO102"
                x: 240
                y: 280
                anchors.right: parent.right
                anchors.rightMargin: 15
                nrml_Opn: false
            }
            ValveToggle{
                id: svo103t
                name: "SVO103"
                x: 13
                y: 357
                width: 208
                anchors.left: parent.left
                anchors.leftMargin: 15
                nrml_Opn: false

            }
            ValveToggle{
                id: svo104t
                name: "SVO104"
                x: 240
                y: 357
                anchors.right: parent.right
                anchors.rightMargin: 15
                nrml_Opn: false
            }

            ValveToggle{
                id: svf201t
                name: "SVF201"
                x: 13
                y: 476
                width: 208
                anchors.left: parent.left
                anchors.leftMargin: 15
                nrml_Opn: true

            }
            ValveToggle{
                id: svf202t
                name: "SVF202"
                x: 240
                y: 476
                anchors.right: parent.right
                anchors.rightMargin: 15
                nrml_Opn: true
            }
            ValveToggle{
                id: svf203t
                name: "SVF203"
                x: 13
                y: 553
                width: 208
                anchors.left: parent.left
                anchors.leftMargin: 15
                nrml_Opn: true

            }
            ValveToggle{
                id: svf204t
                name: "SVF204"
                x: 240
                y: 553
                anchors.right: parent.right
                anchors.rightMargin: 15
                nrml_Opn: true
            }
        }

        Rectangle {
            id: commands
            x: 1432
            y: 777
            width: 463
            height: 99
            color: "#0c182e"
            border.color: "#ffffff"

            Rectangle {
                id: rectangle1
                width: 424
                height: 71
                color: "#555555"
                border.color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: text2
                    color: "#ffffff"
                    text: qsTr("SEND COMMAND")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent

                    onClicked: {
                        bridge.sendCommand()
                    }
                }
            }
        }

        Item {
            id: tab_bar
            x: 333
            y: 10
            width: 200
            height: 200

            Rectangle {
                id: rectangle
                x: 0
                y: 0
                width: 193
                height: 106
                color: "#263551"
                border.color: "#ffffff"

                Text {
                    id: text3
                    color: "#ffffff"
                    text: qsTr("Vehicle")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                    font.capitalization: Font.AllUppercase
                    font.bold: false
                    font.family: "Arial"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle2
                x: 192
                y: 0
                width: 193
                height: 106
                color: "#0c182e"
                border.color: "#ffffff"
                Text {

                    color: "#ffffff"
                    text: qsTr("GSE")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                    font.family: "Arial"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {

                x: 382
                y: 0
                width: 193
                height: 106
                color: "#0c182e"
                border.color: "#ffffff"
                Text {

                    color: "#ffffff"
                    text: qsTr("Timing")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                    font.capitalization: Font.AllUppercase
                    font.kerning: false
                    font.family: "Arial"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {

                x: 575
                y: 0
                width: 193
                height: 106
                color: "#0c182e"
                border.color: "#ffffff"
                Text {
                    width: 78
                    height: 28

                    color: "#ffffff"
                    text: qsTr("PT CALIB.")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    font.capitalization: Font.AllUppercase
                    font.kerning: false
                    font.family: "Arial"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }




    }









}






/*##^##
Designer {
    D{i:0;height:0;width:0}D{i:4}D{i:5}D{i:3}D{i:8}D{i:9}D{i:10}D{i:7}D{i:12}D{i:13}D{i:14}
D{i:11}D{i:16}D{i:17}D{i:18}D{i:15}D{i:20}D{i:21}D{i:22}D{i:19}D{i:24}D{i:25}D{i:26}
D{i:23}D{i:28}D{i:29}D{i:30}D{i:27}D{i:32}D{i:33}D{i:34}D{i:31}D{i:35}D{i:6}D{i:36}
D{i:38}D{i:39}D{i:40}D{i:41}D{i:42}D{i:43}D{i:44}D{i:45}D{i:46}D{i:47}D{i:48}D{i:49}
D{i:37}D{i:51}D{i:52}D{i:53}D{i:54}D{i:55}D{i:56}D{i:57}D{i:58}D{i:59}D{i:60}D{i:61}
D{i:62}D{i:63}D{i:65}D{i:66}D{i:67}D{i:68}D{i:69}D{i:70}D{i:71}D{i:72}D{i:73}D{i:74}
D{i:75}D{i:76}D{i:64}D{i:50}D{i:2}D{i:78}D{i:79}D{i:77}D{i:81}D{i:82}D{i:83}D{i:84}
D{i:85}D{i:86}D{i:87}D{i:88}D{i:89}D{i:90}D{i:91}D{i:92}D{i:93}D{i:94}D{i:95}D{i:96}
D{i:80}D{i:99}D{i:100}D{i:98}D{i:97}D{i:103}D{i:102}D{i:105}D{i:104}D{i:107}D{i:106}
D{i:109}D{i:108}D{i:101}D{i:1}
}
##^##*/
