

REALNUMBER	[-]?[0-9]+[.]?[0-9]*
INTEGER_NUMBER [0-9]+
VARIABLE [a-zA-Z_][a-zA-Z_0-9]*
CHARACTER .
BINARY_OPERATOR "+"|"-"|"*"|"/"|"%"
UNARY_OPERATOR "++"|"--"
LOGICAL_OPERATOR "<"|">"|"<="|">="|"=="|"!="
RET_TYPE "num"|"NULL"|"character"|"Dotnum"


%%
"#involve<".*".h>"  {printf("header file included");}

"num" {printf("integer type data");}
"character" {printf("character type daata");}
"big" {printf("long type data");}
">" {printf("<");}
"<" {printf("<");}
"<-" {printf("assignment operator");}
"NULL" {printf("void return type");}
"ret" {printf("return from function");}
"Dotnum" {printf("float number");}
"longDotnum" {printf("double number");}
"print" {printf("showing output");}
"input" {printf("taking user input");}
"AND" {printf("logical and (&&) operation");}
"OR" {printf("logical or (||) or operation");}
"!end" {printf("continue the loop");}
"end" {printf("break the loop");}
"!var" {printf("static variable");}
"+" {printf("'+' operator");}
"-" {printf("'-' minus operator");}
"is=" {printf("equal operator");}
"not=" {printf("not equal operator");}
"size" {printf("size of array");}
"--".*[\n]*"--" {printf("multi line comment");}
"--".* {printf("one line comment ");}
"fi" {printf("conditional if ");}
"elfi" {printf("conditional else if");}
"else" {printf("conditional else ");}
"*" {printf("multiple operator ");}
"/" {printf("divide operator");}
"not" {printf("logical not operator");}
"goto" {printf("conditonal  switch case");}
"is<" {printf("conditonal less than equal");}
"is>" {printf("conditional greater than equal");}
"origin" {printf("main function");}
"inc_1" {printf("incriment one");}
"dec_1" {printf("decrement one");}

"for:".*"{".*[\n]*"}" {
    printf("for loop");
}

%%






int yywrap()
{
    return 1;
}

int main()
{
    yyin = freopen("input.txt","r",stdin);
	yyout = freopen("output.txt","w",stdout);
    yylex();
}