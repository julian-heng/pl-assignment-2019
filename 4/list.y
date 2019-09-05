%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../tree.h"

#define FREE(ptr) \
    free((ptr)); \
    (ptr) = NULL;

/*
struct node
{
    int value;
    struct node* left;
    struct node* right;
};
*/

int yylex_destroy(void);

/*
struct node* insert(struct node*, int);
struct node* get_last_node(struct node*);
void print_tree(struct node*);
void deltree(struct node*);
*/
void reset(void);

// Globals
struct node* root;

int num;
%}


%token TOKEN_START TOKEN_NUMBER TOKEN_SEPERATOR TOKEN_END TOKEN_TERMINATE
%start program

%%
program
    : program list TOKEN_TERMINATE
    | list TOKEN_TERMINATE
    ;

list
    :
    | TOKEN_START number_list TOKEN_END
    {
        printf("[");
        print_tree(root, get_last_node(root));
        printf("]\n");

        reset();
    }
    ;

number_list
    :
    | number
    | number_list TOKEN_SEPERATOR number
    ;

number
    : TOKEN_NUMBER
    {
        // For every number found, insert to binary tree
        num++;
        root = insert(root, $1);
    }
    ;
%%


void reset()
{
    struct node* temp;

    num = 0;
    if (root)
        deltree(root);
    root = NULL;
}


void yyerror(const char *str) { fprintf(stderr, "err: %s\n", str); reset(); }
int yywrap() { return 1; }


int main()
{
    reset();
    yyparse();
    yylex_destroy();
}
