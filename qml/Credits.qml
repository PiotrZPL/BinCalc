/*
 * Copyright (C) 2021  Piotr Lange
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * BinCalc is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.4
import Ubuntu.Components 1.3
import "./"

Item {
    id: creditsPage

    ListModel {
        id: creditsModel
        Component.onCompleted: {
            creditsModel.append({ name: "Igor Sobociński - for substantive support", title: i18n.tr("Huge thanks to:")})
            creditsModel.append({ name: "Johan Guerreros - for Vulgry", title: i18n.tr("Huge thanks to:"), url: "https://launchpad.net/~johangm90" })
            creditsModel.append({ name: "The UBports Foundation - for Ubuntu Touch", title: i18n.tr("Huge thanks to:"), url: "https://ubports.com/foundation/ubports-foundation" })
        }
    }

    UbuntuListView {
        id: credits

        currentIndex: -1
        model: creditsModel
        anchors.fill: parent

        section.property: "title"
        section.labelPositioning: ViewSection.InlineLabels
        section.delegate: HeaderListItem {
            title.text: section
        }

        // Required to accomodate the now playing bar being shown in landscape mode which
        // can hide a setting if not for this footer.
        footer: Item {
            width: parent.width
            height: units.gu(8)
        }

        delegate: ListItem {
            ListItemLayout {
                title.text: model.name
                ProgressionSlot {}
            }
            divider.visible: false
            onClicked: Qt.openUrlExternally(model.url)
        }
    }
}
