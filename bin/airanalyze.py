#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun 19 Mar 2023 03:35:28 PM CET

@author hielke
"""

import os
import sys
from collections import defaultdict

from pyairtable import Table, metadata

key = os.environ['AIRTABLE_API_KEY']

args = sys.argv[1:]
if len(args) == 2:
    base_id = args[0]
    table_id = args[1]
else:
    base_id, table_id = args[0].split('/')

table = Table(key, base_id, table_id)

data = table.all()
meta = metadata.get_table_schema(table)
fields = meta['fields']
field_names = [f['name'] for f in fields]
columns = {n: [] for n in field_names}


def transform_value(val):
    if isinstance(val, list):
        return ''.join(transform_value(v) for v in val)
    value = str(val)
    if value.startswith('rec'):
        return 'rec'  # a rec can be anything
    return value


for record in data:
    for key, column in columns.items():
        fields = record['fields']
        column.append(transform_value(fields.get(key, 'NONE')))

column_strings = {name: '-'.join(column) for name, column in columns.items()}
double_columns = defaultdict(list)

# print(column_strings['Inventory new'])
# print(column_strings['Accessories'])
# print(column_strings['Compressor item'])
# print(column_strings['Inventory new 2'])
for name, column_string in column_strings.items():
    double_columns[column_string].append(name)

# print(double_columns)
inv_fields = [name for name in field_names if name.startswith('Inventor')]
print('Inventory fields', inv_fields)
dups_inv = []
dups_link = []
for double_names in double_columns.values():
    if len(double_names) > 1:
        print("MIGHT BE DUPLICATED: ", double_names)
