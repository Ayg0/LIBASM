#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

extern	size_t	ft_strlen(const char *s);
extern	int		ft_write(int fd, char *buf, int count);
extern	char*	ft_strcpy(char *dst, char *src);
extern	int		ft_strcmp(const char *s1, const char *s2);

int	main(int ac, char **av)
{
	char	s[] = "aaaa";
	char	d[] = "aaaaa";

	read(0, d, 2);
	printf("%d;;%s\n", errno, d);
	perror("ERR");
	return (0);
}
