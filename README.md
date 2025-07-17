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
| Register | Name   |  Register | Name   | Register | Name   |
|----------|--------|----------|--------|-----------|--------|
| $0       | $zero  |  $8       | $t0    | $17      | $s1    | 
| $1       | $at    | $9       | $t1    |$18      | $s2    |
| $2       | $v0    | $10      | $t2    | $19      | $s3    |
| $3       | $v1    |  $11      | $t3    | $20      | $s4    |
| $4       | $a0    | $12      | $t4    |$21      | $s5    |
| $5       | $a1    | $13      | $t5    |$22      | $s6    | 
| $6       | $a2    |  $14      | $t6    | $23      | $s7    |
| $7       | $a3    |  $15      | $t7    |$24      | $t8    |

Temporary                |
|  Temporary                |
|  Temporary                |
| Temporary                |
|  Temporary                |
|  Temporary                |
| Temporary                |
| Temporary                |
| $16      | $s0    | Saved temporary          |


| Saved temporary          |
|  Saved temporary          |
| Saved temporary          |
| Saved temporary          |
|  Saved temporary          |
| Saved temporary          |
| Saved temporary          |
|  Temporary                |
| $25      | $t9    | Temporary                |
| $26      | $k0    | Reserved for OS kernel   |
| $27      | $k1    | Reserved for OS kernel   |
| $28      | $gp    | Global pointer           |
| $29      | $sp    | Stack pointer            |
| $30      | $fp    | 
| $31      | $ra    | 
