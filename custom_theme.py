#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 18 03:22:21 PM CET 2024

@author hielke
"""
from pudb.themes.utils import add_setting, link


# Based on XCode's midnight theme
# Looks best in a console with green text against black background
# link("current breakpoint", "current frame name")
# link("focused current breakpoint", "focused current frame name")

palette_dict = {
#     # {{{ base styles
    "background": ("white", "light gray"),
    "selectable": ("white", "default"),
    "focused selectable": ("white", "dark green"),
    "hotkey": (add_setting("black", "underline, italics"), "light gray"),
    "highlighted": ("white", "dark green"),
#     # }}}
#     # {{{ general ui
    "input": ("black", "default"),
    "focused input": ("light green", "default"),
    "warning": (add_setting("white", "bold"), "dark red"),
    "dialog title": (add_setting("white", "bold"), "dark blue"),
    "group head": (add_setting("dark blue", "bold"), "default"),
    "button": (add_setting("white", "bold"), "dark blue"),
    "focused button": ("white", "default"),
    "focused sidebar": ("black", "light gray"),
    "value": (add_setting("yellow", "bold"), "dark blue"),
#     # }}}
#     # {{{ source view
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
#     # }}}
#     # {{{ sidebar
    "sidebar one": (add_setting("black", "bold"), "default"),
    "sidebar two": ("light blue", "default"),
    "sidebar three": ("light cyan", "default"),
#     # }}}
#     # {{{ variables view
    # "variables": "selectable",
    # "variable separator": "background",

    # "var value": "sidebar one",
    # "var label": "sidebar two",
    # "focused var value": "focused sidebar one",
    # "focused var label": "focused sidebar two",

    # "highlighted var label": "highlighted",
    # "highlighted var value": "highlighted",
    # "focused highlighted var label": "focused var label",
    # "focused highlighted var value": "focused var value",

    # "return label": "var label",
    # "return value": "var value",
    # "focused return label": "focused var label",
    # "focused return value": "focused var value",
    "return label": ("white", "dark blue"),
    "return value": ("light gray", "dark cyan"),
    "focused return label": ("light gray", "dark blue"),
    "variable separator": ("light gray", "default"),
#     # }}}
#     # {{{ stack
    "current frame name": (add_setting("white", "bold"), "default"),
    "current frame class": (add_setting("light blue", "bold"), "default"),
    "current frame location": (add_setting("light cyan", "bold"), "default"),

    "focused current frame name": (add_setting("white", "bold"), "dark green"),
    "focused current frame class": (add_setting("white", "bold"), "dark green"),
    "focused current frame location": (add_setting("white", "bold"), "dark green"),
#     # }}}
#     # {{{ breakpoints view
    "breakpoint": ("white", "default"),
    "disabled breakpoint": ("dark gray", "default"),
    "focused disabled breakpoint": ("light gray", "dark blue"),
    "current breakpoint": (add_setting("white", "bold"), "default"),
    "disabled current breakpoint": (add_setting("dark gray", "bold"), "default"),
    "focused current breakpoint": (add_setting("white", "bold"), "dark blue"),
    "focused disabled current breakpoint": (
        add_setting("light gray", "bold"), "dark blue"),
#     # }}}
#     # {{{ shell
    "command line edit": ("white", "default"),
    "command line prompt": (add_setting("default", "bold"), "default"),

    "command line input": ("white", "default"),
    "command line error": (add_setting("light red", "bold"), "default"),

    "command line clear button": (add_setting("white", "bold"), "default"),
    "command line focused button": ("white", "dark blue"),
#     # }}}
#     # {{{ Code syntax
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
#     # }}}
}
# palette_dict2 = {
#     "background": ("standout",),
#     "selectable": (),
#     "focused selectable": ("underline",),
#     "highlighted": ("bold",),
#     "hotkey": ("underline, standout",),
    # "background": ("white", "light gray"),
    # "selectable": ("white", "white"),
    # "focused selectable": ("white", "dark blue"),
    # "hotkey": (add_setting("black", "underline, italics"), "light gray"),
    # "highlighted": ("white", "dark green"),
    # {{{ general ui
    # "input": ("light green", "light gray"),
    # "focused input": ("light green", "light gray"),
    # "warning": (add_setting("white", "bold"), "dark red"),
    # "dialog title": (add_setting("white", "bold"), "dark blue"),
    # "group head": (add_setting("dark blue", "bold"), "light gray"),
    # "button": (add_setting("white", "bold"), "dark blue"),
    # "focused button": ("white", "light gray"),
    # "focused sidebar": ("black", "light gray"),
    # "value": (add_setting("yellow", "bold"), "dark blue"),
    # }}}
    # {{{ source view
    # "source": ("light green", "light gray"),
    # "highlighted source": ("white", "dark green"),
    # "current source": ("white", "brown"),
    # "current focused source": (add_setting("yellow", "bold"), "dark blue"),
    # "breakpoint source": (add_setting("yellow", "bold"), "dark red"),
    # "current breakpoint source": ("black", "dark red"),

    # "line number": ("black", "light gray"),
    # "current line marker": ("dark red", "light gray"),
    # "breakpoint marker": ("dark red", "light gray"),
    # }}}
    # {{{ sidebar
    # "sidebar two": ("light blue", "light gray"),
    # "sidebar three": ("light cyan", "light gray"),
    # }}}
    # {{{ variables view
    # "return label": ("white", "dark blue"),
    # "return value": ("light gray", "dark cyan"),
    # "focused return label": ("light gray", "dark blue"),
    # }}}
    # {{{ stack
    # "current frame name": (add_setting("white", "bold"), "light gray"),
    # "current frame class": (add_setting("light blue", "bold"), "light gray"),
    # "current frame location": (add_setting("light cyan", "bold"), "light gray"),

    # "focused current frame name": (add_setting("white", "bold"), "dark blue"),
    # "focused current frame class": (add_setting("white", "bold"), "dark blue"),
    # "focused current frame location": (add_setting("white", "bold"), "dark blue"),
    # }}}
    # {{{ breakpoints view
    # "breakpoint": ("white", "light gray"),
    # "disabled breakpoint": ("dark gray", "light gray"),
    # "focused disabled breakpoint": ("light gray", "dark blue"),
    # "current breakpoint": (add_setting("white", "bold"), "light gray"),
    # "disabled current breakpoint": (add_setting("dark gray", "bold"), "light gray"),
    # "focused current breakpoint": (add_setting("white", "bold"), "dark blue"),
    # "focused disabled current breakpoint": (
    #     add_setting("light gray", "bold"), "dark blue"),
    # }}}
    # {{{ shell
    # "command line edit": ("white", "light gray"),
    # "command line prompt": (add_setting("white", "bold"), "light gray"),

    # "command line input": ("white", "light gray"),
    # "command line error": (add_setting("light red", "bold"), "light gray"),

    # "command line clear button": (add_setting("white", "bold"), "light gray"),
    # "command line focused button": ("white", "dark blue"),
    # }}}
    # {{{ Code syntax
    # "keyword": ("dark magenta", "light gray"),
    # "operator": ("dark green", "light gray"),
    # "pseudo": ("light magenta", "light gray"),
    # "function": (add_setting("light blue", "bold"), "light gray"),
    # "builtin": ("dark gray", "light gray"),
    # "literal": ("dark cyan", "light gray"),
    # "string": ("dark red", "light gray"),
    # "docstring": ("yellow", "light gray"),
    # "backtick": ("dark green", "light gray"),
    # "punctuation": ("white", "light gray"),
    # "comment": ("white", "light gray"),
    # "exception": ("dark green", "default"),
    # }}}
# }

palette.update(palette_dict)

# vim: foldmethod=marker
