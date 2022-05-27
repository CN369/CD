#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
bool isValidOperator(char ch)
{
    if (ch == '+' ||
        ch == '-' ||
        ch == '*' ||
        ch == '/' ||
        ch == '>' ||
        ch == '<' ||
        ch == '=')
        return true;
    return false;
}

bool isValidDelimiter(char ch)
{
    if (ch == ' ' ||
        ch == ',' ||
        ch == ';' ||
        ch == '(' ||
        ch == ')' ||
        ch == '[' ||
        ch == ']' ||
        ch == '{' ||
        ch == '}' || isValidOperator(ch))
        return true;
    return false;
}

bool isValidKeyword(char *str)
{
    if (!strcmp(str, "main") ||
        !strcmp(str, "int") ||
        !strcmp(str, "char") ||
        !strcmp(str, "if") ||
        !strcmp(str, "else") ||
        !strcmp(str, "for") ||
        !strcmp(str, "while") ||
        !strcmp(str, "break") ||
        !strcmp(str, "continue") ||
        !strcmp(str, "return"))
        return true;
    return false;
}

bool isValidDigit(char ch)
{
    int asciiValue = ch;
    if (asciiValue >= 48 && asciiValue <= 57)
        return true;
    return false;
}
bool isValidLetter(char ch)
{
    int asciiValue = ch;
    if ((asciiValue >= 65 && asciiValue <= 90) || (asciiValue >= 97 && asciiValue <= 122))
        return true;
    return false;
}
bool isvalidIdentifier(char *str)
{
    int i, len = strlen(str);
    if (len == 0)
        return false;
    if (isValidLetter(str[0]))
    {
        for (i = 1; i < len; i++)
        {
            if (!isValidLetter(str[i]) && !isValidDigit(str[i]))
            {
                return false;
            }
        }
        return true;
    }
    else
    {
        return false;
    }
}

bool isValidInteger(char *str)
{
    int i, len = strlen(str);
    if (len == 0)
        return false;
    for (i = 0; i < len; i++)
    {
        if (!isValidDigit(str[i]))
            return false;
    }
    return true;
}
bool isRealNumber(char *str)
{
    int i, len = strlen(str);
    bool hasDecimal = false;
    if (len == 0)
        return false;
    for (i = 0; i < len; i++)
    {

        if (str[i] == '.')
            hasDecimal = true;
        else if (!isValidDigit(str[i]))
            return false;
    }
    return hasDecimal;
}
char *generateSubString(char *str, int start, int end)
{
    int i;
    char *subStr = (char *)malloc(sizeof(char) * (end - start + 2));
    for (i = start; i <= end; i++)
        subStr[i - start] = str[i];
    subStr[end - start + 1] = '\0';
    return subStr;
}
void detectAllTokens(char *str)
{
    int start = 0, end = 0;
    int length = strlen(str);
    while (start <= end && end <= length)
    {
        if (!isValidDelimiter(str[end]))
            end++;
        if (isValidDelimiter(str[end]) && start == end)
        {
            if (isValidOperator(str[end]))
                printf("Valid operator : '%c'\n", str[end]);
            end++;
            start++;
        }
        else if (isValidDelimiter(str[end]) && start != end || (end == length && start != end))
        {
            char *subStr = generateSubString(str, start, end - 1);
            if (isValidKeyword(subStr))
                printf("Valid keyword : '%s'\n", subStr);
            else if (isValidInteger(subStr))
                printf("Valid Integer : '%s'\n", subStr);
            else if (isRealNumber(subStr))
                printf("Real Number : '%s'\n", subStr);
            else if (isvalidIdentifier(subStr) && !isValidDelimiter(str[end - 1]))
                printf("Valid Identifier : '%s'\n", subStr);
            else if (!isvalidIdentifier(subStr) && !isValidDelimiter(str[end - 1]))
                printf("Invalid Identifier : '%s'\n", subStr);
            start = end;
        }
    }
    return;
}
int main()
{
    char str[100] = "int a = b + 100; ";
    printf("All Tokens in '%s' are - \n", str);
    detectAllTokens(str);

    return 0;
}