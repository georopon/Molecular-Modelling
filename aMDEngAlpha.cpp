
/* This script compute Energy and Alpha value from classical MD to accelered MD input for NAMD2
Writte by: Ropón-Palacios G.,PhD (c)
E-mail: georopon@gmail.com
Filiation:
Computational biophysicist, Research
Condensed matter physics Lab, Departament of physics
Universidade Federal de Alfenas, Minas Gerais, Brasil.
date:  4 March 2020.
usage: ./aMDEngAlpha data.txt #solute-residue
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
  if (argc >= 3) {
    // Variable arguments
    // string file = atof(argv[1]);
    int sr = atoi(argv[2]);
    // variables arrays
    // double x[1000000000], y[10000000000];
    // int i;
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
    for (int j = 0; j < y.size(); j++) {
      sum = sum + y[j];
    }

    n = y.size();
    average = sum / n;
    cout << "Average Energy: " << average << " Kcal/mol" << endl;

    // float dihed = atof(argv[1]);
    // Vdiheq = meandihe + (4 kcal/mol.residue * 306 solute res)
    // alphaeq = 1/5 * (4 kcal/mol.resdiue * 306 solute res)
    // defining variables
    double Vdiheq = 0, Alphaeq = 0;

    // Math equation
    Vdiheq = average + (4 * sr);
    cout << "accelMDE: " << Vdiheq << " Kcal/mol" << endl;

    Alphaeq = 0.2 * (4 * sr);
    cout << "accelMDalpha: " << Alphaeq << " Kcal/mol" << endl;
  }

  else {
    cout << "no command pass";
  }

  return 0;
}
