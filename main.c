#include <string.h>
#include <unistd.h>

extern	size_t	ft_strlen(const char *s);
extern	int		ft_write(int fd, char *buf, int count);
extern	char*	ft_strcpy(char *dst, char *src);

int	main()
{
	char	s[] = "EXECUTED CORRECTLY\n";
	char	d[5];


	//write(1, s, ft_strlen(s));
	printf("%p\n", strcpy(d, s));
	printf("%p\n", d);
	write(1, d, ft_strlen(d));
	return (0);
}
