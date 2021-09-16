/*  CalculatorButton.qml */
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

Rectangle {
    property alias text: label.text
    signal clicked 

    color: "#AEA79F"
    radius: units.gu(1) 
    border.width: units.gu(0.25) 
	border.color: backgroundColor

    property alias color_text: label.color
    Label {
        id: label
        font.pixelSize: units.gu(4)
        anchors.centerIn: parent
        color: "#111"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
