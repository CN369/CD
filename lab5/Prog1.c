#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char *substr(const char *src, int m, int n)
{
    int len = n - m;

    char *dest = (char *)malloc(sizeof(char) * (len + 1));

    for (int i = m; i < n && (*(src + i) != '\0'); i++)
    {
        *dest = *(src + i);
        dest++;
    }

    *dest = '\0';

    return dest - len;
}
int main()

{

    int n;
    printf("Prem Kumar\n191210037");
    printf("\nEnter number of non terminals: ");
    scanf("%d", &n);

    printf("\nEnter non terminals one by one: ");

    int i;

    char nonter[10][10];

    int leftrecr[10];
    for (int i = 0; i < 10; i++)
        leftrecr[i] = 0;

    for (i = 0; i < n; ++i)
    {

        printf("\nNon terminal %d :", i + 1);

        scanf("%s", nonter[i]);
    }

    char prod[10][10][10];
    int prodsize[10];
    char dup[10];

    printf("\nEnter '^' for null/epsilon");

    for (i = 0; i < n; ++i)
    {

        printf("\nNumber of %s productions: ", nonter[i]);

        int k;

        scanf("%d", &k);
        prodsize[i] = k;
        int j;

        printf("\nOne by one enter all %s productions: ", nonter[i]);

        for (j = 0; j < k; ++j)
        {

            printf("\nRHS of production %d : ", j + 1);

            scanf("%s", prod[i][j]);

            if (strlen(nonter[i]) <= strlen(prod[i][j]) && strcmp(nonter[i], substr(prod[i][j], 0, strlen(nonter[i]))) == 0)

                leftrecr[i] = 1;
        }
    }

    for (i = 0; i < n; ++i)
    {

        printf("%d", leftrecr[i]);
    }
    int tn = n, pn = n;
    for (i = 0; i < n; ++i)
    {

        if (leftrecr[i] == 0)

            continue;

        int j;
        strcpy(dup, nonter[i]);
        strcat(dup, "'");
        strcpy(nonter[tn], dup);
        tn++;

        char temp[10][10];
        int kt = 0;
        for (j = 0; j < prodsize[i]; ++j)
        {

            if (strlen(nonter[i]) <= strlen(prod[i][j]) && strcmp(nonter[i], substr(prod[i][j], 0, strlen(nonter[i]))) == 0)
            {
                char dup2[100];
                strcpy(dup2, substr(prod[i][j], strlen(nonter[i]), strlen(prod[i][j]) - strlen(nonter[i])));
                strcpy(temp[kt], strcat(dup2, dup));
                kt++;
                strcpy(prod[i], memmove(&prod[i][j], &prod[i][j + 1], strlen(prod[i]) - j));

                --j;
            }

            else
            {
                char dup2[100];
                strcpy(dup2, prod[i][j]);
                strcat(dup2, dup);
                strcpy(prod[i][j], dup2);
            }
        }
        strcpy(temp[kt], "^");
        strcpy(prod[pn], temp);
        prodsize[pn] = kt;
        pn++;
    }
    n = tn;

    printf("\n\n");

    printf("\nNew set of non-terminals: ");

    for (i = 0; i < tn; ++i)

        printf("%s ", nonter[i]);

    printf("\n\nNew set of productions: ");

    for (i = 0; i < tn; ++i)
    {

        int j;

        for (j = 0; j < prodsize[i]; ++j)
        {

            printf("\n%s -> %s", nonter[i], prod[i][j]);
        }
    }

    return 0;
}