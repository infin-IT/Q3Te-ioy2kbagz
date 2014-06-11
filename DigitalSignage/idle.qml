import QtQuick 2.2
import QtQuick.Window 2.1
import QtMultimedia 5.0

Window {
    id:wdw
    visible: true
    //width: 360
    //height: 360

    property int yy:0

    onAfterRendering:
    {
        console.debug("jooooooooooonnn")
        wdw.showFullScreen()
        timer1.start()
        var rndom
        for (var i=0; i<30; i++)
        {
            rndom = Math.floor((Math.random() * 14) + 1);
            switch (rndom)
            {
            case 1:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/biru.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 2:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/ijo.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 3:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/kuning.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 4:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/orange.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 5:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/ungu.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 6:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/coklat.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 7:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/ijo.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                break
            case 8:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/biru.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            case 9:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/ijo.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            case 10:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/kuning.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            case 11:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/orange.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            case 12:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/ungu.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            case 13:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/coklat.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            case 14:
                opoModel.append({"gambar":"http://192.168.1.123/abstract/biru.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                break
            }
        }

    }

    /* Timer
     *
    */
    Timer {
        id:timer1
        interval: 200
        onTriggered:
        {
            yy++
            gridView1.contentY = yy

            //console.debug("oi="+yy)
        }
    }
//    Rectangle
//    {
//        anchors.horizontalCenter: wdw.horizontalCenter
//        x:100
//        height:768
//        width:50
//        MediaPlayer {
//            id: player
//            source: "http://192.168.1.123/vid/drag.mp4"
//            autoPlay: true
//        }

//        VideoOutput {
//            orientation: 90
//            id: videoOutput
//            source: player
//            anchors.fill: parent
//        }
//    }

        Video
        {
            id:pid
            z:100
            x:0
            y:100
            fillMode: VideoOutput.Stretch
            autoLoad: true
            autoPlay: true
            width: 768
            height: 100
            source: "http://192.168.1.123/vid/drag.mp4"
            focus : true
        }

    GridView {
        z:-1
        id: gridView1
        x: -100
        y: 0
        rotation: 180
        width:parent.width+200
        height:parent.height
        clip: true
        cellHeight: 110
        cellWidth: 110
        interactive : false
        Behavior on y
        {
            NumberAnimation{ duration: 200; easing.type: Easing.Linear}
        }
        //cellWidth: 70
        model: opoModel
        delegate:
            Item
        {
        width:gridView1.cellWidth
        height:gridView1.cellHeight
        Image
        {
            z:0
            height:parent.height
            width:parent.width
            source: gambar
        }
        Image{
            z:1
            height:parent.height
            width:parent.width
            source: gambart
        }
    }
}

ListModel
{
    id:opoModel
}

}
