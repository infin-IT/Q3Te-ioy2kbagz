import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    width: 500
    height: 300
    visible: true
    title: "OSKeyboard"
    color: "#EAEAEA"
    property bool isGenerated:false;
    function generatePad()
    {

        for(var i=0;i<10;i++)
        {
            numPad.append({"name":i+'0',"colorCode":"black"});
        }

    }

    onAfterRendering:
    {
        if(!isGenerated)
        {
            isGenerated=true;
            generatePad();
        }
    }

    GridView {
        id: gridNum
        x: parent.x+50
        y: parent.y

        width: 300
        height: 300
        cellWidth: 100
        cellHeight: 100
        delegate: Item {
            x:0
            y:0
            width: 100
            height: 100
            Rectangle {
                x:0
                y:0
                anchors.fill: parent
                color:"transparent"
                Image {
                    id: bg
                    source: "http://192.168.1.123/buttonKeyboard/unPressed.png"
                    anchors.fill: parent
                }
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    color:"white"
                    text: name
                    anchors.centerIn: parent
                    font.bold: true
                }
                MouseArea
                {
                    id:msArea
                    anchors.fill:parent
                    onPressed:
                    {
                        bg.source="http://192.168.1.123/buttonKeyboard/Pressed.png"
                    }
                    onReleased:
                    {
                        bg.source="http://192.168.1.123/buttonKeyboard/unPressed.png"
                    }
                }
            }
        }
        model:
            ListModel {
            id:numPad
        }
    }
}
