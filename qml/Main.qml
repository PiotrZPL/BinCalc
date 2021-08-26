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
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3
import "./"

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'bincalc.piotrzpl'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('BinCalc')
        }

        TextField {
        id: textField
        text: ""
        
        property bool hasError: false
        font.italic: hasError
        anchors {
            topMargin: units.gu(1);
            top: header.bottom
            left: parent.left
            leftMargin: units.gu(1);
            right: parent.right
            rightMargin: units.gu(1);
        }

        height: units.gu(8)
        font.pixelSize: units.gu(4)
        }
        
        Grid {
            anchors { 
                top: textField.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            columns: 3
            rows: 3
            Repeater {
                model: ["/", 0, "*", "-", 1, "+", "."]
                delegate: CalculatorButton {
                    text: modelData.toString ()
                    height: parent.height / parent.rows
                    width: parent.width / parent.columns
                    color: {
                    if ((index == 1) || (index == 4))
                        {
                            return "#AEA79F"
                        } else {
							color_text = "white"
                            return "#E95420"
                        }
                    }
                    onClicked: textField.text += modelData.toString()
                }
            }
			CalculatorButton {
                    text: "="
                    color: "#5E2750"
                    color_text : "white"
                    height: parent.height / parent.rows
                    width: parent.width / parent.columns
                    onClicked: {
                        python.call("example.calculate", [ textField.text ], function ( result ) {
                        var isValid = result[0];
                        if (isValid) {
                        textField.hasError =false
                        textField.text = result[1];
                        } else {
                        textField.hasError =true  
                        }
                    })
                    }
			}
            CalculatorButton {
                    text: "←"
                    color: "#5E2750"
                    color_text : "white"
                    height: parent.height / parent.rows
                    width: parent.width / parent.columns
                    onClicked: {textField.text=textField.text.substr(0, textField.text.length-1);
                    }
            }
        }     
        Python {
            id: python

            Component.onCompleted: {
                addImportPath(Qt.resolvedUrl('../src/'));
            importModule_sync("example")
            }

            onError: {
                console.log('python error: ' + traceback);
            }
        }
    }
}
