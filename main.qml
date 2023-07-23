import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: mainWindow
    visible: true
    width: 1280
    height: 740
    title: "ROS"
    minimumWidth: 640
    minimumHeight: 480


    Rectangle {
        id: background
        anchors.fill: parent
        color: "#11315e"
    }
//    Item {
//        id: menu
//        width: 380
//        height: 100
//        anchors.horizontalCenter: background.horizontalCenter
//        anchors.topMargin: 100
//        Row {
//            spacing: 30
//            MenuButton {text:"状态"}
//            MenuButton {text:"操作"}
//            MenuButton {text:"日志"}
//            MenuButton {text:"设置"}
//        }
//    }
    MenuBar{}


    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: true
        property int welcomeTimerCount: 0
        onTriggered: {
//            currentTimeString = currentTime()
//            currentDateString = currentDate()
//            currentWeekString = currentWeek()
//            currentTimeStringSecond = currentTimeSecond()
            if (welcomeTimerCount < 4)
                welcomeTimerCount++
            if (welcomeTimerCount == 2)
                welcome_text.text = "欢迎"
            if (welcomeTimerCount == 4) {
//                myDesktop.restoreMixerSettings()
                welcome_display.visible = false
                welcomeTimerCount++
            }
//            console.log("welcomeTimerCount", welcomeTimerCount)
        }
//        Component.onCompleted: {
//            currentTimeString = currentTime()
//            currentDateString = currentDate()
//            currentWeekString = currentWeek()
//        }
    }
    Item {
        id: welcome_display
        anchors.fill: parent
        //visible: !WINenv
        z: 120
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: parent.height + 20
            Rectangle {
                anchors.fill: parent
                color: "#11315e"
                Text {
                    id: welcome_text
                    text: qsTr("正在初始化，请稍候...")
                    color: "white"
                    font.pixelSize: 30
                    font.bold: true
                    anchors.centerIn: parent
                }
            }
        }
    }
}
