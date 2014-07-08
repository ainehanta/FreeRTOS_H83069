OUTPUT_FORMAT("coff-h8300")
OUTPUT_ARCH(h8300h)
ENTRY("_start")

PROVIDE(_stack = 0xFFFF20);
PROVIDE(__ext_stack = 0x600000);

MEMORY
{
	vector	: o = 0xFFE000, l = 0x100
	ram		: o = 0x400000, l = 0x1F0000
}

SECTIONS
{
	.vector : {
		*(.vector)
	} > vector

	.text : {
		__text_start = . ;
		*(.text)
		*(.rodata)
		*(.strings)
		__text_end = . ;
	}

	.tors : {
		___ctors = . ;
		*(.ctors)
		___ctors_end = . ;
		___dtors = . ;
		*(.dtors)
		___dtors_end = . ;
	} > ram

	.data : {
		__data_start = . ;
		*(.data)
		__edata = .;
	} > ram

	.bss : {
		__bss_start = . ;
		*(.bss)
		*(COMMON)
		__bss_end = . ;
	} > ram
}
