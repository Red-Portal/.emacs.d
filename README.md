<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Red-Portal's Emacs init.el</a>
<ul>
<li><a href="#sec-1-1">1.1. Install</a></li>
<li><a href="#sec-1-2">1.2. Supported Platforms</a></li>
<li><a href="#sec-1-3">1.3. Contribution</a>
<ul>
<li><a href="#sec-1-3-1">1.3.1. Bugs</a></li>
<li><a href="#sec-1-3-2">1.3.2. Pull Requests</a></li>
</ul>
</li>
<li><a href="#sec-1-4">1.4. LICENSE</a></li>
</ul>
</li>
</ul>
</div>
</div>

# Red-Portal's Emacs init.el<a id="sec-1" name="sec-1"></a>

Red-Portal's personal emacs configurations. Free, open to everyone.<br />

## Install<a id="sec-1-1" name="sec-1-1"></a>

    git clone --recursive https://github.com/Red-Portal/.emacs.d ~/
    cd ~/.emacs.d
    emacs -setup

Certain emacs packages are supposed to run a initial command at first startup. <br />
This is why `-setup` should be run an first startup.<br />

By the help of `use-package` most packages should be automatically installed.<br />
Naturally, internet connection is required at first startup.<br />

In order to properly use org-mode, You should run the commands below<br />

    cd ./github/org-mode
    make autoloads

This will ensure org-mode is the newest avaiable.<br />
The Emacs default org-mode is sometimes outdated and causes problems.<br />

## Supported Platforms<a id="sec-1-2" name="sec-1-2"></a>

Fully tested only on emacs25 and arch linux.<br />
All platforms supporting emacs25 are supposed to be partially supported.<br />

The most important package for C++ which is `[[https://github.com/Andersbakken/rtags][rtags]]` is not yet supported on Windows.<br />
Thus `rtags` is disabled on Windows by default.<br />
`[[https://github.com/Sarcasm/irony-mode][irony]]` is alternatively enabled for Windows (not tested).<br />

## Contribution<a id="sec-1-3" name="sec-1-3"></a>

### Bugs<a id="sec-1-3-1" name="sec-1-3-1"></a>

Please feel free to contact me ( msca8h@naver.com ) Any time. <br />
Any bugs, improvement suggestions, please fill an issue. <br />

### Pull Requests<a id="sec-1-3-2" name="sec-1-3-2"></a>

Pull Requests for improvements are welcome. <br />
However please state details, rationale for your request.<br />

## LICENSE<a id="sec-1-4" name="sec-1-4"></a>

Red-Portal/.emacs.d Red-Portal's personal emacs settings. <br />
Copyright (C) 2017 Red-Portal <br />

This program is free software: you can redistribute it and/or modify<br />
it under the terms of the GNU General Public License as published by<br />
the Free Software Foundation, either version 3 of the License, or<br />
(at your option) any later version.<br />

This program is distributed in the hope that it will be useful,<br />
but WITHOUT ANY WARRANTY; without even the implied warranty of<br />
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<br />
GNU General Public License for more details.<br />

You should have received a copy of the GNU General Public License<br />
along with this program.  If not, see <https://www.gnu.org/licenses/>.
