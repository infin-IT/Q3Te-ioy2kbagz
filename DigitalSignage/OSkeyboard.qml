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
        //for(var i=0;i<)

    }

    onAfterRendering:
    {
        if(!isGenerated)
        {
            isGenerated=true;
            numPad.append({"name":"a","colorCode":"blue"});
        }


    }

    GridView {
        id: gridNum
        x: 0
        y: 0
        width: 500
        height: 500
        cellWidth: 50
        cellHeight: 50
        delegate: Item {
            x: 5
            height: 50
            Column {
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    x: 5
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
                spacing: 5
            }
        }
        model:

        ListModel {
            id:numPad
        }
    }
}
