# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <errno.h>
# include <unistd.h>

extern size_t	ft_strlen(char *s);
extern char	*ft_strcpy(char *restrict dst, const char *restrict src);
extern int	ft_strcmp(const char *s1, const char *s2);
extern int 	ft_read(int fd, char *buff, size_t size);
extern int 	ft_write(int fd, char *buff, size_t size);

int	main(){
	//char s[] = "f";
	//char dst[] = "b";
	char s[100];
	int ret;
	ret = ft_read(0, s, 9);
	ft_write(1, s, ft_strlen(s));
	//printf("%lu\n", ft_strlen(s));
	//printf("%s\n", ft_strcpy(dst, s));
	//printf("%d\n", ft_strcmp(s, dst));
}
