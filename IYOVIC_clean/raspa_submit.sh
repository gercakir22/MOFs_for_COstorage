#!/bin/bash
#
# CompecTA (c) 2017
#
# You should only work under the /scratch/users/<username> directory.

# Example job submission script
#
# TODO:
#   - Set name of the job below changing "Test" value.
#   - Set the requested number of tasks (cpu cores) with --ntasks parameter.
#   - Select the partition (queue) you want to run the job in:
#     - short : For jobs that have maximum run time of 120 mins. Has higher priority.
#     - long  : For jobs that have maximum run time of 7 days. Lower priority than short.
#     - longer: For testing purposes, queue has 31 days limit but only 3 nodes.
#   - Set the required time limit for the job with --time parameter.
#     - Acceptable time formats include "minutes", "minutes:seconds", "hours:minutes:seconds", "days-hours", "days-hours:minutes" and "days-hours:minutes:seconds"
#   - Put this script and all the input file under the same directory.
#   - Set the required parameters, input and output file names below.
#   - If you do not want mail please remove the line that has --mail-type
#   - Put this script and all the input file under the same directory.
#   - Submit this file using:
#      sbatch raspa_submit.sh
#
# -= Resources =-
#
#SBATCH --job-name=Qmof_4_ethane
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=cosmos
#SBATCH --account=cosmos
#SBATCH --qos=cosmos
#SBATCH --time=7-0
#SBATCH --output=test-%j.out

################################################################################
##################### !!! DO NOT EDIT BELOW THIS LINE !!! ######################
################################################################################
## Load Raspa 2.0.47
echo "RASPA 2.0.47 loading.."
source /kuacc/users/gercakir22/.bashrc

echo ""
echo "======================================================================================"
env
echo "======================================================================================"
echo ""

# Set stack size to unlimited
echo "Setting stack size to unlimited..."
ulimit -s unlimited
ulimit -l unlimited
ulimit -a
echo

COMMAND=simulate
INPUT=simulation.input

echo "Running Raspa Job...!"
echo "==============================================================================="
echo $COMMAND $INPUT
$COMMAND $INPUT
RET=$?
echo
echo "RASPA finished. Return code is $RET"
echo "-------------------------------------------"
echo "RASPA R finished."
