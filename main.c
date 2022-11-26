#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <errno.h>

extern	size_t	ft_strlen(const char *s);
extern	int		ft_write(int fd, char *buf, int count);
extern	int		ft_read(int fildes, void *buf, size_t nbytes);
extern	char	*ft_strdup(const char *s1);
extern	char*	ft_strcpy(char *dst, char *src);
extern	int		ft_strcmp(const char *s1, const char *s2);
extern	int 	ft_atoi_base(char *str, char *base);

int	main(int ac, char **av)
{
	char	s[] = "aaaaa";
	char	d[] = "aaaaa";

	int i = ft_atoi_base(av[1], NULL);
	printf("%d\n", i);
	return (0);
}
