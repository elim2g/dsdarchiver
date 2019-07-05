import QtQuick 2.13
import QtQuick.Controls 2.5

/**
 * Item - Input field used to enter some text
 *
 * Usage:
 *
 * InputField {
 *     id: _inputField;
 *
 *     label: "WAD Name";
 *     placeholderText: "Eg: abyspe10";
 *
 *     onTextChanged: {
 *         // etc
 *     }
 * }
 */
Item {
    property string label:           "Default Label";
    property string placeholderText: "Default PlaceholderText";
    property alias  text:            _textField.text;

    id: root;
    width: parent.width;
    height: _textField.y + _textField.height;



    /**
     * Text - Descriptive label so the user understands what the input is for
     */
    Text {
       id: _textLabel;

       font.pointSize: 10;
       text: root.label;
    }



    /**
     * TextField - User input
     */
    TextField {
        id: _textField;
        height: 50;

        anchors {
            top: _textLabel.bottom;
            topMargin: -10;
            left: parent.left;
            leftMargin: 10;
            right: parent.right;
        }

        placeholderText: root.placeholderText;
    }
}
