// mydemo.h : main header file for the MYDEMO application
//

#if !defined(AFX_MYDEMO_H__ECA81D25_46CC_4B52_A84E_3252CB697246__INCLUDED_)
#define AFX_MYDEMO_H__ECA81D25_46CC_4B52_A84E_3252CB697246__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CMydemoApp:
// See mydemo.cpp for the implementation of this class
//

class CMydemoApp : public CWinApp
{
public:
	CMydemoApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMydemoApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CMydemoApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MYDEMO_H__ECA81D25_46CC_4B52_A84E_3252CB697246__INCLUDED_)
