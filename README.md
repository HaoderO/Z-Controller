# 勘智Z_Controller开发记录（1）

# 开发板介绍

> Z-Controller 开发板是针对 Xilinx Zynq 系列 FPGA XC7Z020，专门为 Zynq FPGA 使用者和 Zyng FPGA 学习者提供的一款简单易用、价格便宜、易扩展的开发板。
> 

这块板子又被叫做“荔枝糖Hex”，具体来由我也没有查明。

## 主要模块

1）FPGA: Zyng XC7Z020
2）NAND Flash:2Gb
3）LPDDR3: 1GB
4）100M网口:x1
5）USB 2.0: x4
6）TF卡槽:x1

## 硬件介绍

### 主芯片：XC7Z020-1CLG484

Zynq-7000SoC系列集成ARM处理器的软件可编程性与FPGA的硬件可编程性，不仅可实现重要分析与硬件加速，同时还在单个器件上高度集成 CPU、DSP、ASSP 以及混合信号功能。

**PS 部分：Cortex-A9**

双核 667MHz；

L1：32KB指令空间，32KB 数据空间每核；

L2：512KB，片上存储空间 256KB。

**PL部分：Artix-7 FPGA**

可编程逻辑单元：85K；

LUTs： 53200；

Block RAM：4.9Mb。

### 内存芯片：MT41K256M16TW-107

容量：512MB（32Meg x16 x8 banks）；

DDR3L SDRAM(1.35V)，向上兼容 1.5V。

### **NAND FLASH 存储芯片：MT29F2G08ABAEAWP**

1）ONFI 1.0接口；

2）标准SLC技术结构；

3）**Page size：**2112 bytes(2048+64bytes)
        **Block size：**64pages(28K +4Kbytes)
        **Planesize：**2 planesx 1024 blocksper plane
        **Device size**：2Gb: 2048 blocks

### ULPI 桥片：USB3320C

USB3320是高度集成的全功能高速USB 2.0收发器，基于MicrochipULPI 接口。

### USB HUB&10/100 网卡芯片：LAN9514-JZX

USB Hub：1x上行USB2.0 PHY，4x下行 USB 2.0PHY

### 网卡

集成MAC和PHY，支持10BASE- T和100BASE- TX。

### 实物图

![正面](https://github.com/HaoderO/Z-Controller/blob/main/record_doc/front.jpg "正面")

正面

![背面](https://github.com/HaoderO/repository/Z-Controller/main/record_doc/back.jpg "背面")

背面

# 从点灯开始

Z-Controller（TANG HEX）的做工十分精致，但对于刚刚入门FPGA的同学来说开发起来还是存在一定难度的。其一是因为想要充分发挥ZYNQ的优势就必定要涉及PS和PL两端的开发，对于习惯了软件开发的串行思维或习惯了硬件开发的并行思维的同学来说，要在这两种思维之间灵活转换是存在一定困难的；其二是因为这个板子现有的例程和学习资料十分有限，对于习惯直接烧录开发板提供的例程来学习的小白来说，学习过程必定会十分痛苦。 

下面从点灯开始记录我的踩坑之路。

同样作为一名小白，我将以点亮LED 指示灯为第一个目标，来进一步熟悉VIVADO的使用和ZYNQ的开发流程，同时，对这块“白嫖”来的开发板做一个最初步的上手体验。

## 构建工程体系

首先创建名为“led”的Vivado工程。

### 坑点1

这个板子的PL端没有单独的晶振来提供时钟。

**解决办法：**将PS侧的软核配置成IP核，引出FCLK0，在LED的Verilog程序中调用该IP（就是把它当作PLL一样使用）为PL侧提供时钟……嗯……或者直接飞线🤔（可能会有时序问题，建议不要这么做）。

### 坑点2

这个板子没有外置的复位按键。

**解决办法：**可以使用软件复位或者直接通过插拔电源复位😎。

### 坑点3

暂时没有仿真器，只能将程序固化到SD卡来启动ZYNQ，其中涉及到ZYNQ的启动过程问题，还有就是要通过PL端点亮LED就必须启动PS端，比较难搞。

**解决办法：**或者PL侧开发完成后“export hardware”并“include bitstream”，通过进入SDK并创建一个空的“application project”，并在该工程的src文件夹中新建一个main.c，然后直接在SDK中进行下载调试。

其他方法：购买官方下载器或DIY一个。

DIY下载器：[https://www.notion.so/XILINX-FPGA-5d6f5fcdbea1471680b23ffb235a4e80?pvs=4](https://www.notion.so/XILINX-FPGA-5d6f5fcdbea1471680b23ffb235a4e80)

### 坑点4

板子的NAND FLASH在硬件级上有问题，即无法将程序固化到FLASH上。

参考：[https://blog.csdn.net/qq_36229876/article/details/108238021](https://blog.csdn.net/qq_36229876/article/details/108238021)

**解决办法**：不考虑这种固化方法😶。

### PL侧开发,

PL侧开发的主要任务是用Verilog语言编写LED的驱动代码。双色LED对应开发板的丝印编号为D25,两个LED的阴极对应PL侧的管脚分别为AB1、AB4。

由原理图易知，当PL_LED1（或PL_LED2）为低电平时LED被点亮。

![LED原理图](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/LED%25E5%258E%259F%25E7%2590%2586%25E5%259B%25BE1.jpg)

LED原理图

![PL侧对应的LED管脚](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/LED%25E5%258E%259F%25E7%2590%2586%25E5%259B%25BE2.jpg)

PL侧对应的LED管脚

LED驱动代码如下，闪烁频率可通过参数CNT_DIV_MAX 进行设置。

示例代码中CNT_DIV_MAX = 10000000，clk为50MHz，做一个简单的算数：

$$
\frac{50\times 10^{6} }{10^{7} } =5Hz \quad或\quad 20\times 10^{-9} \times 10^{7} =0.2s
$$

则容易得单侧LED的闪烁频率为5HZ，即每隔0.2秒点亮一次。

```jsx
module led_ctrl
#(
    parameter   CNT_DIV_MAX = 10000000
)
(
    input   wire    rst_n       ,

    output  wire    pwm_0       ,      
    output  wire    pwm_1          
);

    wire             clk        ;//50M
    reg     [23:0]   cnt_div    ;
    reg              flag       ;

sys_clk_wrapper system_clk
(
    .FCLK_CLK0_0      (clk)
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        cnt_div <= 24'd0;
    else if (cnt_div == CNT_DIV_MAX) 
        cnt_div <= 24'd0;        
    else
        cnt_div <= cnt_div + 1'b1;                
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        flag <= 1'b0;        
    else if (cnt_div == CNT_DIV_MAX) 
        flag <= ~flag;                
    else
        flag <= flag;                
end

assign pwm_0 =  flag;
assign pwm_1 = ~flag;

endmodule
```

led_ctrl_tb如下。其中设定参数CNT_DIV_MAX=1000以缩短仿真时间。 

```jsx
module led_ctrl_tb;

// Parameters
localparam  CNT_DIV_MAX = 1000;

// Ports
reg  rst_n = 0;
wire  pwm_0;
wire  pwm_1;

led_ctrl 
#(
    .CNT_DIV_MAX    (CNT_DIV_MAX)
)
led_ctrl_dut 
(
    .rst_n          (rst_n      ),
    .pwm_0          (pwm_0      ),
    .pwm_1          (pwm_1      )
);

initial begin
    begin
        #100 rst_n = 1;
    end
end

endmodule
```

仿真波形如下。

![复位时](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/%25E5%25A4%258D%25E4%25BD%258D%25E6%2597%25B6%25E6%25B3%25A2%25E5%25BD%25A2.png)

复位时

![分频节点](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/%25E5%2588%2586%25E9%25A2%2591%25E8%258A%2582%25E7%2582%25B9%25E6%25B3%25A2%25E5%25BD%25A2.png)

分频节点

![PWM波形](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/pwm%25E6%25B3%25A2%25E5%25BD%25A2.png)

PWM波形

### PS侧开发

![软核IP.jpg](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/%25E8%25BD%25AF%25E6%25A0%25B8IP.jpg)

mian.c示例如下：

```jsx
#include "xparameters.h"
#include "xplatform_info.h"

int main(void)
{
  while(1)
	{
  }
}
```

程序仅包含两个头文件，分别提供系统的硬件配置信息和平台信息。程序的主要部分是一个无限循环，使程序保持在空闲状态。简而言之，这段程序存在的目的就是要让PS端运行起来为PL侧提供时钟。

# 运行结果

[成功点亮双色LED灯](%E5%8B%98%E6%99%BAZ_Controller%E5%BC%80%E5%8F%91%E8%AE%B0%E5%BD%95%EF%BC%881%EF%BC%89%20f524b6c941394913b7c307bd874df6a5/LED%25E9%2597%25AA%25E7%2583%2581.mp4)

成功点亮双色LED灯

# 调试问题记录

### 问题1 不熟悉Xilinx SDK开发流程

### 问题2 没有正确调用打包的PS端 IP核

### 问题3 下载器连接问题

开发板的JTAG接口引脚与下载器的接口顺序不同，无法直连。第一次时通过双公头杜邦线连接JTAG排线和板子的JTAG接口，但Vivado识别不出ZYNQ；第二次去掉JTAG排线，用公母头杜邦线直接连接下载器和板子，Vivado成功识别到设备并能够正常下载程序。（玄学🧐，具体原因待查明）
