#ifndef JOYSTICKREADER_H
#define JOYSTICKREADER_H
#include<QObject>
#include </home/john/ROV/joystick-master/joystick.hh>
class joystickreader:public QObject
{
    Q_OBJECT
public slots:
    void read();
signals:
    void send(JoystickEvent event);
};

#endif // JOYSTICKREADER_H
