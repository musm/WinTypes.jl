module WinTypes

# References:
# https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types
# https://docs.microsoft.com/en-us/windows/win32/learnwin32/windows-coding-conventions?redirectedfrom=MSDN

const FALSE = Cint(0)
const TRUE = Cint(1)

const BOOL = Cint
# const BOOLEAN = BYTE
const BYTE = Cuchar
const BOOLEAN = BYTE
const CCHAR = Cchar
const CHAR = Cchar
# const COLORREF = DWORD
const DWORD = Culong
const COLORREF = DWORD
const DWORDLONG = UInt64
const DWORD32 = UInt32
const DWORD64 = UInt64
const FLOAT = Cfloat
# const HACCEL = HANDLE
const HANDLE = Ptr{Cvoid}
const HACCEL = HANDLE
const HBITMAP = HANDLE
const HBRUSH = HANDLE
const HCOLORSPACE = HANDLE
const HCONV = HANDLE
const HCONVLIST = HANDLE
# const HCURSOR = HICON
const HDC = HANDLE
const HDDEDATA = HANDLE
const HDESK = HANDLE
const HDROP = HANDLE
const HDWP = HANDLE
const HENHMETAFILE = HANDLE
const HFILE = Cint
const HFONT = HANDLE
const HGDIOBJ = HANDLE
const HGLOBAL = HANDLE
const HHOOK = HANDLE
const HICON = HANDLE
const HCURSOR = HICON
const HINSTANCE = HANDLE
const HKEY = HANDLE
const HKL = HANDLE
const HLOCAL = HANDLE
const HMENU = HANDLE
const HMETAFILE = HANDLE
const HMODULE = HANDLE
const HMONITOR = HANDLE
const HPALETTE = HANDLE
const HPEN = HANDLE
const HRESULT = Clong
const HRGN = HANDLE
const HRSRC = HANDLE
const HSZ = HANDLE
const HWINSTA = HANDLE
const HWND = HANDLE
const INT = Cint
const PHANDLE = Ptr{HANDLE}
const PVOID = Ptr{Cvoid}
const LPVOID = Ptr{Cvoid}
const PWCHAR = Ptr{WCHAR}
const PWORD = Ptr{WORD}
const LPWORD = Ptr{WORD}
const PDWORD = Ptr{DWORD}
const LPDWORD = Ptr{DWORD}
const SHORT = Cshort
const UCHAR = Cuchar
const USHORT = Cushort
const VOID = Cvoid
const WCHAR = Cwchar_t
const WORD = Cushort


const PSTR = Ptr{CHAR} # char*
const LPSTR = Ptr{CHAR} # char*

const PCSTR  = Ptr{CHAR} # const char*
const LPCSTR = Ptr{CHAR} # const char*

const PWSTR = Ptr{WCHAR} # wchar_t*
const LPWSTR = Ptr{WCHAR} # wchar_t*

const PCWSTR = Ptr{WCHAR} # const wchar_t*
const LPCWSTR = Ptr{WCHAR} # const wchar_t*


"""
    const BOOL = Cint

A Boolean variable (should be TRUE or FALSE).

This type is declared in WinDef.h as follows:
typedef int BOOL;

BOOL is a typedef for an integer value that is used in a Boolean context. The header file
WinDef.h also defines two values for use with BOOL.

#define FALSE    0
#define TRUE     1

See also: [`TRUE`](@ref) and [`FALSE`](@ref)

"""
BOOL


"""
    const FALSE = Cint(0)

A Boolean variable denoting FALSE.
"""
FALSE


"""
    const TRUE = Cint(1)

A Boolean variable denoting FALSE. Should only be used in specialized contexts since most functions
that reutnr a `BOOL` type can return any non-zero value to indicate Boolean truth.
"""
TRUE

"""
    const BYTE = Cuchar

A byte (8 bits).

This type is declared in WinDef.h as follows:

typedef unsigned char BYTE;
"""
BYTE

"""
    const BOOLEAN = BYTE

A Boolean variable (should be TRUE or FALSE).

This type is declared in WinNT.h as follows:

typedef BYTE BOOLEAN;
"""
BOOLEAN

"""
    const CCHAR = Cchar

An 8-bit Windows (ANSI) character.

This type is declared in WinNT.h as follows:

typedef char CCHAR;
"""
CCHAR

"""
    const CCHAR = Cchar

An 8-bit Windows (ANSI) character.

This type is declared in WinNT.h as follows:

typedef char CHAR;
"""
CHAR

"""
    const DWORD = Culong

A 32-bit unsigned integer.

This type is declared in IntSafe.h as follows:

typedef unsigned long DWORD;
"""
DWORD

"""
    const DWORDLONG = UInt64

A 64-bit unsigned integer.

This type is declared in IntSafe.h as follows:

typedef unsigned __int64 DWORDLONG;
"""
DWORDLONG

"""
    const DWORD32 = UInt32

A 32-bit unsigned integer.

This type is declared in BaseTsd.h as follows:

typedef unsigned int DWORD32;
"""
DWORD32

"""
    const DWORD64 = UInt64

A 64-bit unsigned integer.

This type is declared in IntSafe.h as follows:

typedef unsigned __int64 DWORD64;
"""
DWORD64

"""
    const FLOAT = Cfloat

A floating-point variable.

This type is declared in WinDef.h as follows:

typedef float FLOAT;
"""
FLOAT

"""
    const HANDLE = Ptr{Cvoid}

A handle to an object.

This type is declared in WinNT.h as follows:

typedef PVOID HANDLE;
"""
HANDLE




"""
    const HKEY = HANDLE

A handle to a registry key.

This type is declared in WinDef.h as follows:

typedef HANDLE HKEY;
"""
HKEY

"""
    cosnt PVOID = Ptr{Cvoid}

A pointer to any type.

This type is declared in WinNT.h as follows:

typedef void *PVOID;
"""
PVOID

"""
    const SHORT = Cshort

A 16-bit integer. The range is -32768 through 32767 decimal.

This type is declared in WinNT.h as follows:

typedef short SHORT;
"""
SHORT


"""
    const UCHAR = Cuchar

An unsigned CHAR.

This type is declared in WinDef.h as follows:

typedef unsigned char UCHAR
"""
UCHAR


"""
    const USHORT = Cushort

An unsigned SHORT. The range is 0 through 65535 decimal.

This type is declared in WinDef.h as follows:

typedef unsigned short USHORT;
"""
USHORT

"""
    const VOID = Cvoid


Any type.

This type is declared in WinNT.h as follows:

#define VOID void
"""
VOID


"""
    const WCHAR = Cwchar_t

A 16-bit Unicode character. For more information, see Character Sets Used By Fonts.

This type is declared in WinNT.h as follows:

typedef wchar_t WCHAR;``
"""
WCHAR

"""
    const WORD = Cushort

A 16-bit unsigned integer. The range is 0 through 65535 decimal.

This type is declared in WinDef.h as follows:

typedef unsigned short WORD;
"""
WORD

end
