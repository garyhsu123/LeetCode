#include <iostream>
#include <map>
#include <vector>
using namespace std;
vector<string> answer;
void perm(int pair, int i, string output,int leftCount, int rightCount);
void printAnswer(vector<string> arr);

int main()
{
    while (true)
    {
        int n;
        cin >> n; 
        answer.clear();
        perm(n, 0, "", 0, 0);   
        printAnswer(answer);
    }
    return 0;
}

void perm(int pair, int i, string output,int leftCount, int rightCount)
{
        
    if (rightCount == pair) {
        // cout<<"output"<<output<<endl;
        answer.push_back(output);
    } else  {
        // printf("In: i = %d, leftCount = %d, rightCount = %d, output =",i, leftCount,rightCount);
        // cout<<output<<endl;
           
        if(leftCount>rightCount) {
            output+=')';
            perm(pair, i+1, output, leftCount, ++rightCount);      
        }
        //  printf("Mid: i = %d, leftCount = %d, rightCount = %d, output =",i, leftCount,rightCount);
        // cout<<output<<endl;
        if (leftCount < pair) {
            if (i <leftCount + rightCount) {
                output[i] ='(';

                perm(pair,i+1, output, ++leftCount, --rightCount);
            }else {
                output += "(";
                perm(pair,i+1, output, ++leftCount, rightCount);
            }
        }  
    }
}

void printAnswer(vector<string> arr)
{
    for (int i = 0; i < arr.size(); i++)
    {
        cout<<arr[i]<<endl;
    }
    
}