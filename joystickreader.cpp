#include "joystickreader.h"
#include "joystick.h"
#include"unistd.h"
#include<QDebug>

void joystickreader::read(){
    // Create an instance of Joystick
    Joystick joystick("/dev/input/by-id/usb-Logitech_Logitech_Extreme_3D-joystick");
//    Joystick joystick("/dev/input/js0");

    // Ensure that it was found and that we can use it
    if (!joystick.isFound())
    {
        printf("open failed.\n");
        exit(1);
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
