.setcpu "6502"

.segment "CODE"
start:
  SEI           ; disable interrupts
  CLD           ; disable BCD decimal math mode
  LDX #$FF      ; load x register with #$FF
  TXS           ; transfer x register to S(tack) register

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Zero Page region ($00 to $FF)
; Meaning the entire TIA register space and also RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  LDA #0        ; A = 0
  LDX #$FF      ; X = #$FF

memloop:
  STA $0,X      ; store zero at address $0 + x
  DEX           ; x--
  BNE memloop   ; loop until X == 0 (z-flag set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; File ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.org $FFFC
.segment "VECTORS"
.addr start   ; reset vector at $FFFC (where program starts)
.addr start   ; interrupt vector at $FFFE (unused in Atari VCS)