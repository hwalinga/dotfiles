#!/bin/bash
cat << EOF
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
EOF
echo -n "Created on "
date
echo
echo "@author $(whoami)"
echo '"""'
