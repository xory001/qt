import QtQuick
import QtQuick.Controls 6.8
import My.CBackend 1.0

Window {
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")

    Button {
        id: btn_signal_call
        text: "Signal Call"
        signal logSignal(string text)
        onClicked: logSignal("Log from QML signal")
        Component.onCompleted: logSignal.connect(g_task.stAddLog) // 连接信号到槽
    }

    Button {
        id: btn_async_call
        anchors.left: btn_signal_call.right
        text: "Sync Call"
        onClicked: Qt.callLater(g_task.stAddLog, "Log from QML sync") // 同步调用
    }

    Button {
        text: "Direct Call (Avoid)"
        id: btn_direct_call
        anchors.left: btn_async_call.right
        onClicked: g_task.stAddLog("Log from QML direct") // 主线程运行
    }

    Button {
        anchors.left: btn_direct_call.right
        anchors.top: text1.bottom
        width: 100
        height: 30
        text: "Test"

        signal testClicked(string log)
        onClicked: {
            console.log("btn " + text + " clicked")
            //g_task.stAddLog(this.text + " clicked ")
            //Qt.callLater(g_task.addLog, "Log from QML")
            testClicked(text + " clicked @" + Date.now().toString())
            //g_task.addLog("add log 1") //it calls "addLog" in main thread, and executes in main thread, even g_task has moveToThread.
            //g_task.sgAddlog( "add log 2") //it's can't call sgAddlog, because it's a signal, not function
            //g_task.stAddLog( "add log 3") //it calls "stAddLog" in main thread, and executes in main thread, even g_task has moveToThread.
            //g_task.logText = "add log 4"
        }
        Component.onCompleted: {

            //testClicked.connect(g_threadInfo.Add)
            //testClicked.connect(g_task.addLog)
            //testClicked.connect(g_task.sgAddLog)
            //testClicked.connect(g_task.stAddLog)
        }
    }


    /*
    Button
    {
        x:10
        y:10
        width: 100
        height: 50
        text: qsTr("backend")
        onClicked:
        {
            CBackend.receive("Button 1 msg");
        }

    }



    Button
    {
        x:120
        y:10
        width: 100
        height: 50
        text: qsTr("backend2")
        onClicked:
        {
            CBackend2.receive("Button 2 msg");
        }

    }

    TextArea
    {
        id:textArea
        x:10
        y:70
        font.pointSize: 20
        placeholderText: qsTr("Msg Area")

    }

    Connections
    {
        target: CBackend
        function onMessage( msg )
        {
            textArea.text = msg
        }
    }

    Connections
    {
        target: CBackend2
        function onMessage( msg )
        {
            textArea.text = msg
        }
    }

    */


    /*
    Rectangle
    {
        width: 100
        height: 100
        x: 0
        y: 0
        color: "yellow"
        border.color: "black"
        border.width: 5
        clip: true

        Rectangle
        {
            width: 200
            height: 300
            x:10
            y:10
            color: "blue"
            opacity: 1
            radius: 100
            antialiasing: true
            gradient: Gradient
            {
                orientation:Gradient.Horizontal
                GradientStop
                {
                    position: 0.0
                    color: "#000000"
                }
                GradientStop
                {
                    position: 1.0
                    color: "#ffffff"
                }
            }
            border.color: "red"
            border.width: 5
        }
    }

*/
}
