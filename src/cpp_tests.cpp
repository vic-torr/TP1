#include <fstream>
#include <iostream>
#include <string.h>

using namespace std;

/* 
  Deals with files and inputs
*/




class Inputs{
  int grid_size[2];
  int num_stores;
  vector<int[3]> store_data;
  int num_customers;
  vector<int[3]> customers_data;
};


int file_parser(string fileName){
  ifstream  infile;
  string line;
  infile.open(fileName);
  if (infile.is_open()) {
    while (getline(infile, line)) {
        cout << line << endl;
    }
  infile.close();
  }
  return 0;
}

class Outputs{
  int out;
};


int file_saving(char *fileName_c){
  ofstream outfile;
  outfile.open(fileName_c);
  
  outfile.close();
  return 0;
}


int main(int argc, char *argv[]) {
  char *fileName_c;

  if (argc == 2) {
    fileName_c = argv[1];
    string fileName(fileName_c);
  } else {
    return 2;
  }
  
  int err = file_parser(fileName_c);
  return 0;  
  
  return err;
}