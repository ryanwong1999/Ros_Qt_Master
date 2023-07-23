import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

Item {
    //显示区域的颜色背景
    width: 480
    height: 640
//    color: "#11315e";
    property bool unfold: false

    Rectangle {
        id: barRect
        width: unfold ? 240 : 64
        height: mainWindow.height
//        color: unfold ? "#f5f5f5" : "#11315e"
        color: "#f5f5f5"
        clip: true

        Behavior on width {
            NumberAnimation {
                duration: 300
            }
        }

        ListModel {
            id: appModel
            ListElement {
                name: "主页"
                icon: "qrc:/image/home.png"
            }
            ListElement {
                name: "操作"
                icon: "qrc:/image/user.png"
            }
            ListElement {
                name: "日志"
                icon: "qrc:/image/msg.png"
            }
            ListElement {
                name: "设置"
                icon: "qrc:/image/help.png"
            }
            ListElement {
                name: "退出"
                icon: "qrc:/image/setting.png"
            }
            //            ListElement{
            //                name: "Sign Out";
            //                icon: "qrc:/image/exit.png";
            //            }
        }

        Component {
            id: appDelegate
            Rectangle {
                id: delegateBackground
                width: barRect.width
                height: 48
                radius: 5
                color: "#00000000"
                //显示图标
                Image {
                    id: imageIcon
                    width: 24
                    height: 24
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 18
                    mipmap: true
                    source: icon
                }
                //显示APP文字
                Text {
                    anchors.left: imageIcon.right
                    anchors.leftMargin: 40
                    anchors.verticalCenter: imageIcon.verticalCenter
                    color: "#11315e"
                    text: name
                    font {
                        family: "微软雅黑"
                        pixelSize: 25
                    }
                }
                //鼠标处理
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: delegateBackground.color = "#10000000"
                    onExited: delegateBackground.color = "#00000000"

                }
            }
        }
        Rectangle {
            id: appGridRact
            width: parent.width
            height: 300
            anchors.verticalCenter: parent.verticalCenter
            color: "#00000000"
            GridView {
                id: appGrid
                width: 160
                height: parent.height
                anchors.left: parent.left
                anchors.top: parent.top
                model: appModel
                delegate: appDelegate
                cellWidth: width
                cellHeight: 60
            }
        }
    }

    // 展开/收回按钮
    Rectangle {
        width: 50
        height: width
        radius: width / 2
        color: "#f5f5f5"
        border.color: "#11315e"
        border.width: 5
        anchors.left: barRect.right
        anchors.leftMargin: unfold ? -width/4 : -width/3
//        anchors.leftMargin: -width / 2
        anchors.verticalCenter: barRect.verticalCenter
        Image {
            width: 24
            height: 24
            anchors.centerIn: parent
            mipmap: true
            //此处使用旋转1180度实现展开按钮图标和收回按钮图标
            rotation: unfold ? 180 : 0
            source: "qrc:/image/next_1.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                unfold = !unfold
            }
        }
    }
}
