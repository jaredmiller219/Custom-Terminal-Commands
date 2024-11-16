#!/bin/bash
# Personal Commands

# clear and list files in the current directory
function cl() {
    clear && ls
}

# Function to change directory and list the contents
function cdl() {
  cd "$1" && ls
}

# Function to change directory, clear the screen,
# and then list the contents
function ccdl() {
  cd "$1" && clear && ls
}

# Function to make a directory, 
# and then open that new drectory 
# without having to also cd into it
function cddir() {
	mkdir "$1" && cd "$1"
}

# Function to make a directory, 
# and then open that new drectory 
# without having to also cd into it
# and then list the contents
function cddirls() {
	mkdir "$1" && cd "$1" && ls
}

function progs() {
    local progs=(
			"neovim"
			"cloc"
			"spf"
			"next"
		)

    local usages=(
			"nvim <file>"
			"cloc [options] <files>"
			"spf <options>"
			"next <task>"
		)
    
		local descriptions=(
			"Edit a file with Neovim" 
			"Count lines of code in the files" 
			"Run SPF with specified options" 
			"Move to the next task in the list"
		)
    
    if [[ "$1" == "-usage" ]]; then
        # Show usage information for each program in a table format with boxes
        printf "+-----+----------------+------------------------------+----------------------------------------+\n"
        printf "| No. | Program        | Usage                        | Description                            |\n"
        printf "+-----+----------------+------------------------------+----------------------------------------+\n"
        for ((i = 1; i <= ${#progs[@]}; i++)); do
            case "${progs[i]}" in
                neovim)
                    printf "| %-3d | %-14s | %-28s | %-38s |\n" "$((i))" "${progs[i]}" "${usages[i]}" "${descriptions[i]}"
                    ;;
                cloc)
                    printf "| %-3d | %-14s | %-28s | %-38s |\n" "$((i))" "${progs[i]}" "${usages[i]}" "${descriptions[i]}"
                    ;;
                spf)
                    printf "| %-3d | %-14s | %-28s | %-38s |\n" "$((i))" "${progs[i]}" "${usages[i]}" "${descriptions[i]}"
                    ;;
                next)
                    printf "| %-3d | %-14s | %-28s | %-38s |\n" "$((i))" "${progs[i]}" "${usages[i]}" "${descriptions[i]}"
                    ;;
            esac
            printf "+-----+----------------+------------------------------+----------------------------------------+\n"
        done
    elif [[ "$1" == "-list" ]]; then
        # List available programs in a numbered format with boxes
        printf "+-----+----------------+\n"
        printf "| No. | Program        |\n"
        printf "+-----+----------------+\n"
        for ((i = 1; i <= ${#progs[@]}; i++)); do
            printf "| %-3d | %-14s |\n" "$((i))" "${progs[i]}"
            printf "+-----+----------------+\n"
        done
    else
        # Show message if no arguments are provided
        printf "Usage: progs -usage or progs -list\n"
        printf "Please specify either '-usage' to see usage information or '-list' to list available programs.\n"
    fi
}


# List the current directory with all internal directories at the top
function lsdir() {
    # List directories in color without trailing slashes
    for dir in */; do
        printf "\033[1;34m%s\033[0m\n" "${dir%/}"
    done

    # List files in default color
    ls --color=auto -p | grep -v / | sort -t. -k2,2
}

# KEEP THIS AT THE BOTTOM
# Function to show all commands I created
function cmd() {
    if [[ "$1" == "-help" ]] || [[ "$1" == "" ]]; then
        if [[ -z "$2" ]]; then
            # Show all commands
            printf "Command     Usage                    Description\n"
            printf "-------     -----                    -----------\n"
            printf "cl          cl                       Clear the screen and list files\n"
            printf "cdl         cdl directory_name       Change directory and list contents\n"
            printf "ccdl        ccdl directory_name      Change directory, clear screen, and list\n"
            printf "cddir       cddir directory_name     Create a directory and cd into it\n"
            printf "cddirls     cddirls directory_name   Create a directory, cd, and list contents\n"
            printf "progs       list-progs               List command line programs installed\n"
            printf "lsdir       lsdir                    List directories and files in the current directory with all directories at the top\n"
            printf "cmd -help   cmd -help                Display the info of all the commands\n"
            printf "cmd -help   cmd -help (command)      Display the info of a specific command\n"
        else
            # Show specific command help with headers
            printf "Command     Usage                    Description\n"
            printf "-------     -----                    -----------\n"
            case "$2" in
                cl)
                    printf "cl          cl                       Clear the screen and list files\n"
                    ;;
                cdl)
                    printf "cdl         cdl directory_name       Change directory and list contents\n"
                    ;;
                ccdl)
                    printf "ccdl        ccdl directory_name      Change directory, clear screen, and list\n"
                    ;;
                cddir)
                    printf "cddir       cddir directory_name     Create a directory and cd into it\n"
                    ;;
                cddirls)
                    printf "cddirls     cddirls directory_name   Create a directory, cd, and list contents\n"
                    ;;
						list-progs)
                    printf "progs       list-progs               List available programs\n"
                    ;;
                lsdir)
                    printf "lsdir       lsdir                    List directories and files in the current directory with all directories at the top\n"
                    ;;
                cmd)
                    printf "cmd -help   cmd -help                Display the info of ALL the commands\n"
                    printf "            cmd -help (command)      Display a list of a SPECIFIC command\n"
                    ;;
            esac
        fi
    else
        printf "Invalid use of cmd.\nUse 'cmd -help (command)' or 'cmd -help' for a list of custom commands.\n"
    fi
}

