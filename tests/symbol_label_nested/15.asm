#ruledef test
{
    ld {x} => 0x55 @ x`8
}


global1:
.local1:
..local2 ; error: expected
    ld global1.local1