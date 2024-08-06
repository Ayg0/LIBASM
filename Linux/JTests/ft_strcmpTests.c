#include "JTest.h"

extern int		ft_strcmp(const char *s1, const char *s2);

TEST_START(strcmpTests)
	char s1[] = "abc";
	char s2[] = "abc";

	ASSERT_INT32_EQU(strcmp(s1, s2),ft_strcmp(s1, s2));
	s1[2] = 'd';
	ASSERT_INT32_EQU(strcmp(s1, s2),ft_strcmp(s1, s2));
	s2[2] = 'e';
	ASSERT_INT32_EQU(strcmp(s1, s2),ft_strcmp(s1, s2));
TEST_END

void Jsetup() {}

void Jcleanup() {}

int	main(void){
	JTEST_START;
	runAll();
	JTEST_END;
	return 0;
}