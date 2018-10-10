#include "Types.h"

// 함수 선언
void kPrintString( int iX, int iY, const char* pcString );

// 아래 함수는 C 언어 커널의 시작 부분
void Main( void )
{
    kPrintString( 0, 11, "Switch To IA-32e Mode Success~!!" );
    kPrintString( 0, 12, "IA-32e C Language Kernel Start..............[Pass]" );
}

// 문자열 출력 함수
void kPrintString( int iX, int iY, const char* pcString )
{
    CHARACTER* pstScreen = ( CHARACTER* ) 0xB8000;
    int i;

    pstScreen += ( iY * 80  ) + iX;
    for( i = 0 ; pcString[ i ] != 0 ; i++ )
    {
        pstScreen[ i ].bCharacter = pcString[ i ];
    }
}


