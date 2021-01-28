# Script to calculate the Wallet-Input-Format string for a given private key (BTC etc.)

# Get private_key from user
read -p "Paste private key and hit ENTER: " private_key

# Add the default prefix of 0x80 to the private key (expand it)
prefix="80"
step_one="$prefix$private_key"
echo "--> prefix added"

# sha256-hash the binary version of step_one and repeat one time
step_two=$(echo -n $step_one| xxd.exe -r -p | sha256sum.exe)
step_three=$(echo -n "$step_two" | xxd.exe -r -p | sha256sum.exe)
echo "--> calculated sha256-sums"

# Get the checksum for calculating the WIF-string (first 8 chars from step_three)
checksum=$(echo -n "$step_three" | head.exe -c 8)
echo "--> got checksum"

# Add the checksum to the expanded version of the private_key
step_four="$step_one$checksum"

# base58-hash the binary version of step_four
wif=$(echo -n "$step_four" | xxd.exe -r -p | base58.exe)

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
