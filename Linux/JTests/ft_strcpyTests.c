#include "JTest.h"

extern char		*ft_strcpy(char *restrict dst, const char *restrict src);

TEST_START(strcpyTests)
	char	src[20] = "Hello !";
	char	dest[20] = "Hiiiiiiiii";
	char	*ret;

	ret = ft_strcpy(dest, src);
	ASSERT_STR_EQU(src, dest);
	ASSERT_PTR_EQU(dest, ret);
	// ENDs with '\0'
	ASSERT_INT8_EQU(0, dest[7]);
	// doesn't override what's after that:
	ASSERT_INT8_EQU('i', dest[8]);
TEST_END

void Jsetup() {}

void Jcleanup() {}

int	main(void){
	JTEST_START;
	runAll();
	JTEST_END;
	return 0;
}