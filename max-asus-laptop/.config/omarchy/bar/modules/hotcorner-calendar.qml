import QtQuick

Item {
  id: root

  property var bar
  implicitWidth: 16
  implicitHeight: bar ? bar.barSize : 32

  function openCalendar() {
    if (bar) bar.run("omarchy-shell shell summon omarchy.clock '{}'")
  }

  Timer {
    id: dwellTimer
    interval: 250
    repeat: false
    onTriggered: root.openCalendar()
  }

  // Extend to the screen edge beyond the bar's built-in right margin.
  Item {
    width: 24
    height: parent.height

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      acceptedButtons: Qt.NoButton
      onEntered: dwellTimer.restart()
      onExited: dwellTimer.stop()
    }
  }
}
