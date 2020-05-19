#!/usr/bin/expect -f
# usage:  ssh user password ipaddres command target
# set Variables
set user "<USERNAME>"
set password "<PASSWORD>"
set ipaddr "<IP_ADDRESS>"
set command "echo hai"
set tmpFile "~/Test/perl/log"
set timeout 120
log_file -noappend $tmpFile
# now connect to remote UNIX box (ipaddr) with given script to execute
spawn ssh $user@$ipaddr $command
match_max 100000
# Look for passwod prompt
expect {
    "yes/no" { send "yes\r"; exp_continue}
    "*assword*" {
        # Send password aka $password
        send -- "$password\r"
    }
    timeout {
        send_user "unreachable\n";
        exit 4
    }
    eof {
        exit
    }
}
# send blank line (\r) to make sure we get back to gui
send -- "\r"
expect eof
