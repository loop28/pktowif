#!/bin/bash

# Script to calculate the Wallet-Input-Format string for a given private key (BTC etc.)
# License: See bottom of file

# Get private_key from user
read -p "Paste private key and hit ENTER: " private_key

# Add the default prefix of 0x80 to the private key (expand it)
prefix="80"
step_one="$prefix$private_key"
echo "--> prefix added"

# sha256-hash the binary version of step_one and repeat one time
step_two=$(echo -n $step_one| xxd -r -p | sha256sum)
step_three=$(echo -n "$step_two" | xxd -r -p | sha256sum)
echo "--> calculated sha256-sums"

# Get the checksum for calculating the WIF-string (first 8 chars from step_three)
checksum=$(echo -n "$step_three" | head -c 8)
echo "--> got checksum"

# Add the checksum to the expanded version of the private_key
step_four="$step_one$checksum"

# base58-hash the binary version of step_four
wif=$(echo -n "$step_four" | xxd -r -p | base58)

# Echo the WIF and some info
echo "CKS: $checksum"
echo "WIF: $wif"

# Clean the variables for minimal security
unset private_key
unset prefix
unset step_one
unset step_two
unset step_three
unset checksum
unset step_four
unset wif

# Copyright (c) 2021 Elias Mardaus <e.mardaus@runbox.com>
# 
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
