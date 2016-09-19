#!/bin/bash

#SBATCH -o testing%j.out
#SBATCH -e testing%j.err
#SBATCH -N 1
#SBATCH -p allgpu-noecc
#SBATCH -J wunder_data
#SBATCH -t 00:01:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jessejeter@gwu.edu

module load R
ssh login4 -L 27000:128.164.84.113:27000 -L 27001:128.164.84.113:27001 -N &export LM_LICENSE_FILE="27000@localhost"

R -nojvm -nodesktop < WunderData.R