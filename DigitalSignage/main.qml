import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    width: 360
    height: 360

    Loader
    {
        id:loadIdle
    }
    Loader
    {
        id:loadKeyboard
    }

    MouseArea
    {
        id:ma
        anchors.horizontalCenter: parent.horizontalCenter
        y:50
        width:100
        height:40
        onClicked:
        {
            loadIdle.source="qrc:///idle.qml"
        }

        Rectangle
        {
            anchors.fill: parent
            color: "#EAEAEA"
            border.color: "black"
            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Idle"
                font.pixelSize: 30
            }
        }
    }

    MouseArea
    {
        anchors.horizontalCenter: parent.horizontalCenter
        y: ma.y+ma.height+20
        width:180
        height:40

        onClicked:
        {
            loadIdle.source="qrc:///OSkeyboard.qml"
        }

        Rectangle
        {
            border.color: "black"
            anchors.fill: parent
            color: "#EAEAEA"
            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "OSKeyboard"
                font.pixelSize: 30
            }
        }
    }

}
