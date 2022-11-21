#include <string.h>
#include <unistd.h>
#include <stdlib.h>

extern	size_t	ft_strlen(const char *s);
extern	int		ft_write(int fd, char *buf, int count);
extern	char*	ft_strcpy(char *dst, char *src);

int	main()
{
	char	*s = malloc(21);
	s =  "EXECUTED CORRECTLY\n";
	char	*d = malloc(5);


	//write(1, s, ft_strlen(s));
	ft_strcpy(d, s);
	ft_write(1, d, 20);
	return (0);
}
