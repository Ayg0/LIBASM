# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <errno.h>
# include <unistd.h>

extern size_t	ft_strlen(char *s);
extern char	*ft_strcpy(char *restrict dst, const char *restrict src);
extern int	ft_strcmp(const char *s1, const char *s2);
int	main(){
	char s[] = "f";
	char dst[] = "b";
	//printf("%lu\n", ft_strlen(s));
	//printf("%s\n", ft_strcpy(dst, s));
	//printf("%d\n", ft_strcmp(s, dst));
}
