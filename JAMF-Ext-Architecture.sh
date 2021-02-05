#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	JAMF-Ext-Architecture.sh
#	https://github.com/Headbolt/JAMF-Ext-Architecture
#
#   This Script is designed for use in JAMF as an Extension Attribute
#
#   - This script will ...
#       Look at the Processor Architeture and report it.
#		This was required as the built in JAMF inventory was inconsistently reporting.
#		Possibly due to Rosetta being installed and confusing it
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 05/02/2021
#
#   - 05/02/2021 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
NodeName=$(uname -a | cut -d '/' -f2 | cut -c 9- | awk '{ print $1 }') # Grab the Processor details and pull out the architecture 
#
IFS="_" # Internal Field Seperator (IFS) Delimiter is set to Pipe (_)
#
if [ $ZSH_VERSION ] # Check if shell is ZSH and if so enable IFS
	then
		setopt sh_word_split
fi
#
RELEASE=$( /bin/echo $NodeName | awk '{ print $1 }' ) # Use the newly set IFS to Split the architecture reported to just what we need
#
unset ifs # set the IFS back to normal
#
/bin/echo "<result>$RELEASE</result>" # Write Result out
