module WinTypes

# References:
# https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types
# https://docs.microsoft.com/en-us/windows/win32/learnwin32/windows-coding-conventions?redirectedfrom=MSDN

const FALSE     = Cint(0)
const TRUE      = Cint(1)

const BYTE      = Cuchar
const WORD      = Cushort
const DWORD     = Culong
const DWORDLONG = UInt64
const DWORD32   = UInt32
const DWORD64   = UInt64

const BOOL      = Cint
const BOOLEAN   = BYTE

const CHAR      = Cchar
const CCHAR     = Cchar

const FLOAT     = Cfloat

const LONG      = Culong
const ULONG     = Culong
const LONG32    = Cint
const LONG64    = Int64
const LONG_PTR  = Int

const SHORT     = Cshort
const USHORT    = Cushort

const ATOM      = WORD
const LANGID    = WORD

const COLORREF  = DWORD
const LGRPID    = DWORD
const LCTYPE    = DWORD

const LCID      = DWORD

const INT       = Int32
const INT8      = Int8
const INT16     = Int16
const INT32     = Int32
const INT64     = Int64
const INT_PTR   = Int
const UINT_PTR  = UInt

const WPARAM    = UINT_PTR
const LPARAM    = LONG_PTR

#############################################

const HANDLE = Ptr{Cvoid}

const HACCEL       = HANDLE
const HBITMAP      = HANDLE
const HBRUSH       = HANDLE
const HCOLORSPACE  = HANDLE
const HCONV        = HANDLE
const HCONVLIST    = HANDLE
const HDC          = HANDLE
const HDDEDATA     = HANDLE
const HDESK        = HANDLE
const HDROP        = HANDLE
const HDWP         = HANDLE
const HENHMETAFILE = HANDLE
const HFILE        = Cint
const HFONT        = HANDLE
const HGDIOBJ      = HANDLE
const HGLOBAL      = HANDLE
const HHOOK        = HANDLE
const HICON        = HANDLE
const HCURSOR      = HICON
const HINSTANCE    = HANDLE
const HKEY         = HANDLE
const HKL          = HANDLE
const HLOCAL       = HANDLE
const HMENU        = HANDLE
const HMETAFILE    = HANDLE
const HMODULE      = HANDLE
const HMONITOR     = HANDLE
const HPALETTE     = HANDLE
const HPEN         = HANDLE
const HRESULT      = Clong
const HRGN         = HANDLE
const HRSRC        = HANDLE
const HSZ          = HANDLE
const HWINSTA      = HANDLE
const HWND         = HANDLE

#############################################

const PHANDLE = Ptr{HANDLE}

const UCHAR   = Cuchar
const WCHAR   = Cwchar_t
const PWCHAR  = Ptr{WCHAR}

const PWORD   = Ptr{WORD}
const LPWORD  = Ptr{WORD}
const PDWORD  = Ptr{DWORD}
const LPDWORD = Ptr{DWORD}

const VOID    = Cvoid
const PVOID   = Ptr{Cvoid}
const LPVOID  = Ptr{Cvoid}
const LPCVOID = Ptr{Cvoid}

const LPINT   = Ptr{Cint}
const PINT    = Ptr{Cint}

#############################################

const PSTR    = Ptr{CHAR}
const PCSTR   = Ptr{CHAR}
const LPSTR   = Ptr{CHAR}
const LPCSTR  = Ptr{CHAR}

const PWSTR   = Ptr{WCHAR}
const PCWSTR  = Ptr{WCHAR}
const LPWSTR  = Ptr{WCHAR}
const LPCWSTR = Ptr{WCHAR}

end
