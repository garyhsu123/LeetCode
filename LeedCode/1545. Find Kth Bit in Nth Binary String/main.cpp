#include <iostream>
#include <vector>
#include <string>
#include <cmath>


using namespace std;

char find(int,int);

int main()
{
  	int n, k;
	while (scanf("%d %d", &n, &k) == 2)
	{
		cout<<find(n,k)<<endl;
	}
	
	return 0;
}

char find(int n, int k)
{
	if(n == 1)
		return '0';
	if(pow(2,n-1) == k)
		return '1';
	if(k < pow(2,n-1))
		return find(n-1,k);
	char ch = find(n-1,(pow(2,n)-k));
	if(ch == '0')
		return '1';
	else
		return '0';
}