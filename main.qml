import QtQuick 2.13
import QtQuick.Controls 2.5
import QtQuick.Window 2.13
import "qml/inputs"

/**
 * Window - Main
 *
 * The graphical entry point of the Application
 */
Window {
    id: _windowMain;
    width: 1280;
    height: 720;

    title: qsTr("DSDArchiver");
    visible: true;



    /**
     * Flickable - Scrolling screen containing the input fields for data entry
     */
    Flickable {
        id: _flickableInputFields;

        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.horizontalCenter;
            rightMargin: (parent.width/2) - (parent.width/3);
            bottom: parent.bottom;
        }

        ScrollBar.vertical: ScrollBar {}
        contentHeight: _columnContent.height;
        topMargin: 10;
        leftMargin: 10;



        /**
         * Column - Contains the input fields and lays them out vertically
         */
        Column {
            id: _columnContent;
            width: parent.width;
            anchors.margins: 10;

            spacing: 10;



            /**
             * InputCheckbox - Whether the run was tool-assisted or not
             */
            InputCheckbox {
                id: _inputCheckboxTas;

                label: "Tool-Assisted?";
                startChecked: false;
            }



            /**
             * InputField - Number of Doomguys active in the demo
             */
            InputField {
                property int minNumDoomguys: 1;
                property int maxNumDoomguys: 100;

                id: _inputFieldNumDoomguys;

                label: "Number of Doomguys (not real players)";
                placeholderText: "eg: 1 if normal demo, 4 if 4player co-op etc";
                textField.inputMethodHints: Qt.ImhDigitsOnly;
                textField.validator: IntValidator {
                    bottom: _inputFieldNumDoomguys.minNumDoomguys;
                    top:    _inputFieldNumDoomguys.maxNumDoomguys;
                }

                onTextChanged: {
                    let num = parseInt(text);

                    if (num < minNumDoomguys) {
                        text = minNumDoomguys;
                        return;
                    }

                    if (num > maxNumDoomguys) {
                        text = maxNumDoomguys;
                        return;
                    }
                }
            }



            /**
             * InputField - WAD Name
             */
            InputField {
                id: _inputFieldWadName;

                label: "WAD Name";
                placeholderText: "eg: abyspe10";
            }



            /**
             * InputField - Player Name
             */
            InputField {
                id: _inputFieldPlayerName;

                label: "Player Name";
                placeholderText: "eg: Looper";
            }
        }
    }



    /**
     * Rectangle - Background colour for a scrollable JSON viewer
     */
    Rectangle {
        id: _rectanglePayloadPreview;

        anchors {
            top: parent.top;
            left: _flickableInputFields.right;
            right: parent.right;
            bottom: parent.bottom;
        }

        color: "#2e2e2e";



        /**
         * Flickable - Scrollable payload preview
         */
        Flickable {
            id: _flickablePayloadPreview;
            anchors.fill: parent;

            // TODO
        }
    }
}
