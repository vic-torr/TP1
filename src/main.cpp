#include <fstream>
#include <iostream>
#include <string.h>
#include "matching_solver.h"

using namespace std;

/* 
  Deals with files and inputs
*/




class Inputs{
  public:
  int grid_size_x, grid_size_y;
  int num_stores;
  vector<Store> stores;
  int num_customers;
  vector<Customer> customers;
} input;


int file_parser(string fileName){
  ifstream  infile;
  string line;
  stringstream ss;
  infile.open(fileName);
  if (infile.is_open()) {
    try{
      ss << infile.rdbuf();
      ss >> input.grid_size_x >> input.grid_size_y;
      cout << input.grid_size_x << ' ' << input.grid_size_y << endl;
      ss >> input.num_stores;
      cout << input.num_stores << endl;
      int store_x, store_y, capacity;
      for (int i=0; i < input.num_stores; i++) {
        ss >> capacity >> store_x >> store_y;
        cout << capacity << store_x << store_y << endl; 
        input.stores.push_back(Store(Location(store_x,store_y),capacity));
        cout << input.stores[i].location.x<< input.stores[i].capacity << endl;
      } 
      ss >> input.num_customers;
      int customer_x, customer_y, age;

      PaymentMethod payment;
      map<string,PaymentMethod> payment_map;
      payment_map[0] = PaymentMethod::None;
      payment_map["DINHEIRO"] = PaymentMethod::MONEY;
      payment_map["CREDIT"] = PaymentMethod::CREDIT;
      payment_map["DEBIT"] = PaymentMethod::DEBIT;
      District district;  
      map<string,District> district_map;
      district_map[0] = District::None;
      district_map["MG"] = District::MG;
      district_map["SP"] = District::SP;
      district_map["RN"] = District::RN;
      district_map["RS"] = District::RS;

      string district_str, payment_str;
      for (int i=0; i < input.num_stores; i++) {
        ss >> age >> district_str >> payment_str >> customer_x >> customer_y;
        cout << age << district_str << payment_str << customer_x << customer_y;
        input.stores.push_back(Store(Location(store_x,store_y),capacity));
      } 
      return 0;
      cout << line << endl;
      for (int i=0; getline(infile, line); i++) {
          cout << line << endl;
      } 
    } catch(...) {
      cout << "Error while parsing file" << endl; throw; 
    }
    
  infile.close();
  } else { cout << "File not opened or not found!" << endl; }
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
  MatchingSolver solver;
  
  return err;
}
