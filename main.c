#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

extern	size_t	ft_strlen(const char *s);
extern	int		ft_write(int fd, char *buf, int count);
extern	int		ft_read(int fildes, void *buf, size_t nbytes);
extern	char	*ft_strdup(const char *s1);
extern	char*	ft_strcpy(char *dst, char *src);
extern	int		ft_strcmp(const char *s1, const char *s2);

int	main(int ac, char **av)
{
	char	s[] = "aaaaa";
	char	d[] = "aaaaa";

	//char *r = ft_strdup("wow");
	//printf("%d;;%s\n", errno, d);
	//perror("ERR");
	printf("%d\n", ft_strcmp(s, d));
	printf("%zu\n", ft_strlen(s));
	return (0);
}
