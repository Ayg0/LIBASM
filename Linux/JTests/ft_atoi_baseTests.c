#include  "JTest.h"

extern int		ft_atoi_base(char *str, char *base);

TEST_START(DEC_VALUES)
	ASSERT_INT32_EQU(56, ft_atoi_base("        \t\v    56", "0123456789"));
	ASSERT_INT32_EQU(0, ft_atoi_base("0", "0123456789"));
	ASSERT_INT32_EQU(0, ft_atoi_base("ffaa56", "0123456789"));
	ASSERT_INT32_EQU(55, ft_atoi_base("55", "0123456789"));
TEST_END

TEST_START(HEX_VALUES)
	ASSERT_HEX_EQU(0x56, ft_atoi_base("56", "0123456789abcdef"));
	ASSERT_HEX_EQU(0, ft_atoi_base("0", "0123456789abcdef"));
	ASSERT_HEX_EQU(0xffaa56, ft_atoi_base("ffaa56", "0123456789abcdef"));
TEST_END

TEST_START(BINARY_VALUES)
	ASSERT_INT32_EQU(5, ft_atoi_base("101", "01"));
	ASSERT_INT32_EQU(0, ft_atoi_base("0", "01"));
	ASSERT_INT32_EQU(0b1101110111, ft_atoi_base("1101110111", "01"));
TEST_END

TEST_START(INVALID_BASE)
	// base contains the same character twice ;
	ASSERT_INT32_EQU(-2, ft_atoi_base("101", "001"));
	//base is empty or size of 1 ;
	ASSERT_INT32_EQU(-2, ft_atoi_base("0", ""));
	ASSERT_INT32_EQU(-2, ft_atoi_base("0", "0"));
	// base contains + or - or whitespaces;
	ASSERT_INT32_EQU(-2, ft_atoi_base("1101110111", "+01"));
	ASSERT_INT32_EQU(-2, ft_atoi_base("1101110111", "-01"));
	ASSERT_INT32_EQU(-2, ft_atoi_base("1101110111", "0 1"));
	// NULL base ;
	ASSERT_INT32_EQU(-1, ft_atoi_base("1101110111", NULL));
TEST_END

TEST_START(INVALID_STR)
	ASSERT_INT32_EQU(-1, ft_atoi_base(NULL, "01"));
TEST_END

TEST_START(CUSTOM_BASES)
	ASSERT_INT32_EQU(2, ft_atoi_base("ba", "ab"));
	ASSERT_INT32_EQU(48, ft_atoi_base("bca", "abcdef"));
	ASSERT_INT32_EQU(0, ft_atoi_base("w", "wa3"));
TEST_END

TEST_START(NEGATIVE_VALUES, IGNORE_TEST)
	// still thinking whether or not I'll implement that
	ASSERT_INT32_EQU(-6, ft_atoi_base("-6", "0123456789"));
	ASSERT_INT32_EQU(-6, ft_atoi_base("-+-+-+-+-+------6", "0123456789"));
TEST_END

void	Jsetup() {}
void	Jcleanup() {}

int	main(){
	JTEST_START;
	runAll();
	JTEST_END;
}