#include "JTest.h"

extern int 		ft_read(int fd, char *buff, size_t size);

TEST_START(readTests)

TEST_END

void Jsetup() {}

void Jcleanup() {}

int	main(void){
	JTEST_START;
	runAll();
	JTEST_END;
	return 0;
}