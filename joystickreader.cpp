#include "joystickreader.h"
#include "joystick.h"
#include"unistd.h"
#include<QDebug>

void joystickreader::read(){
    // Create an instance of Joystick
//    Joystick joystick("/dev/input/by-id/usb-0810_Twin_USB_Gamepad-joystick");
    Joystick joystick("/dev/input/js0");

    // Ensure that it was found and that we can use it
    if (!joystick.isFound())
    {
//        qDebug() << "open failed.\n";
//        exit(1);
    }
    while (joystick.isFound()) {
        // Restrict rate
        usleep(10000);

        // Attempt to sample an event from the joystick
        JoystickEvent event;
        if (joystick.sample(&event))
        {
            //  qDebug()<< event.number << event.value;
            emit send(event);
        }
    }
}
