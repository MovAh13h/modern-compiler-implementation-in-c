%{
#include <stdlib.h>
#include <string.h>
#include "util.h"
#include "tokens.h"
#include "errormsg.h"

int charPos = 1;
int nestedComment = 0;

int yywrap() {
	charPos = 1;
	return 1;
}

void adjust() {
	EM_tokPos = charPos;
	charPos += yyleng;
}

char* globalString = NULL;
size_t currentSize = 0;
size_t maxSize = 32;

void initializeString() {
    if (globalString == NULL) {
        globalString = (char *) malloc(maxSize * sizeof(char));
        if (globalString == NULL) {
            EM_error(EM_tokPos, "memory allocation failed");
        }
    } else {
        currentSize = 0;
        globalString[0] = '\0';
    }
}

void appendString(char character) {
    // Check if the current size is equal to or greater than the maximum size
    if (currentSize >= maxSize) {
        // Double the size
        maxSize *= 2;

        // Allocate a new buffer
        char *newString = (char *) realloc(globalString, maxSize * sizeof(char));
        if (newString == NULL) {
            EM_error(EM_tokPos, "memory allocation failed");
        }

        // Update the global string pointer
        globalString = newString;
    }

    // Append the character to the end
    globalString[currentSize++] = character;
    globalString[currentSize] = '\0';
}

%}

%Start COMMENT STR

%%


<INITIAL>(" "|"\t")	 {adjust(); continue;}
<INITIAL>("\n"|"\r\n")	 {adjust(); EM_newline(); continue;}

<INITIAL>","	 {adjust(); return COMMA;}
<INITIAL>":"	 {adjust(); return COLON;}
<INITIAL>";"	 {adjust(); return SEMICOLON;}
<INITIAL>"("	 {adjust(); return LPAREN;}
<INITIAL>")"	 {adjust(); return RPAREN;}
<INITIAL>"["	 {adjust(); return LBRACK;}
<INITIAL>"]"	 {adjust(); return RBRACK;}
<INITIAL>"{"	 {adjust(); return LBRACE;}
<INITIAL>"}"	 {adjust(); return RBRACE;}
<INITIAL>"."	 {adjust(); return DOT;}
<INITIAL>"+"	 {adjust(); return PLUS;}
<INITIAL>"-"	 {adjust(); return MINUS;}
<INITIAL>"*"	 {adjust(); return TIMES;}
<INITIAL>"/"	 {adjust(); return DIVIDE;}
<INITIAL>"="	 {adjust(); return EQ;}
<INITIAL>"<>"	 {adjust(); return NEQ;}
<INITIAL>"<"	 {adjust(); return LT;}
<INITIAL>"<="	 {adjust(); return LE;}
<INITIAL>">"	 {adjust(); return GT;}
<INITIAL>">="	 {adjust(); return GE;}
<INITIAL>"&"	 {adjust(); return AND;}
<INITIAL>"|"	 {adjust(); return OR;}
<INITIAL>":="	 {adjust(); return ASSIGN;}
<INITIAL>"array"	 {adjust(); return ARRAY;}
<INITIAL>"if"	 {adjust(); return IF;}
<INITIAL>"then"	 {adjust(); return THEN;}
<INITIAL>"else"	 {adjust(); return ELSE;}
<INITIAL>"while"	 {adjust(); return WHILE;}
<INITIAL>"for"	 {adjust(); return FOR;}
<INITIAL>"to"	 {adjust(); return TO;}
<INITIAL>"do"	 {adjust(); return DO;}
<INITIAL>"let"	 {adjust(); return LET;}
<INITIAL>"in"	 {adjust(); return IN;}
<INITIAL>"end"	 {adjust(); return END;}
<INITIAL>"of"	 {adjust(); return OF;}
<INITIAL>"break"	 {adjust(); return BREAK;}
<INITIAL>"nil"	 {adjust(); return NIL;}
<INITIAL>"function"	 {adjust(); return FUNCTION;}
<INITIAL>"var"	 {adjust(); return VAR;}
<INITIAL>"type"	 {adjust(); return TYPE;}

<INITIAL>"/*" {adjust(); BEGIN COMMENT; nestedComment = 1; continue;}
<COMMENT>"/*" {adjust(); nestedComment++; continue;}
<COMMENT>. {adjust(); continue;}
<COMMENT>"*/" {
	adjust();
	nestedComment--;

	if (nestedComment < 0) {
		EM_error(EM_tokPos, "incorrect comment");
	}

	if (nestedComment == 0) {
		BEGIN INITIAL;
	}

	continue;
}

<INITIAL>([a-zA-Z_]+[_a-zA-Z0-9]*)	 {adjust(); yylval.sval = yytext; return ID;}
<INITIAL>([0-9]+)	 {adjust(); yylval.ival = atoi(yytext); return INT;}
<INITIAL>"\""	 {adjust(); BEGIN STR; initializeString(); continue;}
<STR>"\"" 	{
	adjust();
	BEGIN INITIAL;
    yylval.sval = strdup(globalString); 
	return STRING;
}
<STR>. {
	adjust();
	char *yptr = yytext;
	while (*yptr) {
		appendString(*yptr++);
	}
	continue;
}


<INITIAL><<EOF>> {
	if (nestedComment != 0) {
		EM_error(EM_tokPos, "incorrect comment");
	}

	yywrap();
}

.	 {adjust(); EM_error(EM_tokPos,"illegal token: %s", yytext);}

