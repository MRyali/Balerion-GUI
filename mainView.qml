import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: window
    width: 1920*dpi_scale
    height: 1080*dpi_scale
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

//        svh001t.update()
//        svh002t.update()
//        svh003t.update()
//        svh004t.update()

//        svo101t.update()
//        svo102t.update()
//        svo103t.update()
//        svo104t.update()

//        svf201t.update()
//        svf202t.update()
//        svf203t.update()
//        svf204t.update()

//        svh001.update()
//        svh002.update()
//        svh003.update()
//        svh004.update()

//        svo101.update()
//        svo103.update()
//        svo102.update()
//        svo104.update()

//        svf201.update()
//        svf202.update()
//        svf203.update()
//        svf204.update()

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
            anchors.topMargin: 40
            anchors.leftMargin: 100
            anchors.rightMargin: 100

            Item {
                id: p8id_bg
                anchors.fill: parent
              }
            Image{
                id: engine_outline
                width: 1200
                anchors.top: parent.top
                anchors.verticalCenter: parent.verticalCenter
                anchors.centerIn: parent
                source: "/Users/Ghadeer/BalerionGUI/Images/MainPic.png"
                mipmap: true
                anchors.topMargin: 14
                anchors.bottomMargin: 14
                fillMode: Image.PreserveAspectFit
            }
        }




        Rectangle {
            id: logo
            width: 500
            height: 150
            color: "#404040"
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Image {
                id: croppedLPL_Logo_512_square2
                x: 0
                width: 200
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "/Users/Ghadeer/BalerionGUI/Images/logo white.png"
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

        Rectangle{
            id: status_box
            x: 500
            width: 900
            height: 150
            color: "#404040"
            border.color: "#ffffff"
            anchors.left: logo.right
            anchors.top: parent.top
            anchors.right: p8id.right
            anchors.leftMargin: 10
            anchors.topMargin: 10

                TextField {
                    placeholderText: qsTr("Some Status Messages...")
                    readOnly: true
                    font.pixelSize: 24
                    anchors.fill: status_box
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                }

        }




    }


}








