import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Window {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("CTK Quick Plugin Application Demo")

    SplitView {
          anchors.fill: parent
          orientation: Qt.Vertical

          ClientListView {
              width: parent.width
              Layout.fillHeight: true
          }

          LogView {
              width: parent.width
              height: 200
          }
      }
}
