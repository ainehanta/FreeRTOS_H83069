#/*
#    FreeRTOS V8.0.1 - Copyright (C) 2014 Real Time Engineers Ltd.
#	
#
#    ***************************************************************************
#     *                                                                       *
#     *    FreeRTOS tutorial books are available in pdf and paperback.        *
#     *    Complete, revised, and edited pdf reference manuals are also       *
#     *    available.                                                         *
#     *                                                                       *
#     *    Purchasing FreeRTOS documentation will not only help you, by       *
#     *    ensuring you get running as quickly as possible and with an        *
#     *    in-depth knowledge of how to use FreeRTOS, it will also help       *
#     *    the FreeRTOS project to continue with its mission of providing     *
#     *    professional grade, cross platform, de facto standard solutions    *
#     *    for microcontrollers - completely free of charge!                  *
#     *                                                                       *
#     *    >>> See http://www.FreeRTOS.org/Documentation for details. <<<     *
#     *                                                                       *
#     *    Thank you for using FreeRTOS, and thank you for your support!      *
#     *                                                                       *
#    ***************************************************************************
#
#
#    This file is part of the FreeRTOS distribution.
#
#    FreeRTOS is free software; you can redistribute it and/or modify it under
#    the terms of the GNU General Public License (version 2) as published by the
#    Free Software Foundation AND MODIFIED BY the FreeRTOS exception.
#    >>>NOTE<<< The modification to the GPL is included to allow you to
#    distribute a combined work that includes FreeRTOS without being obliged to
#    provide the source code for proprietary components outside of the FreeRTOS
#    kernel.  FreeRTOS is distributed in the hope that it will be useful, but
#    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#    or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#    more details. You should have received a copy of the GNU General Public
#    License and the FreeRTOS license exception along with FreeRTOS; if not it
#    can be viewed here: http://www.freertos.org/a00114.html and also obtained
#    by writing to Richard Barry, contact details for whom are available on the
#    FreeRTOS WEB site.
#
#    1 tab == 4 spaces!
#
#    http://www.FreeRTOS.org - Documentation, latest information, license and
#    contact details.
#
#    http://www.SafeRTOS.com - A version that is certified for use in safety
#    critical systems.
#
#    http://www.OpenRTOS.com - Commercial support, development, porting,
#    licensing and training services.
#*/


CC=h8300-hms-gcc
LD = h8300-hms-ld
OBJCOPY=h8300-hms-objcopy
SIZE = h8300-hms-size
DEBUG=-g
OPT=-Os
WARNINGS=-Wall -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-align -Wsign-compare \
		-Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wunused

# Setup paths to source code
SOURCE_PATH = ../../Source
PORT_PATH = ../../Source/portable/GCC/H83069F
DEMO_PATH = ../Common/Minimal
INCLUDES = -I. -I$(SOURCE_PATH)/include -I../Common/include
LIBS = 
TARGET_COFF = $(TARGET:.mot=.coff)
MAP_FILE = $(TARGET:.mot=.map)
OUTPUT_FORMAT = -O srec --srec-forceS3

#
# Source files that can be built to THUMB mode.
#
TARGET = h83069.mot
LDSCRIPT = link.x
STARTUP = start.s
SOURCE_C = \
main.c \
vector.c \
ParTest/ParTest.c \
serial/serial.c \
$(SOURCE_PATH)/tasks.c \
$(SOURCE_PATH)/list.c \
$(SOURCE_PATH)/queue.c \
$(SOURCE_PATH)/portable/MemMang/heap_1.c \
$(PORT_PATH)/port.c \
$(DEMO_PATH)/flash.c \
$(DEMO_PATH)/integer.c \
$(DEMO_PATH)/comtest.c \
$(DEMO_PATH)/PollQ.c
SOURCE_ASM =

CFLAGS=-mh -mrelax -mint32 $(OPT) $(DEBUG) $(INCLUDES) -DGCC_H8300 $(WARNINGS)

LDFLAGS = -T $(LDSCRIPT) -nostartfiles -Wl,-Map,$(MAP_FILE)


#
# Define all object files.
#

.SUFFIXES: .c .s .o 

OBJ = $(STARTUP:.s=.o) $(SOURCE_C:.c=.o) $(SOURCE_ASM:.s=.o)

$(TARGET) : $(TARGET_COFF)
	$(OBJCOPY) -v $(OUTPUT_FORMAT) $(TARGET_COFF) $(TARGET)

$(TARGET_COFF) : $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ) -o $(TARGET_COFF)
	$(SIZE) -Ax $(TARGET_COFF)

clean :
	rm -f $(TARGET) $(TARGET_COFF) $(MAP_FILE) $(OBJ) $(STARTUP:.s=.o)

.c.o:
	$(CC) -c $(CFLAGS) $<

.s.o:
	$(CC) -c $(CFLAGS) $<
