<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Red-Portal's Emacs init.el</a>
<ul>
<li><a href="#sec-1-1">1.1. Install</a></li>
<li><a href="#sec-1-2">1.2. Supported Platforms</a></li>
<li><a href="#sec-1-3">1.3. Used Packages</a></li>
</ul>
</li>
</ul>
</div>
</div>

# Red-Portal's Emacs init.el<a id="sec-1" name="sec-1"></a>

Red-Portal's persomal emacs configurations. Free, open to everyone.

## Install<a id="sec-1-1" name="sec-1-1"></a>

    git clone --recursive https://github.com/Red-Portal/.emacs.d ~/
    cd ~/.emacs.d
    emacs -setup

Certain emacs packages are supposed to run a initial command at first startup.
This is why `-setup` should be run an first startup.

By the help of `use-package` most packages should be automatically installed.
Naturally, internet connection is required at first startup.

## Supported Platforms<a id="sec-1-2" name="sec-1-2"></a>

Tested only on emacs25.
All platforms supporting emacs25 are supported

The most important package for C++ which is `[[https://github.com/Andersbakken/rtags][rtags]]` is not yet supported on Windows.
Thus `rtags` is disabled on Windows by default.
I suggest `[[https://github.com/Sarcasm/irony-mode][irony]]` as an alternative to rtags for Windows.

## Used Packages<a id="sec-1-3" name="sec-1-3"></a>

-   use-package
-   cmake-mode
-   markdown-mode
-   cuda-mode
-   haskell-mode
-   company
-   magit
-   flycheck
-   rtags
-   cmake-ide
-   jedi
-   evil
-   ivy
-   smex
-   smex-ivy
-   doom-themes
-   telephone-line
-   ox-gfm
-   smartparens
-   aggressive-indent
-   reainbow-delimiters
-   electric-pair-mode
-   smartparens
