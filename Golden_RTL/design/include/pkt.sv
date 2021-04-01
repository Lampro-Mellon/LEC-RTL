typedef struct packed {
                       logic  trace_rv_i_valid_ip;
                       logic [31:0] trace_rv_i_insn_ip;
                       logic [31:0] trace_rv_i_address_ip;
                       logic  trace_rv_i_exception_ip;
                       logic [4:0] trace_rv_i_ecause_ip;
                       logic  trace_rv_i_interrupt_ip;
                       logic [31:0] trace_rv_i_tval_ip;
                       } el2_trace_pkt_t;

typedef enum logic [3:0] {
                          NULL     = 4'b0000,
                          MUL      = 4'b0001,
                          LOAD     = 4'b0010,
                          STORE    = 4'b0011,
                          ALU      = 4'b0100,
                          CSRREAD  = 4'b0101,
                          CSRWRITE = 4'b0110,
                          CSRRW    = 4'b0111,
                          EBREAK   = 4'b1000,
                          ECALL    = 4'b1001,
                          FENCE    = 4'b1010,
                          FENCEI   = 4'b1011,
                          MRET     = 4'b1100,
                          CONDBR   = 4'b1101,
                          JAL      = 4'b1110,
                          BITMANIPU = 4'b1111
                          } el2_inst_pkt_t;

typedef struct packed {
                       logic valid; //9
                       logic wb;
                       logic [2:0] tag;//7
                       logic [4:0] rd;
                       } el2_load_cam_pkt_t;

typedef struct packed {
                       logic pc0_call;
                       logic pc0_ret;
                       logic pc0_pc4;
                       } el2_rets_pkt_t;
typedef struct packed {
                       logic valid;
                       logic [11:0] toffset;
                       logic [1:0] hist;
                       logic br_error;
                       logic br_start_error;
                       logic  bank;
                       logic [31:1] prett;  // predicted ret target
                       logic way;
                       logic ret;
                       } el2_br_pkt_t;

typedef struct packed {
                       logic valid;
                       logic [1:0] hist;
                       logic br_error;
                       logic br_start_error;
                       logic way;
                       logic middle;
                       } el2_br_tlu_pkt_t;

typedef struct packed {
                       logic misp; //55
                       logic ataken;
                       logic boffset;
                       logic pc4;
                       logic [1:0] hist; //51
                       logic [11:0] toffset; //49
                       logic valid; //37
                       logic br_error;
                       logic br_start_error; //35
                       logic pcall;
                       logic pja;
                       logic way;
                       logic pret;
                       // for power use the pret bit to clock the prett field
                       logic [31:1] prett;
                       } el2_predict_pkt_t;

typedef struct packed {
                       // unlikely to change
                       logic icaf; //16
                       logic icaf_second;
                       logic [1:0] icaf_type; //14
                       logic fence_i;
                       logic [3:0] i0trigger; //11
                       logic pmu_i0_br_unpred;   //7   // pmu
                       logic pmu_divide; //6
                       // likely to change
                       logic legal; //5
                       logic pmu_lsu_misaligned;
                       el2_inst_pkt_t pmu_i0_itype;  //3      // pmu - instruction type
                       } el2_trap_pkt_t;

typedef struct packed {
                       // unlikely to change
                       logic i0div; //23
                       logic csrwen;
                       logic csrwonly;
                       logic [11:0] csrwaddr;//20
                       // likely to change
                       logic [4:0] i0rd; //8
                       logic i0load; //3
                       logic i0store;
                       logic i0v;
                       logic i0valid;
                       } el2_dest_pkt_t;

typedef struct packed {
                       logic mul;
                       logic load;
                       logic alu;
                       } el2_class_pkt_t;

typedef struct packed {
                       logic [4:0] rs1;
                       logic [4:0] rs2;
                       logic [4:0] rd;
                       } el2_reg_pkt_t;


typedef struct packed {
                       logic clz;
                       logic ctz;
                       logic pcnt;
                       logic sext_b;
                       logic sext_h;
                       logic slo;
                       logic sro;
                       logic min;
                       logic max;
                       logic pack;
                       logic packu;
                       logic packh;
                       logic rol;
                       logic ror;
                       logic grev;
                       logic gorc;
                       logic zbb;
                       logic sbset;
                       logic sbclr;
                       logic sbinv;
                       logic sbext;
                       logic sh1add;
                       logic sh2add;
                       logic sh3add;
                       logic zba;
                       logic land;
                       logic lor;
                       logic lxor;
                       logic sll;
                       logic srl;
                       logic sra;
                       logic beq;
                       logic bne;
                       logic blt;
                       logic bge;
                       logic add;
                       logic sub;
                       logic slt;
                       logic unsign;
                       logic jal;
                       logic predict_t;
                       logic predict_nt;
                       logic csr_write;
                       logic csr_imm;
                       } el2_alu_pkt_t;

typedef struct packed {
                       logic fast_int;
/* verilator lint_off SYMRSVDWORD */
                       logic stack;
/* verilator lint_on SYMRSVDWORD */
                       logic by;
                       logic half;
                       logic word;
                       logic dword;  // for dma
                       logic load;
                       logic store;
                       logic unsign;
                       logic dma;    // dma pkt
                       logic store_data_bypass_d;
                       logic load_ldst_bypass_d;
                       logic store_data_bypass_m;
                       logic valid;
                       } el2_lsu_pkt_t;

typedef struct packed {
                      logic inst_type;   //0: Load, 1: Store
                      //logic dma_valid;
                      logic exc_type;    //0: MisAligned, 1: Access Fault
                      logic [3:0] mscause;
                      logic [31:0] addr;
                      logic single_ecc_error;
                      logic exc_valid;
                      } el2_lsu_error_pkt_t;

typedef struct packed {
                       logic clz;
                       logic ctz;
                       logic pcnt;
                       logic sext_b;
                       logic sext_h;
                       logic slo;
                       logic sro;
                       logic min;
                       logic max;
                       logic pack;
                       logic packu;
                       logic packh;
                       logic rol;
                       logic ror;
                       logic grev;
                       logic gorc;
                       logic zbb;
                       logic sbset;
                       logic sbclr;
                       logic sbinv;
                       logic sbext;
                       logic zbs;
                       logic bext;
                       logic bdep;
                       logic zbe;
                       logic clmul;
                       logic clmulh;
                       logic clmulr;
                       logic zbc;
                       logic shfl;
                       logic unshfl;
                       logic zbp;
                       logic crc32_b;
                       logic crc32_h;
                       logic crc32_w;
                       logic crc32c_b;
                       logic crc32c_h;
                       logic crc32c_w;
                       logic zbr;
                       logic bfp;
                       logic zbf;
                       logic sh1add;
                       logic sh2add;
                       logic sh3add;
                       logic zba;
                       logic alu;
                       logic rs1;
                       logic rs2;
                       logic imm12;
                       logic rd;
                       logic shimm5;
                       logic imm20;
                       logic pc;
                       logic load;
                       logic store;
                       logic lsu;
                       logic add;
                       logic sub;
                       logic land;
                       logic lor;
                       logic lxor;
                       logic sll;
                       logic sra;
                       logic srl;
                       logic slt;
                       logic unsign;
                       logic condbr;
                       logic beq;
                       logic bne;
                       logic bge;
                       logic blt;
                       logic jal;
                       logic by;
                       logic half;
                       logic word;
                       logic csr_read;
                       logic csr_clr;
                       logic csr_set;
                       logic csr_write;
                       logic csr_imm;
                       logic presync;
                       logic postsync;
                       logic ebreak;
                       logic ecall;
                       logic mret;
                       logic mul;
                       logic rs1_sign;
                       logic rs2_sign;
                       logic low;
                       logic div;
                       logic rem;
                       logic fence;
                       logic fence_i;
                       logic pm_alu;
                       logic legal;
                       } el2_dec_pkt_t;


typedef struct packed {
                       logic valid;
                       logic rs1_sign;
                       logic rs2_sign;
                       logic low;
                       logic bext;
                       logic bdep;
                       logic clmul;
                       logic clmulh;
                       logic clmulr;
                       logic grev;
                       logic gorc;
                       logic shfl;
                       logic unshfl;
                       logic crc32_b;
                       logic crc32_h;
                       logic crc32_w;
                       logic crc32c_b;
                       logic crc32c_h;
                       logic crc32c_w;
                       logic bfp;
                       } el2_mul_pkt_t;

typedef struct packed {
                       logic valid;
                       logic unsign;
                       logic rem;
                       } el2_div_pkt_t;

typedef struct packed {
                       logic        TEST1;
                       logic        RME;
                       logic [3:0]  RM;

                       logic        LS;
                       logic        DS;
                       logic        SD;
                       logic        TEST_RNM;
                       logic        BC1;
                       logic        BC2;
                      } el2_ccm_ext_in_pkt_t;

typedef struct packed {
                       logic        TEST1;
                       logic        RME;
                       logic [3:0]  RM;
                       logic        LS;
                       logic        DS;
                       logic        SD;
                       logic        TEST_RNM;
                       logic        BC1;
                       logic        BC2;
                      } el2_dccm_ext_in_pkt_t;


typedef struct packed {
                       logic        TEST1;
                       logic        RME;
                       logic [3:0]  RM;
                       logic        LS;
                       logic        DS;
                       logic        SD;
                       logic        TEST_RNM;
                       logic        BC1;
                       logic        BC2;
                      } el2_ic_data_ext_in_pkt_t;


typedef struct packed {
                       logic        TEST1;
                       logic        RME;
                       logic [3:0]  RM;
                       logic        LS;
                       logic        DS;
                       logic        SD;
                       logic        TEST_RNM;
                       logic        BC1;
                       logic        BC2;
                      } el2_ic_tag_ext_in_pkt_t;



typedef struct packed {
                        logic        select;
                        logic        match;
                        logic        store;
                        logic        load;
                        logic        execute;
                        logic        m;
                        logic [31:0] tdata2;
            } el2_trigger_pkt_t;


typedef struct packed {
                        logic [70:0]  icache_wrdata; // {dicad1[1:0], dicad0h[31:0], dicad0[31:0]}
                        logic [16:0]  icache_dicawics; // Arraysel:24, Waysel:21:20, Index:16:3
                        logic         icache_rd_valid;
                        logic         icache_wr_valid;
            } el2_cache_debug_pkt_t;
