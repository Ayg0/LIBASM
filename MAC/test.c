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
			return (5);
		l[c] |= k;
		i++;
	}
	return (0);
}


int	main(int ac, char **av)
{
	int i = 1 << 4;
	printf("%d\n", i);
}
