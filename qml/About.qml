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
import QtQuick 2.7
import Ubuntu.Components 1.3

Page {
    id: aboutPage
    property var date: new Date()

    header: PageHeader {
        id: aboutPageHeader

        title: i18n.tr("About")

        extension: Sections {
            id: aboutPageHeaderSections

            anchors {
                left: parent.left
                bottom: parent.bottom
            }
            // TRANSTORS: Credits as in the code and design contributors to the app
            model: [i18n.tr("About"), i18n.tr("Credits")]

            StyleHints {
                selectedSectionColor: root.settings.primaryColor
            }
        }
    }


    VisualItemModel {
        id: sections

        Item {
            width: tabView.width
            height: tabView.height

            Flickable {
                id: flickable

                anchors.fill: parent
                contentHeight: dataColumn.height + units.gu(10) + dataColumn.anchors.topMargin

                Column {
                    id: dataColumn

                    spacing: units.gu(3)
                    anchors {
                        top: parent.top; left: parent.left; right: parent.right; topMargin: units.gu(5)
                    }

                    UbuntuShape {
                        width: Math.min(parent.width/2, parent.height/2)
                        height: width
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: "medium"
                        image: Image{
                            source: "../assets/logo.svg"
                        }
                    }

                    Column {
                        width: parent.width
                        Label {
                            width: parent.width
                            fontSize: "x-large"
                            font.weight: Font.DemiBold
                            horizontalAlignment: Text.AlignHCenter
                            text: "PrimeCheck"
                        }
                        Label {
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                            // TRANSLATORS: App version number e.g Version 1.0.0
                            text: i18n.tr("Version %1").arg(root.app_version)
                        }
                    }

                    Column {
                        anchors {
                            left: parent.left
                            right: parent.right
                            margins: units.gu(2)
                        }
                        Label {
                            width: parent.width
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            text: "Copyright (C) 2021 - Piotr Lange"
                        }
                        Label {
                            fontSize: "small"
                            width: parent.width
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            linkColor: UbuntuColors.blue
                            text: i18n.tr("Released under the terms of %1").arg("<a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">the GNU GPL v3</a>")
                            onLinkActivated: Qt.openUrlExternally(link)
                        }
                    }

                    Label {
                        width: parent.width
                        wrapMode: Text.WordWrap
                        fontSize: "small"
                        horizontalAlignment: Text.AlignHCenter
                        linkColor: UbuntuColors.blue
                        text: i18n.tr("Report bugs on %1").arg("<a href=\"https://github.com/PiotrZPL/PrimeCheck/issues\">github.com</a>")
                        onLinkActivated: Qt.openUrlExternally(link)
                    }
                }
            }
        }

        Credits {
            width: tabView.width
            height: tabView.height
        }
    }

    ListView {
        id: tabView
        model: sections
        interactive: false

        anchors {
            top: aboutPageHeader.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem
        currentIndex: aboutPageHeaderSections.selectedIndex
        highlightMoveDuration: UbuntuAnimation.SlowDuration
    }
}
