import QtQuick 2.0

Item {
    width: 70
    height: 40

    Rectangle {
        anchors.fill: psarent
        color: "#1a437d"
        border.color: "blue"
        radius: 5
    }

    Text {
        id: text
        text: "推荐"
        font.family: "微软雅黑"
        font.pointSize: 20
        color: "#ffffff"
    }
}
