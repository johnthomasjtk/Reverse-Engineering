#include<stdio.h>
int main()
{
int a1[6],a2[6];
int i,cnt=0;
for(i=0;i<6;i++)
 {
	scanf("%d",&a1[i]);
 }
	a2[0]=(a1[0]);
for(i=1;i<6;i++){
	
	a2[i]=(a1[i-1])*(i+1);
	}
for(i=0;i<6;i++){
 	if (a1[i]!=a2[i])
	{printf("BOOM!!!The bomb has blown up.");
	cnt++;
	break;
	}
	
}
	if(cnt==0)
		printf("That's number 2.  Keep going!");
}
