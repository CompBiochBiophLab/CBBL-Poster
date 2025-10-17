CBBL Poster styles
===================

This folder contains the LaTeX style files used by the CBBL poster theme. Keep the files here for a self-contained project, or install them into a TeX tree so other projects and folders can find them.

Overview
--------

- Purpose: provide a poster Beamer theme and supporting style files used by the CBBL group.
- Origin: the CBBL style is based on
  ``%% beamerthemeImperialPoster v1.0 2016/10/01`` created by LianTze Lim (Overleaf).
- License: LPPL 1.3 (same as the original Beamer poster theme). You may modify and redistribute in accordance with LPPL.

Quick example
-------------

Put this near the top of your poster document to use the theme in the same folder as your .tex file:

```latex
\documentclass[final]{beamer}
\usetheme{CBBLPoster} % 
\begin{document}
\begin{frame}
  Poster content here
\end{frame}
\end{document}
```

Ways to make these styles available to other folders/projects
------------------------------------------------------------

1) Project-local (simplest)

- Copy or symlink the entire `common/` folder (or just the `.sty`/`.cls` files you need) into your project folder. LaTeX searches the current directory first, so the files will be found automatically.

2) Add the folder to your TEXINPUTS (temporary, per-shell)

- On Unix-like shells (bash) set TEXINPUTS so LaTeX searches this folder first:

```bash
export TEXINPUTS="/absolute/path/to/CBBL-Poster/common/:$TEXINPUTS"
```

- On Windows (Git Bash / MSYS or WSL) use the same export. For PowerShell:

```powershell
$Env:TEXINPUTS = "C:\path\to\CBBL-Poster\common;" + $Env:TEXINPUTS
```

- Notes: This change is temporary (current shell). Add to your shell startup (`.bashrc`, `.profile`) to persist.

3) Install into a local texmf tree (recommended for per-user install)

- Create a local texmf tree if you don't have one (example path on Windows with TeX Live: `%USERPROFILE%\\texmf`). The standard tree structure is important:

```
<texmf>/tex/latex/cbbl/   <-- put .sty/.cls here
<texmf>/doc/latex/cbbl/   <-- documentation (optional)
```

- Copy files into the tree, for example (bash/git-bash on Windows):

```bash
mkdir -p "$HOME/texmf/tex/latex/cbbl"
cp c:/Users/Jordi/GitHub/RESEARCH/CBBL-Poster/common/*.sty "$HOME/texmf/tex/latex/cbbl/"
cp c:/Users/Jordi/GitHub/RESEARCH/CBBL-Poster/common/*.cls "$HOME/texmf/tex/latex/cbbl/" || true
```

- Update the filename database so TeX knows about the new files:

```bash
mktexlsr "$HOME/texmf"
```

- After this, LaTeX will find the styles with \usepackage{...} or \usetheme{...} regardless of current directory.

4) Using TeX Live Manager (`tlmgr`) and packaging (system-wide; advanced)

- `tlmgr` is primarily used to install packages from TeX Live repos. Installing arbitrary local packages system-wide via `tlmgr` can be done but is more involved and typically requires creating a properly structured package or using the `--usertree` flags.
- For most users, the local texmf tree is simpler and safer than altering the system-wide tree.

Windows-specific notes
----------------------

- If you use MiKTeX, use the MiKTeX Console to add your local tree or place files into the local texmf directory (MiKTeX uses a slightly different tree). After copying, refresh the file name database using the MiKTeX Console.
- If you use TeX Live on Windows, the `$HOME/texmf` method above works. Use `mktexlsr` to refresh.
- When using editors (TeXworks, TeXstudio, Overleaf local sync), ensure the editor's compile command runs in an environment that sees your TEXMF/TEXINPUTS settings.

License and attribution
-----------------------

The CBBL style in this folder is derived from the Imperial Poster theme (LianTze Lim). The original header is preserved in the files:

```
%% beamerthemeImperialPoster v1.0 2016/10/01
%% Beamer poster theme created for Imperial College by LianTze Lim (Overleaf)
%% LICENSE: LPPL 1.3
```

Keep the attribution header when redistributing or modifying the files to comply with LPPL.

Tips and troubleshooting
------------------------

- If LaTeX still can't find a style after installing into `texmf`, run `kpsewhich <filename>.sty` to check where TeX is looking.
- Use `mktexlsr` (or MiKTeX Console refresh) after copying files to update the database.
- Use `-output-directory=build` when compiling with latexmk or pdflatex if you store auxiliary files elsewhere; the search path for styles is still the same.
- For CI or reproducible builds, prefer copying the styles into the repo's build directory or use a `TEXINPUTS` wrapper script to ensure the build environment always finds them.
