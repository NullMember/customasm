#subruledef opcode
{
    A => 0x1
    B => 0x2
    C => 0x3
}

#subruledef condition
{
    X => 0xa
    Y => 0xb
    Z => 0xc
}

#subruledef instruction
{
    {opc: opcode}                  => opc @ 0xa
    {opc: opcode}-{cnd: condition} => opc @ cnd
}

#ruledef
{
    {ins: instruction} {val: u8} => ins @ val
}

A   0x33 ; = 0x1a33
B   0x33 ; = 0x2a33
C   0x33 ; = 0x3a33
A-X 0x33 ; = 0x1a33
A-Y 0x33 ; = 0x1b33
A-Z 0x33 ; = 0x1c33
B-X 0x33 ; = 0x2a33
B-Y 0x33 ; = 0x2b33
B-Z 0x33 ; = 0x2c33
C-X 0x33 ; = 0x3a33
C-Y 0x33 ; = 0x3b33
C-Z 0x33 ; = 0x3c33