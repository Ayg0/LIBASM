#include <stdarg.h>
#include <stdio.h>


int	check_base(char *s)
{
	size_t l[2] = {0};
	int	i;
	int	c;

	i = 0;
	while (s[i])
	{
		c = 0;
		if (s[i] > 64)
			c = 1;
		size_t k = ((size_t)1) << (s[i] - ((!(!c)) * 64));
		if ((l[c] & k) == k)
			return (write(1, "ax kadir\n", 9));
		l[c] |= k;
		i++;
	}
	return (0);
}


int	main(int ac, char **av)
{
	int i = 0;
	char l[3] = {0};
	while (i != 128)
	{
		printf("wt?%d::%d\n", i, check_base(l));
		i++;
		l[0] = l[1] = i;
	}
}
