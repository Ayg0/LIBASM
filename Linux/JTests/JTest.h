#pragma once

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <stdbool.h>

# define MAX_TESTS			100
# define DEFAULT_TEST_STATE	1
# define IGNORE_TEST		0

typedef void (*testFunction)();
typedef struct test{
	testFunction	func;
} _test;

typedef struct testStruct{
	int		testsNb;
	_test	tests[MAX_TESTS];
	int		OKTests;
	int		KOTests;
	int		IgnoredGroupTests;
} _testStruct;

// Declare a New Test Group
// => Optional Param IGNORE_TEST, to ignore the group
# define TEST_START(...) TEST_START_HELPER(__VA_ARGS__, DEFAULT_TEST_STATE)

# define TEST_START_HELPER(base, STATE, ...)\
	void base(); \
    __attribute__((constructor)) void register_##base() { \
        registerTest(base); \
    }\
	void base(){\
		static bool state = STATE, tested;\
		if (tested)\
			return;\
		displayGroup(__COUNTER__, __func__, state);\
		if (!state){\
			tested = true;\
			return;\
		}\
		Jsetup();
// Close the Test Group Block --MUST--
# define TEST_END tested = true;\
	Jcleanup();\
	}

# define ASSERT_INT8_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%d", __LINE__)
# define ASSERT_INT16_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%d", __LINE__)
# define ASSERT_INT32_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%d", __LINE__)
# define ASSERT_INT64_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%ld", __LINE__)

# define ASSERT_UINT8_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%u", __LINE__)
# define ASSERT_UINT16_EQU(EXPECTED, RESULT)	IS_EQUAL_GEN(EXPECTED, RESULT, "%u", __LINE__)
# define ASSERT_UINT32_EQU(EXPECTED, RESULT)	IS_EQUAL_GEN(EXPECTED, RESULT, "%u", __LINE__)
# define ASSERT_UINT64_EQU(EXPECTED, RESULT)	IS_EQUAL_GEN(EXPECTED, RESULT, "%lu", __LINE__)

# define ASSERT_FLOAT_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%.3f", __LINE__)
# define ASSERT_DOUBLE_EQU(EXPECTED, RESULT)	IS_EQUAL_GEN(EXPECTED, RESULT, "%.3f", __LINE__)

# define ASSERT_HEX_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "0x%x", __LINE__)
# define ASSERT_PTR_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%p", __LINE__)
# define ASSERT_CHAR_EQU(EXPECTED, RESULT)		IS_EQUAL_GEN(EXPECTED, RESULT, "%c", __LINE__)

# define ASSERT_STR_EQU(EXPECTED, RESULT)		isEqualStr(EXPECTED, RESULT, __LINE__)

# define ASSERT_DATA_EQU(EXPECTED, RESULT, CMP_FUNC, PRINT_FUNC) isDataEqual(EXPECTED, RESULT, __LINE__, CMP_FUNC, PRINT_FUNC)

# define JTEST_START jStart()
# define JTEST_END jEnd()
void	jEnd();
void	jStart();


#define IS_EQUAL_GEN(EXPECTED, RESULT, FORMAT_STR, LINE) \
    do { \
		printTestInfo(LINE);\
        if ((EXPECTED) == (RESULT)) { \
            displaySuccess(); \
        } else { \
            displayFail(); \
            fprintf(stderr, " => Expected " FORMAT_STR ", resulted " FORMAT_STR "\n", (EXPECTED), (RESULT)); \
        } \
    } while (0)

#ifdef USE_COLORS
	# define DEFF_COLOR "\033[0m"
	# define SUCC_COLOR "\033[1;37;42m"
	# define FAIL_COLOR "\033[1;37;41m"
	# define BLUE_BOLD_COLOR "\033[1;34m"
	# define IGNORE_COLOR "\033[1;36m"
#else
	# define DEFF_COLOR "|"
	# define SUCC_COLOR "|"
	# define FAIL_COLOR "|"
	# define BLUE_BOLD_COLOR "|"
	# define IGNORE_COLOR "|"
#endif

// runs before each Test Group:
void	Jsetup();
// runs after each Test Group:
void	Jcleanup();

void	runAll();
void	runTest(testFunction f);
void	registerTest(testFunction test);

void	isEqualStr(const char *expected, const char *resulted, int lineNb);
void	isDataEqual(void *expected, void *resulted, int lineNb, int (*cmp)(void *, void *), void (*print)(void *));

void	displayFail();
void	displaySuccess();
void	printTestInfo(int lineNb);
void	displayGroup(int count, const char *testGroup, char state);