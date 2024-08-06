#include "JTest.h"

extern size_t	ft_strlen(const char *s);

TEST_START(strlenTests)
	ASSERT_INT64_EQU(strlen(""), ft_strlen(""));
	ASSERT_INT64_EQU(strlen("Hi"), ft_strlen("Hi"));
	ASSERT_INT64_EQU(strlen("2323232"), ft_strlen("2323232"));
TEST_END

void Jsetup() {}

void Jcleanup() {}

int	main(void){
	JTEST_START;
	runAll();
	JTEST_END;
	return 0;
}