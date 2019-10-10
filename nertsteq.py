"""
@autor: ROPON-PALACIOS G., PhD (c)
date: 25 Sep, 2019.
Ion Channels Lab, IMSaTeD, UNSE-CONICET, SE, Argentina
PI, KIPU Bioinformatics, Perú.
Script for Numerical solution of Nernst equation
e-mail: biodano.geo@gmail.com
usage: python3 nernsteq.py -z 2 -io 2  -ii 0.00007 > potential.dat 
"""

from __future__ import print_function
import argparse as arg
import os
import sys
import math

#--Defining arguments
if __name__ == "__main__":
     ap = arg.ArgumentParser(description=__doc__) 
     io = ap.add_argument_group('Input options')
     io.add_argument('-z', required=True, help='Ion valence i.e Ca2+ = 2')
     io.add_argument('-io', required=True, help='Concentration of Ion outside cell')
     io.add_argument('-ii', required=True, help='Concentration of Ion inside cell')

     out = ap.add_argument_group('Output options')  
     out.add_argument('-o', '--oname', type=str, help='Name of your output')
     cmd = ap.parse_args()

##Importando math
import math
#from __future__ import division #; necesario por python 2.7, python 3.7 no!! 

def nernsteq(z,io,ii):
    #; Definiendo constantes
    R  = 8.3145        #; unit J/K.mol
    T  = 310.15        #; K=C+273.15 C=37 ºC temperatura corporal
    F  = 96485.337     #; unit C/mol 
    #datos
    #z  = 2 Ca2+
    #io = 2 mM ; concentración en el extracelular
    #ii = 0.00007 mM ; 7 nM concentración intracelular
    Veq= R*T/float(z*F)*math.log(io/float(ii)) #; definición de la equación de nernst
    Veq_mV = Veq*1000                          #; La unidas es J/C = V, para llevarlo a mV multiplicamos por 1000
    return Veq_mV

z = int(cmd.z)
io = int(cmd.io)
ii = float(cmd.ii)

print (str(nernsteq(z,io,ii)) + " " + "mV")
#resultado = print (str(nernsteq(z,io,ii)) + " " + "mV")

#; Escribir el output
#if cmd.oname:
   #filename = cmd.oname
   #f = open(filename, "w")
   #f.write(str(resultado) + " " + "mV" + '\n')
   #f.write((str(nernsteq(z,io,ii)) + " " + "mV"))
   #f.close()



