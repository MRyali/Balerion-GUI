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
        try { // check if fetchVal() works with try catch
            // 0 = default, 1 = null val, 2 = zero val
            var errorVal = 0
            // string for error message
            var str = ''
            // variables for each fetch
            var a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v  

            // Refresh Helium PTs
            a = pto1.fetchNewVal()
            b = pto2.fetchNewVal()
            c = ptf5.fetchNewVal()
            d = ptx1.fetchNewVal()
            e = ptx2.fetchNewVal()
            f = ptf4.fetchNewVal()

            // Refresh LOx PTs
            g = ptc3.fetchNewVal()
            h = ptc2.fetchNewVal()
            i = ptc1.fetchNewVal()

            // Refresh Kerosene PTs
            j = ptf1.fetchNewVal()
            k = ptf2.fetchNewVal()
            l = ptf3.fetchNewVal()
            m = ptf204.fetchNewVal()

            // Refresh Temperature TCs
            n = tco1.fetchNewVal()
            o = tcf3.fetchNewVal()
            p = tcx1.fetchNewVal()

            q = tcx2.fetchNewVal()
            r = tcc1.fetchNewVal()
            s = tcc2.fetchNewVal()
            t = tcf1.fetchNewVal()

            u = tcf2.fetchNewVal()
            v = tcf202.fetchNewVal()

            // check if any fetch returns null
            if (!(a && b && c && d && e && f && g && h && i && j && k && l && m && n && o && p && q 
                && r && s && t && u && v)) {
                errorVal = 1;
            }
            // check if any fetch returns 0
            else if ((a == 0 || b == 0 || c == 0 || d == 0 || e == 0 || f == 0 || g == 0 || h == 0 
                || i == 0 || j == 0 || k == 0 || l == 0 || m == 0 || n == 0 || o == 0 || p == 0 
                || q == 0 || r == 0 || s == 0 || t == 0 || u == 0 || v == 0)) {
                errorVal = 2;
            } 
        }
        catch (error) { // if error is thrown, display error and return
            if (errorVal = 1) { // check if null val error was found
                str += "Null Value Error || "
            }
            else if (errorVal = 2) { // check if zero val error was found
                str += "Zero Value Error || "
            }
            //console.error("FetchError: " + error)
            return str + " FetchNewVal() Error: " + error // return error string for display in GUI status box  
        }
        // if fetch works properly only display other potential errors
        if (errorVal = 1) { // check if null val error was found
            str += "Null Value Error || "
        }
        else if (errorVal = 2) { // check if zero val error was found
            str += "Zero Value Error || "
        }
        else {
            str = "Passing"
        }
        return str // else return pass string
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
                Gage {
                    id: pto1
                    name: "PTO001"
                    x: 1279
                    y: 256
                    width: 184
                    height: 27
                }
                Gage {
                    id: tco1
                    name: "TCO001"
                    x: 1301
                    y: 49
                    width: 184
                    height: 29
                    unit: "K"
                }

                Gage {
                    id: tcf3
                    name: "TCF003"
                    x: 1306
                    y: 132
                    width: 184
                    height: 28
                    unit: "K"
                }

                Gage {
                    id: ptx1
                    name: "PTX001"
                    x: 1271
                    y: 320
                    width: 172
                    height: 33
                }

                Gage {
                    id: tcx1
                    name: "TCX001"
                    x: 1271
                    y: 346
                    width: 172
                    height: 32
                    unit: "K"
                }

                Gage {
                    id: ptx2
                    name: "PTX002"
                    x: 1271
                    y: 420
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
                    unit: "K"
                }

                Gage {
                    id: ptf1
                    name: "PTF001"
                    x: 1302
                    y: 764
                    width: 185
                    height: 29
                }

                Gage {
                    id: tcf1
                    name: "TCF001"
                    x: 1220
                    y: 825
                    width: 185
                    height: 29
                    unit: "K"
                }

                Gage {
                    id: ptf2
                    name: "PTF002"
                    x: 744
                    y: 696
                    width: 184
                    height: 29
                }

                Gage {
                    id: tcf2
                    name: "TCF002"
                    x: 1175
                    y: 536
                    width: 185
                    height: 30
                    unit: "K"
                }

                Gage {
                    id: ptf3
                    name: "PTF003"
                    x: 1302
                    y: 624
                    width: 185
                    height: 29
                }

                Gage {
                    id: tcc1
                    name: "TCC001"
                    x: 746
                    y: 423
                    width: 183
                    height: 29
                    unit: "K"
                }

                Gage {
                    id: pto2
                    name: "PTO002"
                    x: 786
                    y: 84
                    width: 186
                    height: 28
                }

                Gage {
                    id: ptf5
                    name: "PTF005"
                    x: 788
                    y: 9
                    width: 185
                    height: 29
                }

                Gage {
                    id: ptf4
                    name: "PTF004"
                    x: 798
                    y: 211
                    width: 184
                    height: 29
                }

                Gage {
                    id: ptc3
                    name: "PTC003"
                    x: 218
                    y: 315
                    width: 182
                    height: 27
                }

                Gage {
                    id: ptc2
                    name: "PTC002"
                    x: 219
                    y: 364
                    width: 176
                    height: 34
                }

                Gage {
                    id: tcc2
                    name: "TCC002"
                    x: 219
                    y: 394
                    width: 176
                    height: 29
                    unit: "K"
                }

                Gage {
                    id: ptc1
                    name: "PTC001"
                    x: 220
                    y: 463
                    width: 176
                    height: 28
                }

                Image {
                    id: engineOutline8
                    x: 0
                    y: 0
                    width: 1720
                    height: 865
                    source: "EngineOutline8.png"
                    sourceSize.width: 3000
                    fillMode: Image.PreserveAspectFit
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

