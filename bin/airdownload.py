#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon 27 Feb 2023 04:27:57 PM CET

@author hielke
"""

import json
import os
import sys

from pyairtable import Table, metadata


def main():
    args = list(sys.argv[1:])
    if args[0] == '-h' or sys.argv[1] == '--help':
        return print("""
        Set the AIRTABLE_API_KEY environment variable with your API key.

        Usage:
            airdownload.py base_id table_id > output.json
            OR
            airdownload.py base_id/table_id > output.json
        """)

    if args[0] == '--metadata':
        send_metadata = True
        args = args[1:]
    else:
        send_metadata = False

    # print(args)
    if len(args) == 2:
        base_id = args[0]
        table_id = args[1]
    else:
        base_id, table_id = args[0].split('/')

    key = os.environ['AIRTABLE_API_KEY']
    table = Table(key, base_id, table_id)

    if send_metadata:
        data = metadata.get_table_schema(table)
    else:
        data = table.all()

    json.dump(data, sys.stdout)


if __name__ == '__main__':
    main()
