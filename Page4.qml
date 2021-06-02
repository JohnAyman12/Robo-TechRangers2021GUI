import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {
    Page {
        id:aboutPage
        width: mainWindow.width
        height: mainWindow.height

        header:
            Image {
            id: headerBackground
            source: "images/about.jpeg"
            width: 800
            height: 60
            Label {
                text: qsTr("About us")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
                color: "white"
            }
        }

        Image {
            id: background
            source: "images/black.jpg"
            width: 1500
            height: 750
        }

        Row{
            x: 20

            Column{

                Label {
                    text: qsTr("Who are we?")
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    color: "white"
                }

                Label {
                    text: "The ROBO-TECH team was established in 2014 by students of the Faculty of Engineering,
Alexandria University, from the mechanical and electrical departments.

The main objective of the team is to participate in the submarine competition (ROVs),
 which is held under the auspices of the organization (MATE) in the United States of America.

Every year, team registration opens to begin the journey of a new generation of our team."
                    font.bold : true
                    font.pixelSize: 18
                    color: "white"
                    padding: 10
                }

                Label {
                    text: qsTr("Why did we set up the team?")
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    color: "white"
                }

                Label {
                    text: "Participating in competitions is the best way to make us grow and apply what we learn,
The goal of the team is to create an environment conducive to creativity and practicality.

And this is why our mission became the transfer of knowledge and experiences from generation to generation,
which prompted us to open a branch in the team for school students to participate with us in the competition.
"
                    font.bold : true
                    font.pixelSize: 18
                    color: "white"
                    padding: 10
                }

                Button{
                    id:site
                    text: "Visit our website"
                    onClicked: {Qt.openUrlExternally("http://robotech-solutions.com/");}
                    background: Rectangle{color: "#eca144"}
                }

                Button{
                    id:facebook
                    text: "Visit our facebook page"
                    onClicked: {Qt.openUrlExternally("https://www.facebook.com/robotech.team/");}
                    background: Rectangle{color: "#3b5998"}
                }
                Button{
                    id:youtube
                    text: "Visit our youtube channel"
                    onClicked: {Qt.openUrlExternally("https://youtube.com/channel/UCzaJpvfqzTWOpQWldfzk7qA");}
                    background: Rectangle{color: "#ff0000"}
                }

            }

            Column{

                Image {
                    id: logo
                    source: "images/logo.png"
                    width: 300
                    height: logo.width
                }

                Image {
                    id: rov
                    x: (0.5 * logo.width) - (0.5 * rov.width)
                    source: "images/ourROV.png"
                    width: 250
                    height: rov.width - 10
                }
            }
        }
    }
}
