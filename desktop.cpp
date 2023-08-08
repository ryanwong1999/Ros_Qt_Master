/******************************************************************
Copyright © Deng Zhimao Co., Ltd. 1990-2030. All rights reserved.
* @projectName   desktop
* @brief         desktop.cpp
* @author        Deng Zhimao
* @email         1252699831@qq.com
* @date          2020-07-31
*******************************************************************/
#include "desktop.h"
#include <QDebug>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <QDir>
MyDesktop::MyDesktop(QObject *parent) : QObject (parent)
{
    timer = new QTimer();
    connect(timer,SIGNAL(timeout()),this,SLOT(getCpuTemp()));
#ifdef __arm__
    getSystemVolume();
    timer->start(1000);
#endif
}

MyDesktop::~MyDesktop()
{

}

void MyDesktop::systemReboot()
{
    system("reboot");
    system("kill -9 $(pidof QDesktop)");
}

void MyDesktop::systemPoweroff()
{
//    system("poweroff");
//    system("kill -9 $(pidof QDesktop)");
}


