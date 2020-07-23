using WinTypes
using Documenter

makedocs(;
    modules=[WinTypes],
    authors="Mustafa Mohamad <mus-m@outlook.com> and contributors",
    repo="https://github.com/musm/WinTypes.jl/blob/{commit}{path}#L{line}",
    sitename="WinTypes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://musm.github.io/WinTypes.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/musm/WinTypes.jl",
)
