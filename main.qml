import QtQuick 2.12
import QtQuick.Window 2.12
//import myDesktop 1.0

Window {
    id: mainWindow
    property int dayOrNight: 0
    property string currentTimeString
    property string currentTimeStringSecond
    property string currentDateString
    property string currentWeekString
    visible: true
    width: 1280
    height: 740
    title: "ROS"
    minimumWidth: 640
    minimumHeight: 480

//    //flags:Qt.FramelessWindowHint
//    MyDesktop {
//        id: myDesktop
//        onSysVolumeChanged: {
//            system_volume_slider.value = Number(sysVolume)
//        }
//        onCpuTempChanged: {
//            displayCpuTemp.text = "CPU:" + cpuTemp + "℃"
//        }
//    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#11315e"
    }

    MenuBar{}

    Text {
        id: mainTimeText
        visible: false // mainSwipeView.currentIndex == 0
        text: currentTimeString
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        color: "white"
        font.pixelSize: 30
        font.bold: true
    }
    Text {
        id: weekText
        visible: false // mainSwipeView.currentIndex == 0
        text: currentWeekString
        anchors.top: mainTimeText.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: mainTimeText.horizontalCenter
        color: "#99eeeeee"
        font.pixelSize: 15
        font.bold: true
    }

    function currentDate() {
        return Qt.formatDateTime(new Date(), "ddd yyyy年MM月dd日")
    }

    function currentWeek() {
        var dayofWeek = ""
        var str = Qt.formatDateTime(new Date(), "ddd")
        switch (str) {
        case "Sun":
        case "周日":
            dayofWeek = "周日"
            break
        case "Mon":
        case "周一":
            dayofWeek = "周一"
            break
        case "Tue":
        case "周二":
            dayofWeek = "周二"
            break
        case "Wed":
        case "周三":
            dayofWeek = "周三"
            break
        case "Thu":
        case "周四":
            dayofWeek = "周四"
            break
        case "Fri":
        case "周五":
            dayofWeek = "周五"
            break
        case "Sat":
        case "周六":
            dayofWeek = "周六"
            break
        }
        return dayofWeek + Qt.formatDateTime(new Date(), ",MM月dd日")
    }

    function currentTime() {
        dayOrNight = new Date().getHours()
        return Qt.formatDateTime(new Date(), "hh:mm")
    }

    function currentTimeSecond() {
        dayOrNight = new Date().getHours()
        return Qt.formatDateTime(new Date(), "hh:mm:ss")
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: true
        property int welcomeTimerCount: 0
        onTriggered: {
            currentTimeString = currentTime()
            currentDateString = currentDate()
            currentWeekString = currentWeek()
            currentTimeStringSecond = currentTimeSecond()
            if (welcomeTimerCount < 4)
                welcomeTimerCount++
            if (welcomeTimerCount == 2)
                welcome_text.text = "欢迎"
            if (welcomeTimerCount == 4) {
//                myDesktop.restoreMixerSettings()
                welcome_display.visible = false
                welcomeTimerCount++
            }
        }
        Component.onCompleted: {
            currentTimeString = currentTime()
            currentDateString = currentDate()
            currentWeekString = currentWeek()
        }
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
