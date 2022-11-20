#include <string.h>

extern	size_t	ft_strlen(const char *s);
extern	int		ft_write(int fd, char *buf, int count);
extern	char*	ft_strcpy(char *dst, char *src);

int	main()
{
	char	s[] = "EXECUTED CORRECTLY\n";
	char	d[50];


	ft_write(1, s, ft_strlen(s));
	strcpy(d, s);
	ft_write(1, d, ft_strlen(s));
	return (0);
}
