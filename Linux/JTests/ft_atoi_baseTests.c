#include  "JTest.h"

extern int		ft_atoi_base(char *str, char *base);

void	Jsetup(){}

void	Jcleanup() {}

TEST_START(HEX_VALUES)
	ASSERT_HEX_EQU(0x56, ft_atoi_base("56", "0123456789abcdef"));
	ASSERT_HEX_EQU(0, ft_atoi_base("0", "0123456789abcdef"));				// ?
	ASSERT_HEX_EQU(0xffaa56, ft_atoi_base("ffaa56", "0123456789abcdef"));	// ?
TEST_END

TEST_START(BINARY_VALUES)
	ASSERT_INT32_EQU(5, ft_atoi_base("101", "01"));
	ASSERT_INT32_EQU(0, ft_atoi_base("0", "01"));
	ASSERT_INT32_EQU(0b1101110111, ft_atoi_base("1101110111", "01"));
TEST_END

// ; -1 	str or base are null
// ; -2 	Base elements error
// ; -3		Base Size error
TEST_START(INVALID_BASE)
	ASSERT_INT32_EQU(-2, ft_atoi_base("101", "001"));
	ASSERT_INT32_EQU(-3, ft_atoi_base("0", "0"));
	ASSERT_INT32_EQU(-1, ft_atoi_base("1101110111", NULL));
TEST_END

TEST_START(INVALID_STR)
	ASSERT_INT32_EQU(-1, ft_atoi_base(NULL, "01"));
	ASSERT_INT32_EQU(0, ft_atoi_base("a", "01"));	
	ASSERT_INT32_EQU(2, ft_atoi_base("2a", "01"));	// ?
TEST_END

int	main(){
	JTEST_START;
	runAll();
	JTEST_END;
}