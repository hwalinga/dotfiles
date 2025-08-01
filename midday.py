#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 18 03:22:21 PM CET 2024

@author hielke
"""
from pudb.themes.utils import add_setting, link


# Based on old pudb midnight theme
link("current breakpoint", "current frame name")
link("focused current breakpoint", "focused current frame name")

palette_dict = {
    # {{{ base styles
    "background": ("black", "light gray"),
    "selectable": ("black", "default"),
    "focused selectable": ("black", "dark green"),
    "hotkey": (add_setting("black", "underline, italics"), "light gray"),
    "highlighted": ("black", "dark green"),
    # }}}
    # {{{ general ui
    "input": ("default", "default"),
    "focused input": ("light green", "default"),
    "warning": (add_setting("black", "bold"), "dark red"),
    "dialog title": (add_setting("black", "bold"), "dark blue"),
    "group head": (add_setting("dark blue", "bold"), "default"),
    "button": (add_setting("black", "bold"), "dark blue"),
    "focused button": ("black", "default"),
    "focused sidebar": ("black", "light gray"),
    "value": (add_setting("yellow", "bold"), "dark blue"),
    # }}}
    # {{{ source view
    "source": (add_setting("black", "bold"), "default"),
    "focused source": (add_setting("black", "bold"), "dark green"),
    "highlighted source": (add_setting("black", "bold"), "light gray"),

    "current source": (add_setting("black", "bold"), "light gray"),
    "current focused source": (add_setting("black", "bold"), "brown"),
    "breakpoint source": (add_setting("black", "bold"), "dark red"),
    "current breakpoint source": (add_setting("yellow", "bold"), "dark red"),

    "line number": ("black", "default"),
    "current line marker": ("dark red", "default"),
    "breakpoint marker": ("dark red", "default"),
    # }}}
    # {{{ sidebar
    "sidebar one": (add_setting("black", "bold"), "default"),
    "sidebar two": ("light blue", "default"),
    "sidebar three": ("light cyan", "default"),
    # }}}
    # {{{ variables view
    "return label": ("black", "dark blue"),
    "return value": ("light gray", "dark cyan"),
    "focused return label": ("light gray", "dark blue"),
    "variable separator": ("light gray", "default"),
    # }}}
    # {{{ stack
    "current frame name": (add_setting("black", "bold"), "default"),
    "current frame class": (add_setting("light blue", "bold"), "default"),
    "current frame location": (add_setting("light cyan", "bold"), "default"),

    "focused current frame name": (add_setting("black", "bold"), "dark green"),
    "focused current frame class": (add_setting("black", "bold"), "dark green"),
    "focused current frame location": (add_setting("black", "bold"), "dark green"),
    # }}}
    # {{{ breakpoints view
    "breakpoint": ("black", "default"),
    "disabled breakpoint": ("dark gray", "default"),
    "focused disabled breakpoint": ("light gray", "dark blue"),
    "current breakpoint": (add_setting("black", "bold"), "default"),
    "disabled current breakpoint": (add_setting("dark gray", "bold"), "default"),
    "focused current breakpoint": (add_setting("black", "bold"), "dark blue"),
    "focused disabled current breakpoint": (
        add_setting("light gray", "bold"), "dark blue"),
    # }}}
    # {{{ shell
    "command line edit": ("black", "default"),
    "command line prompt": (add_setting("default", "bold"), "default"),

    "command line input": ("black", "default"),
    "command line error": (add_setting("light red", "bold"), "default"),

    "command line clear button": (add_setting("black", "bold"), "default"),
    "command line focused button": ("black", "dark blue"),
    # }}}
    # {{{ Code syntax
    "keyword": ("dark magenta", "default"),
    "operator": ("black", "default"),
    "pseudo": ("light magenta", "default"),
    "function": (add_setting("light blue", "bold"), "default"),
    "builtin": ("dark gray", "default"),
    "literal": ("dark cyan", "default"),
    "string": ("dark red", "default"),
    "docstring": ("dark red", "default"),
    "backtick": ("black", "default"),
    "punctuation": (add_setting("black", "bold"), "default"),
    "comment": ("light green", "default"),
    "exception": ("dark green", "default"),
    # }}}
}

palette.update(palette_dict)

# vim: foldmethod=marker
