import QtQuick 2.0

Item {
    property alias text: txt.text
    width: 70
    height: 40

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#1a437d"
        border.color: "blue"
        radius: 5
        opacity: 0
    }

    Text {
        id: txt
        text: "推荐"
        font.family: "微软雅黑"
        font.pointSize: 20
        color: "#ffffff"
        anchors.centerIn: background
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            background.opacity = 1
        }
        onExited: {
            background.opacity = 0
        }
    }
}
