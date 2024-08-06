#include "JTest.h"

extern char		*ft_strdup(const char *s);

TEST_START(strdupTests)
	char s[] = "Hello";
	char *clonedS = NULL;

	clonedS = ft_strdup(s);
	ASSERT_STR_EQU(s, clonedS);
	ASSERT_INT64_EQU(strlen(s), strlen(clonedS));
	free(clonedS);
TEST_END

void Jsetup(){

}

void Jcleanup(){

}

int	main(void){
	JTEST_START;
	runAll();
	JTEST_END;
	return 0;
}