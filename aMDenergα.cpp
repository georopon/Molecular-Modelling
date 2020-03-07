
/* This script compute Energy and Alpha value from classical MD to accelered MD
input for NAMD2 Writte by: Ropón-Palacios G.,PhD (c) E-mail: georopon@gmail.com
Filiation:
Computational biophysicist, Research
Condensed matter physics Lab, Departament of physics
Universidade Federal de Alfenas, Minas Gerais, Brasil.
date:  4 March 2020.
usage: ./aMDEngAlpha Edihe.dat Etotal.dat 306 4523 
        #residue=306
	#wholeatoms=4523  
*/
#include <math.h>    // math date library
#include <stdio.h>   //
#include <stdlib.h>  // pass char to float
#include <cstdlib>   // pass char to int date
#include <fstream>   // library for read files
#include <iostream>
#include <vector>

// Main fuction
using namespace std;
int main(int argc, char *argv[]) {
  /*
  argc: get total numbers of arguments
  argv: array with the command pass in command line
  */
  if (argc >= 5) {
    // Variable arguments
    // string file = atof(argv[1]);
	int Nresidue = atoi(argv[3]);    
	int Natoms   = atoi(argv[4]);
	
	// Read file in txt fron NAMDplot plugin
    double a, b;
    vector<double> x;
    vector<double> y;

    ifstream f;
    f.open(std::string(argv[1]), ios::in);

    while (f >> a >> b) {
      // To make three arrays for each column (a for 1st column, b for 2nd....)
      x.push_back(a);
      y.push_back(b);
    }
    // a[i], b[i]

    f.close();

    // sum vector and average
    double sum = 0, average = 0;
    int n;
    for (int i = 0; i < y.size(); i++) {
      sum = sum + y[i];
    }

    n = y.size();
    average = sum / n;
    //cout << "Total Energy: " << sum << " Kcal/mol" << endl;
    cout << "Average Dihedral Energy: " << average << " Kcal/mol" << endl;

    // Variable for Dihe definition 
    double Vdiheq = 0, Alphaeq = 0;
    double VTdiheq = 0, AlphaTeq = 0;

    // Math equation pontential dihedral
    
    Vdiheq = average + (4 * Nresidue);
    cout << "accelMDE: " << Vdiheq << " Kcal/mol" << endl;

    Alphaeq = 0.2*(4*Nresidue);
    cout << "accelMDalpha: " << Alphaeq << " Kcal/mol" << endl;

    // MATH EQUATION FOR DUAL BOOST IN aMD SIMULATION 
    // 
	double c, d;
    vector<double> w;
    vector<double> z;

    ifstream J;
    J.open(std::string(argv[2]), ios::in);

    while (J >> c >> d) {
      // To make three arrays for each column (a for 1st column, b for 2nd....)
      w.push_back(c);
      z.push_back(d);
    }
    // a[i], b[i]

    J.close();
	
	 // sum vector and average
    double sum1 = 0, average1 = 0;
    int n1;
    for (int t = 0; t < z.size(); t++) {
      sum1 = sum1 + z[t];
    }

    n1 = z.size();
    average1 = sum1 / n1;
    //cout << "Total Energy: " << sum << " Kcal/mol" << endl;
    cout << "Average Total Energy: " << average1 << " Kcal/mol" << endl;

    VTdiheq = average1 + (0.16*Natoms);
    cout << "accelMDTE: " << VTdiheq << " Kcal/mol" << endl;

    AlphaTeq = (0.16*Natoms);
    cout << "accelMDTalpha: " << AlphaTeq << " Kcal/mol" << endl;

  }

  else {
    cout << "no command pass";
  }

  return 0;
}
