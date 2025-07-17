# Initialize instruction/data/registers memory with zeros
zeros32 = "0" * 32 + "\n"
with open("instruction.mem", 'wb') as instruction_file:
    instruction_file.write(bytes(zeros32 * 256, 'utf-8'))
with open("registers.mem", 'wb') as instruction_file:
    instruction_file.write(bytes(zeros32 * 256, 'utf-8'))
with open("data.mem", 'wb') as instruction_file:
    instruction_file.write(bytes(zeros32 * 256, 'utf-8'))

opcodes = {
    "add": 0,
    "sub": 0,
    "and": 0,
    "or": 0,
    "slt": 0,
    "nor": 0,
    "sll": 0,
    "srl": 0,
    "sra": 0,
    "lw": 35,
    "sw": 43,
    "beq": 4,
    "lui": 15,
    "addi": 8
}

functs = {
    "add": 32,
    "sub": 34,
    "and": 36,
    "or": 37,
    "slt": 42,
    "nor": 39,
    "sll": 0,
    "srl": 2,
    "sra": 3
}


def reg_to_5bit(reg):
    """Convert register name to 5-bit binary string"""
    return "{:05b}".format(int(reg[1:]))

def int_to_16bit(value):
    """Convert integer to 16-bit binary string (2's complement for negatives)"""
    value = int(value)
    if value >= 0:
        return "{:016b}".format(value)
    else:
        return "{:016b}".format((1 << 16) + value)

def int_to_5bit(value):
    """Convert integer to 5-bit binary string"""
    return "{:05b}".format(int(value))

def int_to_6bit(value):
    """Convert integer to 6-bit binary string"""
    return "{:06b}".format(int(value))

with open("test.asm") as asm:
    instructions = asm.readlines()

with open("instruction.mem", 'r+b') as instruction_file:
    for line_num, line in enumerate(instructions):
        line = line.strip()
        
        # Skips empty lines and comments
        if not line or line.startswith("#"):
            continue
        
        # Parse instructions
        line = line.replace(',', ' ').replace('(', ' ').replace(')', ' ')
        parts = [p.lower() for p in line.split()]
        op = parts[0]
        
        opcode_bin = int_to_6bit(opcodes[op])
        
        if op in ["add", "sub", "and", "or", "slt", "nor"]:
            # R-type: op rs rt rd shamt funct
            rs = reg_to_5bit(parts[2])
            rt = reg_to_5bit(parts[3])
            rd = reg_to_5bit(parts[1])
            shamt = "00000"
            funct_bin = int_to_6bit(functs[op])
            machine_code = opcode_bin + rs + rt + rd + shamt + funct_bin
            
        elif op in ["sll", "srl", "sra"]:
            # Shift instructions: op rs rt rd shamt funct
            rt = reg_to_5bit(parts[2])
            rd = reg_to_5bit(parts[1])
            shamt = int_to_5bit(parts[3])
            funct_bin = int_to_6bit(functs[op])
            machine_code = opcode_bin + "00000" + rt + rd + shamt + funct_bin
            
        elif op in ["lw", "sw"]:
            # lw/sw rt, offset(rs)
            rt = reg_to_5bit(parts[1])
            rs = reg_to_5bit(parts[3])
            offset = int_to_16bit(parts[2])
            machine_code = opcode_bin + rs + rt + offset
            
        elif op == "beq":
            # beq rs, rt, offset
            rs = reg_to_5bit(parts[1])
            rt = reg_to_5bit(parts[2])
            offset = int_to_16bit(parts[3])
            machine_code = opcode_bin + rs + rt + offset
            
        elif op == "lui":
            # lui rt, immediate
            rt = reg_to_5bit(parts[1])
            immediate = int_to_16bit(parts[2])
            machine_code = opcode_bin + "00000" + rt + immediate
            
        elif op == "addi":
            # addi rt, rs, immediate
            rt = reg_to_5bit(parts[1])
            rs = reg_to_5bit(parts[2])
            immediate = int_to_16bit(parts[3])
            machine_code = opcode_bin + rs + rt + immediate
            
        else:
            raise ValueError(f"Unknown instruction: {op} at line {line_num + 1}")
        
        # Write the machine code to the instruction file
        instruction_file.write(bytes(machine_code + "\n", 'utf-8'))
