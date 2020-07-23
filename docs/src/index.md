```@meta
CurrentModule = WinTypes
```

# WinTypes

## Usage

First install the package:
```julia
]add WinTypes
```

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

```
HANDLE WINAPI GetStdHandle(
  _In_ DWORD nStdHandle
);
```

```
BOOL WINAPI GetConsoleMode(
  _In_  HANDLE  hConsoleHandle,
  _Out_ LPDWORD lpMode
);
```

As you can see, the call to these APIs using `WinTypes` is easier to translate and
directly translatable without manually looking up the myriad Windows data types.


## Alias List

The following aliases are defined:
```
FALSE = Cint(0)
TRUE = Cint(1)

BOOL = Cint
BOOLEAN = BYTE
BYTE = Cuchar
CCHAR = Cchar
CHAR = Cchar
COLORREF = DWORD
DWORD = Culong
DWORDLONG = UInt64
DWORD32 = UInt32
DWORD64 = UInt64
FLOAT = Cfloat
HACCEL = HANDLE
HANDLE = Ptr{Cvoid}
HBITMAP = HANDLE
HBRUSH = HANDLE
HCOLORSPACE = HANDLE
HCONV = HANDLE
HCONVLIST = HANDLE
HCURSOR = HICON
HDC = HANDLE
HDDEDATA = HANDLE
HDESK = HANDLE
HDROP = HANDLE
HDWP = HANDLE
HENHMETAFILE = HANDLE
HFILE = Cint
HFONT = HANDLE
HGDIOBJ = HANDLE
HGLOBAL = HANDLE
HHOOK = HANDLE
HICON = HANDLE
HINSTANCE = HANDLE
HKEY = HANDLE
HKL = HANDLE
HLOCAL = HANDLE
HMENU = HANDLE
HMETAFILE = HANDLE
HMODULE = HANDLE
HMONITOR = HANDLE
HPALETTE = HANDLE
HPEN = HANDLE
HRESULT = Clong
HRGN = HANDLE
HRSRC = HANDLE
HSZ = HANDLE
HWINSTA = HANDLE
HWND = HANDLE
INT = Cint
PHANDLE = Ptr{HANDLE}
PVOID = Ptr{Cvoid}
LPVOID = Ptr{Cvoid}
SHORT = Cshort
UCHAR = Cuchar
USHORT = Cushort
VOID = Cvoid
WCHAR = Cwchar_t
WORD = Cushort
PWCHAR = Ptr{WCHAR}
PWORD = Ptr{WORD}
LPWORD = Ptr{WORD}
PDWORD = Ptr{DWORD}
LPDWORD = Ptr{DWORD}

PSTR = Ptr{CHAR} # char*
LPSTR = Ptr{CHAR} # char*

PCSTR  = Ptr{CHAR} # char*
LPCSTR = Ptr{CHAR} # char*

PWSTR = Ptr{WCHAR} # wchar_t*
LPWSTR = Ptr{WCHAR} # wchar_t*

PCWSTR = Ptr{WCHAR} # wchar_t*
LPCWSTR = Ptr{WCHAR} # const wchar_t*
```


# Detailed References

Below we include detailed documentation for some of the aliases defined in this package.
We refer to
[https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types](https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types)
for those not included below.

```@autodocs
Modules = [WinTypes]
```
