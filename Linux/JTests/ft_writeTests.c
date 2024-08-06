#include "JTest.h"
#include "unistd.h"
#include "fcntl.h"
extern int		ft_write(int fd, char *buff, size_t size);

char	*fileName = ".tmpWrite";
int		fd = -1;

TEST_START(writeTests)
	char	buff[64];
	int		ret;

	ret = ft_write(fd, "Hi", 2);
	ASSERT_INT32_EQU(ret, 2);
	ret = ft_write(fd, "\n", 1);
	ASSERT_INT32_EQU(ret, 1);
	ret = ft_write(fd, "GGGGGGGGGGGGG", 4);
	ASSERT_INT32_EQU(ret, 4);

	lseek(fd, SEEK_SET, 0);
	read(fd, buff, 7);

	ASSERT_STR_EQU("Hi\nGGGG", buff);

	memset(buff, 0, 10);
	read(fd, buff, 1);
	ASSERT_STR_EQU("\0", buff);
TEST_END

void Jsetup(){
	fd = open(fileName,  O_RDWR | O_CREAT, 0666);
	if (fd < 0)
		perror("Failed to Open File !!!\n"), exit(1);
}

void Jcleanup(){
	if (close(fd) == -1)
    	perror("close"), exit(1);
    if (unlink(fileName) == -1)
        perror("unlink"), exit(1);
}

int	main(void){
	JTEST_START;
	runAll();
	JTEST_END;
	return 0;
}