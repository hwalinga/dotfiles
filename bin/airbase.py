#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon 27 Feb 2023 04:46:38 PM CET

@author hielke
"""

import json
import os
import sys

from pyairtable import Table, metadata

key = os.environ['AIRTABLE_API_KEY']
