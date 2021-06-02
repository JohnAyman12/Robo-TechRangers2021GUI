#ifndef JOYSTICKREADER_H
#define JOYSTICKREADER_H

#include<QObject>
#include <joystick.h>

class joystickreader:public QObject
{
    Q_OBJECT
public slots:
    void read();

signals:
    void eventDetected(JoystickEvent event);

};

#endif // JOYSTICKREADER_H
