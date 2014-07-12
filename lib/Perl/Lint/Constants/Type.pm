package Perl::Lint::Constants::Type;
use strict;
use warnings;
use Compiler::Lexer::Constants;
use parent qw/Exporter/;

our @EXPORT = qw(
    VAR_DECL OUR_DECL LOCAL_DECL FUNCTION_DECL FORMAT_DECL
    USE_DECL REQUIRE_DECL
    USED_NAME REQUIRED_NAME
    CALL FUNCTION
    VAR CODE_VAR ARRAY_VAR HASH_VAR
    GLOBAL_VAR GLOBAL_ARRAY_VAR GLOBAL_HASH_VAR
    LOCAL_VAR LOCAL_ARRAY_VAR LOCAL_HASH_VAR
    SEMI_COLON COMMA ARROW COLON
    ASSIGN
    DOUBLE
    DEFAULT
    RIGHT_BRACE LEFT_BRACE
    RIGHT_PAREN LEFT_PAREN
    RIGHT_BRACKET LEFT_BRACKET
    KEY METHOD
    STRING RAW_STRING EXEC_STRING VERSION_STRING
    INT
    HERE_DOCUMENT RAW_HERE_DOCUMENT HERE_DOCUMENT_END HERE_DOCUMENT_TAG HERE_DOCUMENT_RAW_TAG
    REG_QUOTE REG_DOUBLE_QUOTE
    REG_DELIM REG_OPT
    REG_EXP REG_EXEC REG_LIST REG_ALL_REPLACE
    IF_STATEMENT ELSE_STATEMENT ELSIF_STATEMENT UNLESS_STATEMENT FOR_STATEMENT FOREACH_STATEMENT WHILE_STATEMENT UNTIL_STATEMENT
    CONTINUE
    BUILTIN_FUNC GOTO RETURN
    PACKAGE CLASS NAMESPACE NAMESPACE_RESOLVER
    AND OR ALPHABET_AND ALPHABET_OR ALPHABET_XOR BIT_AND OR_EQUAL AND_EQUAL EQUAL_EQUAL
    SHORT_SCALAR_DEREFERENCE SHORT_ARRAY_DEREFERENCE SHORT_HASH_DEREFERENCE SHORT_CODE_DEREFERENCE
    THREE_TERM_OP
    DO
    RIGHT_SHIFT LEFT_SHIFT
    GLOB REF PROTOTYPE
    MOD_WORD
    TYPE_STDIN
    HANDLE HANDLE_DELIM DIAMOND
    LESS GREATER COMPARE STRING_COMPARE
    MUL STRING_ADD
    SPECIFIC_VALUE
    DEFAULT
);

use constant {
    VAR_DECL      => Compiler::Lexer::TokenType::T_VarDecl,
    OUR_DECL      => Compiler::Lexer::TokenType::T_OurDecl,
    LOCAL_DECL    => Compiler::Lexer::TokenType::T_LocalDecl,
    FUNCTION_DECL => Compiler::Lexer::TokenType::T_FunctionDecl,
    FORMAT_DECL   => Compiler::Lexer::TokenType::T_FormatDecl,

    USE_DECL     => Compiler::Lexer::TokenType::T_UseDecl,
    REQUIRE_DECL => Compiler::Lexer::TokenType::T_RequireDecl,

    USED_NAME     => Compiler::Lexer::TokenType::T_UsedName,
    REQUIRED_NAME => Compiler::Lexer::TokenType::T_RequiredName,

    CALL     => Compiler::Lexer::TokenType::T_Call,
    FUNCTION => Compiler::Lexer::TokenType::T_Function,

    VAR       => Compiler::Lexer::TokenType::T_Var,
    CODE_VAR  => Compiler::Lexer::TokenType::T_CodeVar,
    ARRAY_VAR => Compiler::Lexer::TokenType::T_ArrayVar,
    HASH_VAR  => Compiler::Lexer::TokenType::T_HashVar,

    GLOBAL_VAR       => Compiler::Lexer::TokenType::T_GlobalVar,
    GLOBAL_ARRAY_VAR => Compiler::Lexer::TokenType::T_GlobalArrayVar,
    GLOBAL_HASH_VAR  => Compiler::Lexer::TokenType::T_GlobalHashVar,

    LOCAL_VAR       => Compiler::Lexer::TokenType::T_LocalVar,
    LOCAL_ARRAY_VAR => Compiler::Lexer::TokenType::T_LocalArrayVar,
    LOCAL_HASH_VAR  => Compiler::Lexer::TokenType::T_LocalHashVar,

    IF_STATEMENT      => Compiler::Lexer::TokenType::T_IfStmt,
    ELSE_STATEMENT    => Compiler::Lexer::TokenType::T_ElseStmt,
    ELSIF_STATEMENT   => Compiler::Lexer::TokenType::T_ElsifStmt,
    UNLESS_STATEMENT  => Compiler::Lexer::TokenType::T_UnlessStmt,
    WHILE_STATEMENT   => Compiler::Lexer::TokenType::T_WhileStmt,
    FOR_STATEMENT     => Compiler::Lexer::TokenType::T_ForStmt,
    FOREACH_STATEMENT => Compiler::Lexer::TokenType::T_ForeachStmt,
    UNTIL_STATEMENT   => Compiler::Lexer::TokenType::T_UntilStmt,

    CONTINUE => Compiler::Lexer::TokenType::T_Continue,

    BUILTIN_FUNC => Compiler::Lexer::TokenType::T_BuiltinFunc,
    GOTO         => Compiler::Lexer::TokenType::T_Goto,
    RETURN       => Compiler::Lexer::TokenType::T_Return,

    RIGHT_BRACE => Compiler::Lexer::TokenType::T_RightBrace,
    LEFT_BRACE  => Compiler::Lexer::TokenType::T_LeftBrace,
    RIGHT_PAREN => Compiler::Lexer::TokenType::T_RightParenthesis,
    LEFT_PAREN  => Compiler::Lexer::TokenType::T_LeftParenthesis,
    RIGHT_BRACKET => Compiler::Lexer::TokenType::T_RightBracket,
    LEFT_BRACKET  => Compiler::Lexer::TokenType::T_LeftBracket,

    METHOD         => Compiler::Lexer::TokenType::T_Method,
    KEY            => Compiler::Lexer::TokenType::T_Key,
    STRING         => Compiler::Lexer::TokenType::T_String,
    RAW_STRING     => Compiler::Lexer::TokenType::T_RawString,
    EXEC_STRING    => Compiler::Lexer::TokenType::T_ExecString,
    VERSION_STRING => Compiler::Lexer::TokenType::T_VersionString,

    INT => Compiler::Lexer::TokenType::T_Int,

    HERE_DOCUMENT         => Compiler::Lexer::TokenType::T_HereDocument,
    RAW_HERE_DOCUMENT     => Compiler::Lexer::TokenType::T_RawHereDocument,
    HERE_DOCUMENT_TAG     => Compiler::Lexer::TokenType::T_HereDocumentTag,
    HERE_DOCUMENT_RAW_TAG => Compiler::Lexer::TokenType::T_HereDocumentRawTag,
    HERE_DOCUMENT_END     => Compiler::Lexer::TokenType::T_HereDocumentEnd,

    REG_QUOTE        => Compiler::Lexer::TokenType::T_RegQuote,
    REG_DOUBLE_QUOTE => Compiler::Lexer::TokenType::T_RegDoubleQuote,

    REG_DELIM => Compiler::Lexer::TokenType::T_RegDelim,
    REG_OPT   => Compiler::Lexer::TokenType::T_RegOpt,

    REG_EXP  => Compiler::Lexer::TokenType::T_RegExp,
    REG_EXEC => Compiler::Lexer::TokenType::T_RegExec,
    REG_LIST => Compiler::Lexer::TokenType::T_RegList,
    REG_ALL_REPLACE => Compiler::Lexer::TokenType::T_RegAllReplace,

    THREE_TERM_OP => Compiler::Lexer::TokenType::T_ThreeTermOperator,

    COMMA      => Compiler::Lexer::TokenType::T_Comma,
    SEMI_COLON => Compiler::Lexer::TokenType::T_SemiColon,
    COLON      => Compiler::Lexer::TokenType::T_Colon,
    ARROW      => Compiler::Lexer::TokenType::T_Arrow,
    ASSIGN     => Compiler::Lexer::TokenType::T_Assign,

    DOUBLE => Compiler::Lexer::TokenType::T_Double,

    DEFAULT => Compiler::Lexer::TokenType::T_Default,

    AND => Compiler::Lexer::TokenType::T_And,
    OR  => Compiler::Lexer::TokenType::T_Or,
    ALPHABET_AND => Compiler::Lexer::TokenType::T_AlphabetAnd,
    ALPHABET_OR  => Compiler::Lexer::TokenType::T_AlphabetOr,
    ALPHABET_XOR => Compiler::Lexer::TokenType::T_AlphabetXOr,
    BIT_AND => Compiler::Lexer::TokenType::T_BitAnd,
    OR_EQUAL => Compiler::Lexer::TokenType::T_OrEqual,
    AND_EQUAL => Compiler::Lexer::TokenType::T_AndEqual,
    EQUAL_EQUAL => Compiler::Lexer::TokenType::T_EqualEqual,

    SHORT_SCALAR_DEREFERENCE => Compiler::Lexer::TokenType::T_ShortScalarDereference,
    SHORT_ARRAY_DEREFERENCE  => Compiler::Lexer::TokenType::T_ShortArrayDereference,
    SHORT_HASH_DEREFERENCE   => Compiler::Lexer::TokenType::T_ShortHashDereference,
    SHORT_CODE_DEREFERENCE   => Compiler::Lexer::TokenType::T_ShortCodeDereference,

    PACKAGE   => Compiler::Lexer::TokenType::T_Package,
    CLASS     => Compiler::Lexer::TokenType::T_Class,
    NAMESPACE => Compiler::Lexer::TokenType::T_Namespace,
    NAMESPACE_RESOLVER => Compiler::Lexer::TokenType::T_NamespaceResolver,

    GLOB => Compiler::Lexer::TokenType::T_Glob,
    REF  => Compiler::Lexer::TokenType::T_Ref,
    PROTOTYPE => Compiler::Lexer::TokenType::T_Prototype,

    DO => Compiler::Lexer::TokenType::T_Do,

    RIGHT_SHIFT => Compiler::Lexer::TokenType::T_RightShift,
    LEFT_SHIFT => Compiler::Lexer::TokenType::T_LeftShift,

    MOD_WORD => Compiler::Lexer::TokenType::T_ModWord,

    TYPE_STDIN => Compiler::Lexer::TokenType::T_STDIN, # STDIN is reserved by main::

    HANDLE => Compiler::Lexer::TokenType::T_Handle,
    HANDLE_DELIM => Compiler::Lexer::TokenType::T_HandleDelim,
    DIAMOND => Compiler::Lexer::TokenType::T_Diamond,

    LESS => Compiler::Lexer::TokenType::T_Less,
    GREATER => Compiler::Lexer::TokenType::T_Greater,
    COMPARE => Compiler::Lexer::TokenType::T_Compare,
    STRING_COMPARE => Compiler::Lexer::TokenType::T_StringCompare,

    MUL => Compiler::Lexer::TokenType::T_Mul,
    STRING_ADD => Compiler::Lexer::TokenType::T_StringAdd,

    SPECIFIC_VALUE => Compiler::Lexer::TokenType::T_SpecificValue,

    DEFAULT => Compiler::Lexer::TokenType::T_Default,
};

1;

