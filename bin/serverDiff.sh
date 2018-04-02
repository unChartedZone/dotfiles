# !/bin/zsh

local_file=$1
remote_file=$2

# echo $local_file
# echo "$remote_file"
ssh cssc0092@edoras.sdsu.edu "cat $remote_file" | diff - $local_file
