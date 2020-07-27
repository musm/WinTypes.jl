# WinTypes

This package defines aliases to [Windows Data types](https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types).

[![](https://img.shields.io/badge/docs-blue.svg)](https://musm.github.io/WinTypes.jl/stable)


### Installation

```julia
pkg> add WinTypes
```

## Why?

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
