#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Feb 26 02:40:07 PM CET 2024

@author hielke
"""

class BreakReturn(gdb.Command):
    def __init__(self):
        super().__init__(
            'break-return',
            gdb.COMMAND_RUNNING,
            gdb.COMPLETE_NONE,
            False
        )
    def invoke(self, arg, from_tty):
        frame = gdb.selected_frame()
        # TODO make this work if there is no debugging information, where .block() fails.
        block = frame.block()
        # Find the function block in case we are in an inner block.
        while block:
            if block.function:
                break
            block = block.superblock
        start = block.start
        end = block.end
        arch = frame.architecture()
        pc = gdb.selected_frame().pc()
        instructions = arch.disassemble(start, end - 1)
        for instruction in instructions:
            if instruction['asm'].startswith('retq '):
                gdb.Breakpoint('*{}'.format(instruction['addr']))
BreakReturn()
