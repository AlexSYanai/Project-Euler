#include <stdio.h>  
#include <string.h>  

void swap(char* s, int i, int j);
int permute(char* str, int str_len);

int main(void) 
{ 
	int count = 0; 
	char digits[] = "0123456789"; 

	do { 
		count++; 
		if (count == 1000000) break; 
	} while (permute(digits, strlen(digits))); 

	printf("%s\n", digits);
	return 0; 
}

// SEPA Algorithm
// Yea I know the A in SEPA stands for Algorithm
void swap(char* s, int i, int j) 
{ 
	char temp = s[i]; 
	
	s[i] = s[j]; 
	s[j] = temp; 
} 

int permute(char* str, int str_len) 
{ 
	int el 		 = str_len - 1; 
	int new_el = str_len - 1; 
	
	while ((el > 0) && (str[el] <= str[el-1])) 
		el--; 

	el--; 
	if (el < 0)
		return 0; 

	new_el = str_len-1; 
	while ((new_el > el) && (str[new_el] <= str[el]))
		new_el--; 

	swap(str, el, new_el); 
	str_len--; 
	el++; 

	while(str_len>el) { 
		swap(str, str_len, el); 
		el++; 
		str_len--; 
	} 

	return 1; 
} 