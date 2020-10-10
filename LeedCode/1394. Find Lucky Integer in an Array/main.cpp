#include <iostream>
#include <map>
#include <vector>
using namespace std;

int findLucky(vector<int>&);

int main() 
{
    vector<int> input = {1,2,3,4,5,6,2};

    cout<<findLucky(input)<<endl;


    return 0;

}

int findLucky(vector<int>& arr) {
    map<int,int> input;


    for(int i = 0; i<arr.size(); ++i) {
        input[arr[i]]++;
    }

    for(map<int,int>::reverse_iterator it = input.rbegin();it!=input.rend();++it) {
        if (it->first == it->second)
            return it->first;
    }
    return -1;

}


// int findLucky(vector<int>& arr) {
//     sort(arr.begin(), arr.end());
//     int index = arr.size()-1;
//     int curMaxVal = arr[index];
//     int count = curMaxVal-1;
//     while(true) {
//         --index;
//         if (index >= 0) {
            
//             if (curMaxVal == arr[index]) {
//                 --count;
//             } else {
                
//                 curMaxVal = arr[index];
//                 count = curMaxVal-1;
//             }
//             if (count == 0 && (index == 0 || arr[index-1]!=curMaxVal)) {
//                 return curMaxVal;
//             }
//         } else {
//             return -1;
//         }
//     }
    
    
// }
