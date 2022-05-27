#include <string.h>
#include <stdio.h>
#include <stdlib.h>
int main()
{
    char ch, lhs[20][20], rhs[20][20][20], temp[20], temp1[20];
    int n, n1, count[20], x, y, i, j, k, c[20];
    printf("\nPrem Kumar\n191210037\n");
    printf("\nEnter the no. of Non Terminals : ");
    scanf("%d", &n);
    n1 = n;

    for (i = 0; i < n; i++)
    {
        printf("\nEnter the no. of productions for Non Terminal %d : ", i + 1);
        scanf("%d", &c[i]);
        printf("Enter the LHS : ");
        scanf("%s", lhs[i]);
        for (j = 0; j < c[i]; j++)
        {
            printf("Enter RHS of production %d: ", j + 1);
            scanf("%s", rhs[i][j]);
        }
    }

    for (i = 0; i < n; i++)
    {
        count[i] = 1;
        while (memcmp(rhs[i][0], rhs[i][1], count[i]) == 0)
            count[i]++;
    }

    for (i = 0; i < n; i++)
    {
        count[i]--;
        if (count[i] > 0)
        {
            strcpy(lhs[n1], lhs[i]);
            strcat(lhs[i], "'");
            for (k = 0; k < count[i]; k++)
                temp1[k] = rhs[i][0][k];
            temp1[k++] = '\0';
            for (j = 0; j < c[i]; j++)
            {
                for (k = count[i], x = 0; k < strlen(rhs[i][j]); x++, k++)
                    temp[x] = rhs[i][j][k];
                temp[x++] = '\0';
                if (strlen(rhs[i][j]) == 1)
                {
                    strcpy(rhs[n1][1], rhs[i][j]);
                }
                strcpy(rhs[i][j], temp);
            }
            c[n1] = 2;
            strcpy(rhs[n1][0], temp1);
            strcat(rhs[n1][0], lhs[n1]);
            strcat(rhs[n1][0], "'");
            n1++;
        }
    }
    printf("\nProductions after eliminating left factoring : ");
    for (i = 0; i < n1; i++)
    {
        printf("\n%s -> ", lhs[i]);
        for (j = 0; j < c[i]; j++)
        {
            if (j == 0 && strlen(rhs[i][j]) == 0)
                printf("epsilon");

            if (j != 0 && j != 2)
            {
                printf("| %s ", rhs[i][j]);
            }
            else
            {
                printf(" %s ", rhs[i][j]);
            }
        }
    }
    printf("\n");
    return 0;
}