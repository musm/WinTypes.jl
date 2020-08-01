# WinTypes.jl

This package defines aliases in Julia to [Windows Data types](https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types).

[![](https://img.shields.io/badge/docs-blue.svg)](https://musm.github.io/WinTypes.jl)


### Installation

```julia
pkg> add WinTypes
```

## Motivation & Examples

This makes it easier/quicker/more convenient to translate Windows API function from Julia
and also improves readability with respect to the original function definitions in the
Windows API.

Here's an example comparing calling Windows API functions with and without `WinTypes`:

With `WinTypes` a Windows API call would look something like:
```julia
using WinTypes: HANDLE, DWORD, BOOL

function get_console_mode()
    STD_OUTPUT_HANDLE = -11
    hOutput = ccall(:GetStdHandle, stdcall, HANDLE, (DWORD,), STD_OUTPUT_HANDLE % DWORD)
    dwMode = Ref{DWORD}()
    ccall(:GetConsoleMode, stdcall, BOOL, (HANDLE, Ref{DWORD}), hOutput, dwMode)
    return dwMode[]
end
```
Now, compare this to the call without this package:
```julia

function get_console_mode()
    STD_OUTPUT_HANDLE = -11
    hOutput = ccall(:GetStdHandle, stdcall, Ptr{Cvoid}, (UInt32,), STD_OUTPUT_HANDLE % UInt32)
    dwMode = Ref{UInt32}()
    ccall(:GetConsoleMode, stdcall, Int32, (Ref{Cvoid}, Ref{UInt32}), hOutput, dwMode)
    return dwMode[]
end
```

Finally, here are the corresponding Windows API function syntax definitions in `C`:

```c
HANDLE WINAPI GetStdHandle(
  _In_ DWORD nStdHandle
);
```

```c
BOOL WINAPI GetConsoleMode(
  _In_  HANDLE  hConsoleHandle,
  _Out_ LPDWORD lpMode
);
```

As you can see, the call to these APIs using `WinTypes` is simpler and
directly translatable without manually looking up the myriad Windows data types.



## Alias List

Refer to
[https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types](https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types)
for detailed documentation on each constant.
```julia
FALSE     = Cint(0)
TRUE      = Cint(1)

BYTE      = Cuchar
WORD      = Cushort
DWORD     = Culong
DWORDLONG = UInt64
DWORD32   = UInt32
DWORD64   = UInt64

BOOL      = Cint
BOOLEAN   = BYTE

CHAR      = Cchar
CCHAR     = Cchar

FLOAT     = Cfloat

LONG      = Culong
ULONG     = Culong
LONG32    = Cint
LONG64    = Int64
LONG_PTR  = Int

SHORT     = Cshort
USHORT    = Cushort

ATOM      = WORD
LANGID    = WORD

COLORREF  = DWORD
LGRPID    = DWORD
LCTYPE    = DWORD

LCID      = DWORD

INT       = Int32
INT8      = Int8
INT16     = Int16
INT32     = Int32
INT64     = Int64
INT_PTR   = Int
UINT_PTR  = UInt

WPARAM    = UINT_PTR
LPARAM    = LONG_PTR

HANDLE = Ptr{Cvoid}

HACCEL       = HANDLE
HBITMAP      = HANDLE
HBRUSH       = HANDLE
HCOLORSPACE  = HANDLE
HCONV        = HANDLE
HCONVLIST    = HANDLE
HDC          = HANDLE
HDDEDATA     = HANDLE
HDESK        = HANDLE
HDROP        = HANDLE
HDWP         = HANDLE
HENHMETAFILE = HANDLE
HFILE        = Cint
HFONT        = HANDLE
HGDIOBJ      = HANDLE
HGLOBAL      = HANDLE
HHOOK        = HANDLE
HICON        = HANDLE
HCURSOR      = HICON
HINSTANCE    = HANDLE
HKEY         = HANDLE
HKL          = HANDLE
HLOCAL       = HANDLE
HMENU        = HANDLE
HMETAFILE    = HANDLE
HMODULE      = HANDLE
HMONITOR     = HANDLE
HPALETTE     = HANDLE
HPEN         = HANDLE
HRESULT      = Clong
HRGN         = HANDLE
HRSRC        = HANDLE
HSZ          = HANDLE
HWINSTA      = HANDLE
HWND         = HANDLE

PHANDLE = Ptr{HANDLE}

UCHAR   = Cuchar
WCHAR   = Cwchar_t
PWCHAR  = Ptr{WCHAR}

PWORD   = Ptr{WORD}
LPWORD  = Ptr{WORD}
PDWORD  = Ptr{DWORD}
LPDWORD = Ptr{DWORD}

VOID    = Cvoid
PVOID   = Ptr{Cvoid}
LPVOID  = Ptr{Cvoid}
LPCVOID = Ptr{Cvoid}

LPINT   = Ptr{Cint}
PINT    = Ptr{Cint}

PSTR    = Ptr{CHAR}
PCSTR   = Ptr{CHAR}
LPSTR   = Ptr{CHAR}
LPCSTR  = Ptr{CHAR}

PWSTR   = Ptr{WCHAR}
PCWSTR  = Ptr{WCHAR}
LPWSTR  = Ptr{WCHAR}
LPCWSTR = Ptr{WCHAR}
```
