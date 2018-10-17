import QtQuick 2.11
import QtQuick.Controls 2.4
import com.lsquage.clistlistmodel 1.0

Item {
    id: clientListView

    ClientListModel {
        id: clientListModel
    }

    Rectangle {
        color: "#dc1a1a"
        anchors.fill: parent

        Text {
            text: "Client List Plugin"
            anchors.centerIn: parent
        }

        Column {
            Button {
                text: "Show client 1 detail"
                onClicked: clientListModel.showMonitorView(1)
            }

            Button {
                text: "Show client 2 detail"
                onClicked: clientListModel.showMonitorView(2)
            }
            Button {
                text: "Show client 3 detail"
                onClicked: clientListModel.showMonitorView(3)
            }
        }
    }
}
