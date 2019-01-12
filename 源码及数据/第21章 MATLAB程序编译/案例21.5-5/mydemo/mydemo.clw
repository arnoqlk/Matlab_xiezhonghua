; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMydemoDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "mydemo.h"

ClassCount=3
Class1=CMydemoApp
Class2=CMydemoDlg
Class3=CAboutDlg

ResourceCount=3
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource3=IDD_MYDEMO_DIALOG

[CLS:CMydemoApp]
Type=0
HeaderFile=mydemo.h
ImplementationFile=mydemo.cpp
Filter=N

[CLS:CMydemoDlg]
Type=0
HeaderFile=mydemoDlg.h
ImplementationFile=mydemoDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=IDOK

[CLS:CAboutDlg]
Type=0
HeaderFile=mydemoDlg.h
ImplementationFile=mydemoDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_MYDEMO_DIALOG]
Type=1
Class=CMydemoDlg
ControlCount=4
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352

