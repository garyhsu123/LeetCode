#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;


int counts = 0;
void perm(vector<int> arr, int i, bool isValid, void (*print)(vector<int>));
bool swap(vector<int> &arr, int i, int j);
void print(vector<int> arr);
int main() {
    int N = 110;

    vector<int> num;
 
    for(int i = 0; N > 0; ++i) {
        num.push_back(N%10);
        N = N/10;
    }
    sort(num.begin(),num.end());
    perm(num,0,true, print);
    cout<<counts<<endl;
    return 0;
}

void perm(vector<int> arr, int i, bool isValid, void (*print)(vector<int>)) {
    if (i < arr.size()) {
        for (int j = i; j<arr.size(); ++j) {
            // cout<< i <<" "<<j<<endl;
            if (!swap(arr, i, j)) {
                continue;
            }
            bool isValid2 = (!(arr[i] == 0 && i==0) && isValid);
      
            
            perm(arr,i+1,isValid2, print);
            swap(arr, i, j);
        }
    } else {
        if(isValid) {
            ++counts;
            print(arr);
        }
    }
}

bool swap(vector<int> &arr, int i, int j){
    if (i == j) {
        return true;
    } else {
        if( arr[i] == arr[j]) {
            return false;
        } else {
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            return true;
        }
        
    }
}

void print(vector<int> arr) {
    for(int i = 0; i< arr.size(); ++i) {
        cout<<arr[i]<<" ";
    }
    cout<<endl;

}