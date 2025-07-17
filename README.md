# Single Cycle MIPS Processor following Patterson and Hennessy's architecture

## Design
<img width="979" height="607" alt="image" src="https://github.com/user-attachments/assets/87786616-d67d-4c25-bd24-7116751f7331" />

## Supported Instructions
| Instruction | Example |
|----------|----------|
| add    |     |
| and    |     |
| or     |     |
| nor    |      |
| sub    |    |  
| slt    |    |
| addi   |      |
| lw     |    |
| sw     |      |
| lui    |      |
| beq    |      |
## Registers 
| Register | Name   | 
|----------|--------|
| $0       | $zero  | Constant value 0         |
| $1       | $at    | Assembler temporary      |
| $2       | $v0    | Function return value    |
| $3       | $v1    | Function return value    |
| $4       | $a0    | Argument 1               |
| $5       | $a1    | Argument 2               |
| $6       | $a2    | Argument 3               |
| $7       | $a3    | Argument 4               |
| $8       | $t0    | Temporary                |
| $9       | $t1    | Temporary                |
| $10      | $t2    | Temporary                |
| $11      | $t3    | Temporary                |
| $12      | $t4    | Temporary                |
| $13      | $t5    | Temporary                |
| $14      | $t6    | Temporary                |
| $15      | $t7    | Temporary                |
| $16      | $s0    | Saved temporary          |
| $17      | $s1    | Saved temporary          |
| $18      | $s2    | Saved temporary          |
| $19      | $s3    | Saved temporary          |
| $20      | $s4    | Saved temporary          |
| $21      | $s5    | Saved temporary          |
| $22      | $s6    | Saved temporary          |
| $23      | $s7    | Saved temporary          |
| $24      | $t8    | Temporary                |
| $25      | $t9    | Temporary                |
| $26      | $k0    | Reserved for OS kernel   |
| $27      | $k1    | Reserved for OS kernel   |
| $28      | $gp    | Global pointer           |
| $29      | $sp    | Stack pointer            |
| $30      | $fp    | 
| $31      | $ra    | 
