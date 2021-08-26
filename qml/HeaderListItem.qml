import QtQuick 2.4
import Ubuntu.Components 1.3

ListItem {
    id: headerListItem

    property alias title: headerText.title

    height: headerText.height + divider.height
    divider.anchors.leftMargin: units.gu(2)
    divider.anchors.rightMargin: units.gu(2)

    ListItemLayout {
        id: headerText
        title.text: " "
        title.font.weight: Font.DemiBold
    }
}
