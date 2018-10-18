import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import com.lsquage.clientmonitormodel 1.0

Item {
    id: clientMonitor
    visible: true
    anchors.fill: parent

    ClientMonitorModel {
        id: cModel
    }

    SplitView {
          anchors.fill: parent
          orientation: Qt.Vertical

          SplitView {
              width: parent.width
              Layout.fillHeight: true
              orientation: Qt.Horizontal

              Rectangle {
                  width: 200
                  height: parent.height
                  color: "lightblue"

                  Column {
                      Button {
                          text: "Show Client Base Plugin"
                          onClicked: cModel.showPluginView(0, "ClientPlugin.ClientBase")
                      }
                      Button {
                          text: "Show Client File System"
                          onClicked: cModel.showPluginView(0, "ClientPlugin.FileSystem")
                      }
                  }
              }

              ContentView {
                  Layout.fillWidth: true
                  height: parent.height
              }
          }

          LogView {
              width: parent.width
              height: 200
          }
      }
}
