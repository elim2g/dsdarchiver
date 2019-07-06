import QtQuick 2.13
import QtQuick.Controls 2.5

/**
 * Item - Checkbox to toggle a boolean value
 *
 * Usage:
 *
 * InputCheckbox {
 *     id: _inputCheckbox;
 *
 *     label: "Tool-Assisted?";
 *     startChecked: false;
 *
 *     onCheckedChanged: {
 *         // etc
 *     }
 * }
 */
Item {
    property string label:        "Default label";
    property bool   checked:      _checkBox.checked; // Whether the box is currently checked or not
    property bool   startChecked: false;             // Default the box to checked?
    property alias  checkBox:     _checkBox;

    id: root;
    width: Math.max(_textLabel.x + _textLabel.contentWidth, _checkBox.x + _checkBox.width);
    height: _checkBox.y + _checkBox.height;



    /**
     * Text - Descriptive label so the user understands what the input is for
     */
    Text {
       id: _textLabel;

       font.pointSize: 10;
       text: root.label;
    }



    /**
     * CheckBox - A simple box that can be toggled on or off
     */
    CheckBox {
        id: _checkBox;
        height: 50;

        anchors {
            top: _textLabel.bottom;
            topMargin: -10;
            left: parent.left;
            leftMargin: 10;
        }

        checked: root.startChecked;
    }
}
