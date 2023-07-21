import QtQuick 2.12
import QtQuick.Window 2.12


Window {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: "ROS"
    minimumWidth:640
    minimumHeight: 480

    Rectangle {
        anchors.fill: parent
        color: "#11315e"
        MenuButton {}
    }

}
