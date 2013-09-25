import sys
import subprocess

def run_command(command):
    print "Executing command: " + command
    proc = subprocess.Popen(
        str(command),
        shell=True,
        stdin=None,
        stdout=subprocess.PIPE,
        stderr=None,
        executable="/bin/bash"
    )
    for line in proc.stdout.readlines():
        print line.rstrip("\n")
        sys.stdout.flush()

def apt_upgrade():
    run_command('apt-get update -y')
    run_command('apt-get upgrade -y')

def install_package(package):
    run_command('apt-get install -y ' + str(package))
