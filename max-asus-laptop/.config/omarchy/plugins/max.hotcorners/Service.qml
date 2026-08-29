import QtQuick
import Quickshell
import Quickshell.Wayland

Item {
  id: root

  readonly property int cornerWidth: 28
  readonly property int cornerHeight: 30
  readonly property int dwellInterval: 250

  function openMenu() {
    Quickshell.execDetached(["omarchy-shell", "shell", "summon", "omarchy.menu", "{\"menu\":\"root\"}"])
  }

  function openCalendar() {
    Quickshell.execDetached(["omarchy-shell", "shell", "summon", "omarchy.clock", "{}"])
  }

  Variants {
    model: Quickshell.screens

    delegate: Component {
      Item {
        id: screenCorners
        required property var modelData

        PanelWindow {
          id: leftCorner
          screen: screenCorners.modelData
          implicitWidth: root.cornerWidth
          implicitHeight: root.cornerHeight
          anchors { top: true; left: true }
          color: "transparent"
          WlrLayershell.namespace: "max-hotcorner-left"
          WlrLayershell.layer: WlrLayer.Overlay
          WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
          exclusionMode: ExclusionMode.Ignore

          Timer {
            id: menuTimer
            interval: root.dwellInterval
            repeat: false
            onTriggered: root.openMenu()
          }

          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: menuTimer.restart()
            onExited: menuTimer.stop()
          }
        }

        PanelWindow {
          id: rightCorner
          screen: screenCorners.modelData
          implicitWidth: root.cornerWidth
          implicitHeight: root.cornerHeight
          anchors { top: true; right: true }
          color: "transparent"
          WlrLayershell.namespace: "max-hotcorner-right"
          WlrLayershell.layer: WlrLayer.Overlay
          WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
          exclusionMode: ExclusionMode.Ignore

          Timer {
            id: calendarTimer
            interval: root.dwellInterval
            repeat: false
            onTriggered: root.openCalendar()
          }

          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: calendarTimer.restart()
            onExited: calendarTimer.stop()
          }
        }
      }
    }
  }
}
