#include  "JTest.h"

// gcc ft_atoi_baseTests.c -g jtest.a; ./a.out

int		isInvalidBase(char *s){
	char	c = 0;
	int	i = 0, j = 0;
	unsigned long	mask;
	unsigned long f[2] = {0x280100003E00, 0};

	while (s[i]){
		j = 0;
		c = s[i];
		mask = 1;
		if (c >= 64)
			c -= 64, j = 1;
		mask <<= c;
		if (f[j] & mask)
			return -1;
		f[j] |= mask;
		i++;
	}
	return i;
}

int		getIndex(char *base, char element){
	int	i = 0;
	while (base[i])
	{
		if (base[i] == element)
			return i;
		i++;
	}
	return -1;
}

int		ft_atoi_base(char *str, char *base){
	int val = 0, i = 0, baseIndex = 0;
	if (!str || !base)
		goto NULL_ERR;
	int baseLen = isInvalidBase(base);
	if (baseLen < 2)
		goto BASE_ERR;

	while (str[i] == ' ')
		i++;
	while (str[i]){
		baseIndex = getIndex(base, str[i]);
		if (baseIndex == -1)
			break;
		val *= baseLen;
		val += baseIndex;
		i++;
	}
	return val;
	NULL_ERR:
		return -1;
	BASE_ERR:
		return -2;
	STR_ERR:
		return -3;
}

void	Jsetup(){}

void	Jcleanup() {}

TEST_START(DEC_TESTS)
	ASSERT_HEX_EQU(56, ft_atoi_base("        56", "0123456789"));
	ASSERT_HEX_EQU(0, ft_atoi_base("0", "0123456789"));
	ASSERT_HEX_EQU(0, ft_atoi_base("ffaa56", "0123456789"));
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
	// NULL base ;
	ASSERT_INT32_EQU(-1, ft_atoi_base("1101110111", NULL));
	// base contains + or - or whitespaces;
	ASSERT_INT32_EQU(-2, ft_atoi_base("1101110111", "+01"));
	ASSERT_INT32_EQU(-2, ft_atoi_base("1101110111", "-01"));
	ASSERT_INT32_EQU(-2, ft_atoi_base("1101110111", "0 1"));

TEST_END

TEST_START(INVALID_STR)
	ASSERT_INT32_EQU(-1, ft_atoi_base(NULL, "01"));
TEST_END

TEST_START(CUSTOM_BASES)
	ASSERT_INT32_EQU(2, ft_atoi_base("ba", "ab"));
	ASSERT_INT32_EQU(48, ft_atoi_base("bca", "abcdef"));
	ASSERT_INT32_EQU(0, ft_atoi_base("w", "wa3"));
TEST_END

int	main(){
	JTEST_START;
	runAll();
	JTEST_END;
}