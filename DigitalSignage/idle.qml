import QtQuick 2.2
import QtQuick.Window 2.1
import QtMultimedia 5.0
import QtQuick.XmlListModel 2.0

Window {
    id:wdw
    visible: true
    //width: 360
    //height: 360

    property int yy:0
    property bool flag_done:false

    Text
    {
        z:1000
        text: yy
        x:0
        y:0
        font.pixelSize: 70
    }

    onAfterRendering:
    {
        //makecurrent()
        wdw.showFullScreen()
        timer1.start()
        //timer2.start()

        if (!flag_done)
        {
            console.debug("jooooooooooonnn")
            flag_done=true
            load_image()
        }
    }

    function load_image()
    {
        var rndom1,rndom2
        var buf=3
        for (var i=0; i<300; i++)
        {
            do
            {
                rndom1 = Math.floor((Math.random() * 6) + 1);
            }while(buf===rndom1)
            rndom2 = Math.floor((Math.random() * 3) + 1);

            buf=rndom1
            switch (rndom1)
            {
            case 1:
                if (rndom2===1) opoModel.append({"gambar":"http://192.168.1.123/abstract/biru.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                else if (rndom2===2) opoModel.append({"gambar":"http://192.168.1.123/abstract/biru.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                else opoModel.append({"gambar":"http://192.168.1.123/abstract/biru.jpg","gambart":"http://192.168.1.123/abstract/trans3.png"})
                break
            case 2:
                if (rndom2===1) opoModel.append({"gambar":"http://192.168.1.123/abstract/coklat.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                else if (rndom2===2) opoModel.append({"gambar":"http://192.168.1.123/abstract/coklat.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                else opoModel.append({"gambar":"http://192.168.1.123/abstract/coklat.jpg","gambart":"http://192.168.1.123/abstract/trans3.png"})
                break
            case 3:
                if (rndom2===1) opoModel.append({"gambar":"http://192.168.1.123/abstract/ijo.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                else if (rndom2===2) opoModel.append({"gambar":"http://192.168.1.123/abstract/ijo.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                else opoModel.append({"gambar":"http://192.168.1.123/abstract/ijo.jpg","gambart":"http://192.168.1.123/abstract/trans3.png"})
                break
            case 4:
                if (rndom2===1) opoModel.append({"gambar":"http://192.168.1.123/abstract/kuning.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                else if (rndom2===2) opoModel.append({"gambar":"http://192.168.1.123/abstract/kuning.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                else opoModel.append({"gambar":"http://192.168.1.123/abstract/kuning.jpg","gambart":"http://192.168.1.123/abstract/trans3.png"})
                break
            case 5:
                if (rndom2===1) opoModel.append({"gambar":"http://192.168.1.123/abstract/orange.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                else if (rndom2===2) opoModel.append({"gambar":"http://192.168.1.123/abstract/orange.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                else opoModel.append({"gambar":"http://192.168.1.123/abstract/orange.jpg","gambart":"http://192.168.1.123/abstract/trans3.png"})
                break
            case 6:
                if (rndom2===1) opoModel.append({"gambar":"http://192.168.1.123/abstract/ungu.jpg","gambart":"http://192.168.1.123/abstract/trans.png"})
                else if (rndom2===2) opoModel.append({"gambar":"http://192.168.1.123/abstract/ungu.jpg","gambart":"http://192.168.1.123/abstract/trans2.png"})
                else opoModel.append({"gambar":"http://192.168.1.123/abstract/ungu.jpg","gambart":"http://192.168.1.123/abstract/trans3.png"})
                break
            }
        }
    }

    /* Timer
     *
    */
    Timer {
        id:timer1
        interval: 50
        onTriggered:
        {
            yy++
            if(yy%300===0) flag_done=false
            gridView1.contentY = yy

            //console.debug("oi="+yy)
        }
    }

    //    Timer
    //    {
    //        id: timer2
    //        interval: 1000
    //        onTriggered:
    //        {
    //           rect1.y+=100
    //        }
    //    }
    Rectangle
    {
        y:rect1.y-146
        color:"transparent"
        width:parent.width
        height: 900
        Image
        {
            anchors.fill: parent
            z:5
            id:background_vid
            source: "http://192.168.1.123/abstract/video_trans.png"
            opacity: 30

        }
    }

    Rectangle
    {
        id:rect1
        x:(parent.width/2)-(rect1.width/2)
        color:"transparent"
        y:100
        height:608
        width:parent.width
        Behavior on y { SpringAnimation { spring: 10; damping: 0.1 } }



        MediaPlayer
        {

            id: player
            source: "http://192.168.1.123/vid/drag.mp4"
            autoPlay: true
        }

        VideoOutput
        {
            z:6
            id: videoOutput
            source: player
            fillMode: VideoOutput.Stretch
            anchors.fill: parent
        }
    }

    //        Video
    //        {
    //            id:pid
    //            z:100
    //            x:0
    //            y:100
    //            fillMode: VideoOutput.Stretch
    //            autoLoad: true
    //            autoPlay: true
    //            width: 768
    //            height: 100
    //            source: "http://192.168.1.123/vid/drag.mp4"
    //            focus : true
    //        }

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
            NumberAnimation{ duration: 50; easing.type: Easing.Linear}
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

XmlListModel {
    source: "http://www.google.com/ig/api?weather=Salatiga"
    query: "/xml_api_reply/weather/current_conditions"

    //current condition
    XmlRole { name: "condition"; query: "condition/@data/string()" }
    XmlRole { name: "temp_c"; query: "temp_c/@data/string()" }
    XmlRole { name: "humidity"; query: "humidity/@data/string()" }
    XmlRole { name: "icon"; query: "icon/@data/string()" }
    XmlRole { name: "wind_condition"; query: "wind_condition/@data/string()" }
}

}


