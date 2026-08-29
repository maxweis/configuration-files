import QtQuick

Item {
  id: root

  property var bar
  implicitWidth: 16
  implicitHeight: bar ? bar.barSize : 32

  function openMenu() {
    if (bar) bar.run("omarchy-shell shell summon omarchy.menu '{\"menu\":\"root\"}'")
  }

  Timer {
    id: dwellTimer
    interval: 250
    repeat: false
    onTriggered: root.openMenu()
  }

  // Extend eight pixels past the bar's built-in left margin to cover the
  // physical top-left screen corner.
  Item {
    x: -8
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
