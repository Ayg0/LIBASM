# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <errno.h>
# include <unistd.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

extern size_t	ft_strlen(char *s);
extern char	*ft_strcpy(char *restrict dst, const char *restrict src);
extern int	ft_strcmp(const char *s1, const char *s2);
extern int 	ft_read(int fd, char *buff, size_t size);
extern int 	ft_write(int fd, char *buff, size_t size);
extern char	*ft_strdup(const char *s);
int	main(){
	char s[100];
	char *s2;
	int ret;
	ret = ft_read(0, s, 100);
	s2 = ft_strdup(s);
	ft_write(1, s, ft_strlen(s));
	ft_write(1, s2, ft_strlen(s2));
	free(s2);
}
