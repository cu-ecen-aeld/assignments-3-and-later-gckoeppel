#include <stdio.h>
#include <syslog.h>
#include <string.h>
#include <errno.h>


int main(int argc, char* argv[])
{

	// setup syslog
	openlog(NULL, 0, LOG_USER);
	syslog(LOG_INFO, "Start logging");

	// check if two arguments were passed
	// first argument is always the name by which the program was called
	if(argc != 3)
	{
		printf("Nr of arguments invalid: %d\n", argc);
		syslog(LOG_ERR, "Nr of arguments invalid: %d\n", argc);
		return 1;
	} else {
		syslog(LOG_INFO, "writefile: %s", argv[1]);
		syslog(LOG_INFO, "writestr: %s", argv[2]);
	}

	// logging as required by instructions
	syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);

	// open file for writing
	FILE *fptr;
	fptr = fopen(argv[1], "w");

	// check for opening error
	if(fptr == NULL)
	{
		syslog(LOG_ERR, "Error opening file %s: %s\n", argv[1], strerror(errno));
		return 1;
	}

	// write to file, check for error
	if (fprintf(fptr, "%s", argv[2]) < 0)
	{
		syslog(LOG_ERR, "Error writing string %s to file %s: %s\n", argv[2], argv[1], strerror(errno));
		fclose(fptr);
		return 1;
	}

	// close file, check for error
	if (fclose(fptr) != 0)
	{
		syslog(LOG_ERR, "Error closing file %s: %s\n", argv[1], strerror(errno));
		return 1;
	}

	return 0;
}

