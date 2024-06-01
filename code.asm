    ORG 100H      ; Start at address 100H

N   EQU 30        ; Define constant N
X   DS 50         ; Reserve space for array X (50 bytes)
Y   DS 50         ; Reserve space for array Y (50 bytes)
Z   DS 50         ; Reserve space for array Z (50 bytes)

    LXI H, X      ; Load the address of array X in HL register pair
    LXI D, Y      ; Load the address of array Y in DE register pair
    LXI B, Z      ; Load the address of array Z in BC register pair
    MVI C, N      ; Load the loop counter N in C register

START_LOOP:
    MVI A, 10     ; Load the value 10 in accumulator
    STAX B        ; Store the value 10 in the Z array
    INX B         ; Increment BC register pair to point to the next element

    LDAX D        ; Load the value of the current element of Y in accumulator
    MOV E, A      ; Move the value from accumulator to E register
    MVI A, 4      ; Load the value 4 in accumulator
    MOV D, A      ; Move the value from accumulator to D register

    CALL MULTIPLY ; Call the multiplication subroutine

    MOV A, L      ; Move the low byte of result to accumulator
    STAX H        ; Store the result in the X array
    INX H         ; Increment HL register pair to point to the next element

    DCR C         ; Decrement loop counter
    JNZ START_LOOP; If not zero, repeat the loop

    HLT           ; Halt the program

; Subroutine to multiply DE by 4
MULTIPLY:
    MOV A, E      ; Move the value of E register to accumulator
    ADD A, A      ; Double the value
    ADD A, A      ; Double the value again
    MOV L, A      ; Move the result to L register
    MOV H, 0      ; Clear the H register
    RET           ; Return from subroutine
