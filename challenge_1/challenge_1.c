#include <stdio.h>

int main(int argc, char *argv[])
{
	int i;
	int limit = 0;
	int count = 0;

	if(argv[1]) limit = atoi(argv[1]);

	for (i = 0; i < limit; i++) {
		if (i % 3 == 0 || i % 5 == 0){
			count += i;	
		}
	}

	printf("%d\n", count);
	return 0;
}