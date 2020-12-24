; Copyright (c) 2020 Malik Enes Şafak
;
; Permission is hereby granted, free of charge, to any person obtaining
; a copy of this software and associated documentation files (the
; "Software"), to deal in the Software without restriction, including
; without limitation the rights to use, copy, modify, merge, publish,
; distribute, sublicense, and/or sell copies of the Software, and to
; permit persons to whom the Software is furnished to do so, subject to
; the following conditions:
;
; The above copyright notice and this permission notice shall be
; included in all copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KVAL,
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#bits 8

#ruledef
{
    ADC #{VAL}                      => 0x69 @ VAL`8
    ADC {VAL}                      => 
    {
        assert(VAL <= 0xFF)
        0x65 @ VAL`8
    }
    ADC {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x75 @ VAL`8
    }
    ADC {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x6D @ VAL[7:0] @ VAL[15:8]
    }
    ADC {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x7D @ VAL[7:0] @ VAL[15:8]
    }
    ADC {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0x79 @ VAL[7:0] @ VAL[15:8]
    }
    ADC ({VAL}, X)                  => 0x61 @ VAL`8
    ADC ({VAL}), Y                  => 0x71 @ VAL`8

    AND #{VAL}                      => 0x29 @ VAL`8
    AND {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x25 @ VAL`8
    }
    AND {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x35 @ VAL`8
    }
    AND {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x2D @ VAL[7:0] @ VAL[15:8]
    }
    AND {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x3D @ VAL[7:0] @ VAL[15:8]
    }
    AND {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0x39 @ VAL[7:0] @ VAL[15:8]
    }
    AND ({VAL}, X)                  => 0x21 @ VAL`8
    AND ({VAL}), Y                  => 0x31 @ VAL`8

    ASL                             => 0x0A
    ASL {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x06 @ VAL`8
    }
    ASL {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x16 @ VAL`8
    }
    ASL {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x0E @ VAL[7:0] @ VAL[15:8]
    }
    ASL {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x1E @ VAL[7:0] @ VAL[15:8]
    }
    
    BCC {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0x90 @ reladdr`8
	}
    BCS {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0xB0 @ reladdr`8
	}
    BEQ {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0xF0 @ reladdr`8
	}
    BMI {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0x30 @ reladdr`8
	}
    BNE {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0xD0 @ reladdr`8
	}
    BPL {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0x10 @ reladdr`8
	}
    BVC {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0x50 @ reladdr`8
	}
    BVS {VAL}                       =>
    {
		reladdr = VAL - pc - 2
		assert(reladdr <=  0x7f)
		assert(reladdr >= !0x7f)
		0x70 @ reladdr`8
	}

    BIT {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x24 @ VAL`8
    }
    BIT {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x2C @ VAL[7:0] @ VAL[15:8]
    }

    BRK                             => 0x00

    CLC                             => 0x18
    CLD                             => 0xD8
    CLI                             => 0x58
    CLV                             => 0xB8
    
    CMP #{VAL}                      => 0xC9 @ VAL`8
    CMP {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xC5 @ VAL`8
    }
    CMP {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0xD5 @ VAL`8
    }
    CMP {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xCD @ VAL[7:0] @ VAL[15:8]
    }
    CMP {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0xDD @ VAL[7:0] @ VAL[15:8]
    }
    CMP {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0xD9 @ VAL[7:0] @ VAL[15:8]
    }
    CMP ({VAL}, X)                  => 0xC1 @ VAL`8
    CMP ({VAL}), Y                  => 0xD1 @ VAL`8

    CPX #{VAL}                      => 0xE0 @ VAL`8
    CPX {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xE4 @ VAL`8
    }
    CPX {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xEC @ VAL[7:0] @ VAL[15:8]
    }

    CPX #{VAL}                      => 0xC0 @ VAL`8
    CPX {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xC4 @ VAL`8
    }
    CPX {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xCC @ VAL[7:0] @ VAL[15:8]
    }

    DEC {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xC6 @ VAL`8
    }
    DEC {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0xD6 @ VAL`8
    }
    DEC {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xCE @ VAL[7:0] @ VAL[15:8]
    }
    DEC {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0xDE @ VAL[7:0] @ VAL[15:8]
    }

    DEX                             => 0xCA
    DEY                             => 0x88

    EOR #{VAL}                      => 0x49 @ VAL`8
    EOR {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x45 @ VAL`8
    }
    EOR {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x55 @ VAL`8
    }
    EOR {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x4D @ VAL[7:0] @ VAL[15:8]
    }
    EOR {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x5D @ VAL[7:0] @ VAL[15:8]
    }
    EOR {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0x59 @ VAL[7:0] @ VAL[15:8]
    }
    EOR ({VAL}, X)                  => 0x41 @ VAL`8
    EOR ({VAL}), Y                  => 0x51 @ VAL`8

    INC {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xE6 @ VAL`8
    }
    INC {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0xF6 @ VAL`8
    }
    INC {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xEE @ VAL[7:0] @ VAL[15:8]
    }
    INC {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0xFE @ VAL[7:0] @ VAL[15:8]
    }

    INX                             => 0xE8
    INY                             => 0xC8

    JMP {VAL}                       => 0x4C @ VAL[7:0] @ VAL[15:8]
    INC ({VAL})                     => 0x6C @ VAL[7:0] @ VAL[15:8]
    JSR {VAL}                       => 0x20 @ VAL[7:0] @ VAL[15:8]

    LDA #{VAL}                      => 0xA9 @ VAL`8
    LDA {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xA5 @ VAL`8
    }
    LDA {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0xB5 @ VAL`8
    }
    LDA {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xAD @ VAL[7:0] @ VAL[15:8]
    }
    LDA {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0xBD @ VAL[7:0] @ VAL[15:8]
    }
    LDA {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0xB9 @ VAL[7:0] @ VAL[15:8]
    }
    LDA ({VAL}, X)                  => 0xA1 @ VAL`8
    LDA ({VAL}), Y                  => 0xB1 @ VAL`8

    LDX #{VAL}                      => 0xA2 @ VAL`8
    LDX {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xA6 @ VAL`8
    }
    LDX {VAL}, Y                     => 
    {
        assert(VAL <= 0xFF)
        0xB6 @ VAL`8
    }
    LDX {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xAE @ VAL[7:0] @ VAL[15:8]
    }
    LDX {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0xBE @ VAL[7:0] @ VAL[15:8]
    }

    LDY #{VAL}                      => 0xA0 @ VAL`8
    LDY {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xA4 @ VAL`8
    }
    LDY {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0xB4 @ VAL`8
    }
    LDY {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xAC @ VAL[7:0] @ VAL[15:8]
    }
    LDY {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0xBC @ VAL[7:0] @ VAL[15:8]
    }

    LSR #{VAL}                      => 0x4A @ VAL`8
    LSR {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x46 @ VAL`8
    }
    LSR {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x46 @ VAL`8
    }
    LSR {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x4E @ VAL[7:0] @ VAL[15:8]
    }
    LSR {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x5E @ VAL[7:0] @ VAL[15:8]
    }

    NOP                             => 0xEA

    ORA #{VAL}                      => 0x09 @ VAL`8
    ORA {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x05 @ VAL`8
    }
    ORA {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x15 @ VAL`8
    }
    ORA {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x0D @ VAL[7:0] @ VAL[15:8]
    }
    ORA {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x1D @ VAL[7:0] @ VAL[15:8]
    }
    ORA {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0x19 @ VAL[7:0] @ VAL[15:8]
    }
    ORA ({VAL}, X)                  => 0x01 @ VAL`8
    ORA ({VAL}), Y                  => 0x11 @ VAL`8

    PHA                             => 0x48
    PHP                             => 0x08
    PLA                             => 0x68
    PLP                             => 0x28

    ROL #{VAL}                      => 0x2A @ VAL`8
    ROL {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x26 @ VAL`8
    }
    ROL {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x36 @ VAL`8
    }
    ROL {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x2E @ VAL[7:0] @ VAL[15:8]
    }
    ROL {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x3E @ VAL[7:0] @ VAL[15:8]
    }

    ROR #{VAL}                      => 0x6A @ VAL`8
    ROR {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x66 @ VAL`8
    }
    ROR {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x76 @ VAL`8
    }
    ROR {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x6E @ VAL[7:0] @ VAL[15:8]
    }
    ROR {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x7E @ VAL[7:0] @ VAL[15:8]
    }

    RTI                             => 0x40
    RTS                             => 0x60

    SBC #{VAL}                      => 0xE9 @ VAL`8
    SBC {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0xE5 @ VAL`8
    }
    SBC {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0xF5 @ VAL`8
    }
    SBC {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0xED @ VAL[7:0] @ VAL[15:8]
    }
    SBC {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0xFD @ VAL[7:0] @ VAL[15:8]
    }
    SBC {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0xF9 @ VAL[7:0] @ VAL[15:8]
    }
    SBC ({VAL}, X)                  => 0xE1 @ VAL`8
    SBC ({VAL}), Y                  => 0xF1 @ VAL`8

    SEC                             => 0x38
    SED                             => 0xF8
    SEI                             => 0x78

    STA {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x85 @ VAL`8
    }
    STA {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x95 @ VAL`8
    }
    STA {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x8D @ VAL[7:0] @ VAL[15:8]
    }
    STA {VAL}, X                    => 
    {
        assert(VAL > 0xFF)
        0x9D @ VAL[7:0] @ VAL[15:8]
    }
    STA {VAL}, Y                    => 
    {
        assert(VAL > 0xFF)
        0x99 @ VAL[7:0] @ VAL[15:8]
    }
    STA ({VAL}, X)                  => 0x81 @ VAL`8
    STA ({VAL}), Y                  => 0x91 @ VAL`8

    STX {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x86 @ VAL`8
    }
    STX {VAL}, Y                     => 
    {
        assert(VAL <= 0xFF)
        0x96 @ VAL`8
    }
    STX {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x8E @ VAL[7:0] @ VAL[15:8]
    }

    STY {VAL}                        => 
    {
        assert(VAL <= 0xFF)
        0x84 @ VAL`8
    }
    STY {VAL}, X                     => 
    {
        assert(VAL <= 0xFF)
        0x94 @ VAL`8
    }
    STY {VAL}                       => 
    {
        assert(VAL > 0xFF)
        0x8C @ VAL[7:0] @ VAL[15:8]
    }

    TAX                             => 0xAA
    TAY                             => 0xA8
    TSX                             => 0xBA
    TXA                             => 0x8A
    TXS                             => 0x9A
    TYA                             => 0x98
}

;Write your code below here

MAIN:
    
LOOP:

END:
    BRK