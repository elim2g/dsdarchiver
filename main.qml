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
        anchors.fill: parent;

        ScrollBar.vertical: ScrollBar {}
        contentHeight: _columnContent.height;



        /**
         * Column - Contains the input fields and lays them out vertically
         */
        Column {
            id: _columnContent;
            width: parent.width/2;
            anchors.margins: 10;

            spacing: 10;



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
}
