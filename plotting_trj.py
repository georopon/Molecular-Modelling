#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
@autor: ROPON-PALACIOS G., PhD (c)
"this script for plotting trajectories files as RMSD"
date: March 11, 2019.
Copyright 2019 KIPU Bioinformatics.
e-mail: biodano.geo@gmail.com
usage: python plotting_trj.py --trj_file big_rmsd.csv 
"""

#-- Importing matplotlib, pandas and numpy
from __future__ import print_function
import argparse as arg
import os
import sys
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np


#--Defining arguments
if __name__ == "__main__": 
	ap = arg.ArgumentParser(description=__doc__) 
	io = ap.add_argument_group('Input options')
	io.add_argument('-t','--trj_file', required=True,
                help='Trajectories input file in CSV format')
	cmd = ap.parse_args()  

#-- Importing MDtraj from any directory 
df = pd.read_csv(open(cmd.trj_file,'rU'), header=0, delimiter=',')
print(df)

#--Defining Data
x = (df['x'])  #-- This is Time in ns
y = (df['y']) * 10 #-- this is root-mean square deviation given in angstrom


#-- Font type
plt.rcParams["font.family"] = "arial"
#-- Frame whole and legend size 
plt.rcParams['axes.linewidth'] = 1.35
plt.rcParams['legend.edgecolor'] = 'inherit'

#-- Plotting MDtraj     
plt.plot(x, y, 'b', linewidth=2.0, label='RMSD')
plt.xlim(0, 40)
plt.ylim(0, 0.4)
plt.xticks(np.arange(min(x), max(x)+10, 10))
plt.yticks(np.arange(min(y), max(y)+1.5, 1.5))
plt.tick_params(which='both',
                 left='on',
                 bottom='on')

#-- Setting GRID 
plt.grid(color='black', linestyle=':', linewidth=1, alpha=0.5)
plt.title('Root-mean square deviation', fontsize=12, fontweight='bold')
plt.xlabel('t (ns)', fontsize=12)
plt.ylabel('rmsd,''C' r'$\alpha$' '(Å)', fontsize=12) 
plt.legend(fontsize=10, loc='upper left')
plt.show() # hide if be want save figure by #

#-- Figure size 
fig_size = plt.rcParams["figure.figsize"] 
fig_size[0] = 20 #-- Ancho    
fig_size[1] = 2 #-- Alto
plt.rcParams["figure.figsize"] = fig_size

#-- Saving plot for given path 
#filename = '/Users/Usuario/Desktop/Python_Plot/rmsd.png' #-- variable plot
#plt.savefig(filename, dpi=500) #-- saving plot






