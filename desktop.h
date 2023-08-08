/******************************************************************
Copyright © Deng Zhimao Co., Ltd. 1990-2030. All rights reserved.
* @projectName   desktop
* @brief         desktop头文件
* @author        Deng Zhimao
* @email         1252699831@qq.com
* @date          2020-06-01
*******************************************************************/
#ifndef DESKTOP_H
#define DESKTOP_H
#include <QObject>
#include <QProcess>
#include <QTimer>
class MyDesktop : public QObject
{
    Q_OBJECT

public:
    explicit MyDesktop(QObject *parent = 0);
    ~MyDesktop();

    Q_INVOKABLE void systemReboot();
    Q_INVOKABLE void systemPoweroff();

private:
    QProcess *myProcess;
    QTimer *timer;


};

#endif // DESKTOP_H
