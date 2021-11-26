#pragma once
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <string>
#include <map>
#include <string.h>
#include <iostream>
#include <stdio.h>
#include <vector>
#ifndef MATCHING_SOLVER_H
#define MATCHING_SOLVER_H

using namespace std;

enum class District { None = 0, MG, SP, RN, RS };

enum class PaymentMethod { None = 0, MONEY, CREDIT, DEBIT };

class Location {
public:
    unsigned int x, y;
    Location(unsigned int x = 0, unsigned int y = 0) : x(x), y(y) {}
    Location& operator=(const Location&);
};

class Customer {
public:
    short signed int age = 0;
    PaymentMethod payment_method;
    District district;
    Location location; 
    Customer(Location location,
             short signed int age = 0,
             PaymentMethod payment_method = PaymentMethod::None,
             District district = District::None) : 
        age(age),
        payment_method(payment_method),
        district(district),
        location(location) {}
    Customer& operator=(const Customer&);   
};

class Store{
    public:
    Location location;
    unsigned int capacity;
    Store( Location location, unsigned int capacity=0):
        location(location), capacity(capacity){}
    Store& operator=(const Store&);

};

class MatchingSolver {
    public:
        signed int num_stores, num_customers;
        vector<Customer> customers;
        vector<Store> stores;
        Location grid_size;
    MatchingSolver(){
            num_stores = 0, num_customers = 0;
        }

};

#endif
                                                 
