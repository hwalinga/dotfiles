#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon 20 Mar 2023 04:43:45 PM CET

@author hielke
"""

import os
import sys

from pyairtable import Table

copied_fields = [
    "Price",
    "Stock Dec 2021",
    "Stock June 2022",
    "Stock Jan 2021",
]
old_name = 'Suppliers view old'
new_name = 'Suppliers view'


key = os.environ['AIRTABLE_API_KEY']

t = Table(key, 'appcZP2FT2NP07Jqc', 'tblLvOnQWA2QS73jh')  # CHANGE HERE


data = t.all()
old = {}  # Desc -> data
new = {}  # Desc -> ID

for rec in data:
    fields = rec['fields']
    desc = fields['Item ID']
    if fields['Sync Source'] == old_name:
        move_data = {}
        for field in copied_fields:
            val = fields.get(field)
            if val:
                move_data[field] = val

        old[desc] = move_data
    elif fields['Sync Source'] == new_name:
        new[desc] = rec['id']
    else:
        print("SOMETHING WRONG")
        sys.exit(-1)

for desc, ID in new.items():
    data = old[desc]
    if data:
        t.update(ID, data)
