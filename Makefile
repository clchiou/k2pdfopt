# Copyright (c) 2013 Che-Liang Chiou. All rights reserved.
# Use of this source code is governed by the GNU General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

SRC_DIR ?= .
OBJ_DIR ?= .

SRCS = $(SRC_DIR)/k2pdfopt.c
SRCS += $(wildcard $(SRC_DIR)/willuslib/*.c)
SRCS += $(wildcard $(SRC_DIR)/k2pdfoptlib/*.c)

OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))
OBJ_DIRS = $(OBJ_DIR) $(OBJ_DIR)/willuslib $(OBJ_DIR)/k2pdfoptlib

LIB_K2PDFOPT = $(OBJ_DIR)/libk2pdfopt.a

CFLAGS += -w -fpermissive -O2
CFLAGS += -I$(SRC_DIR)/k2pdfoptlib
CFLAGS += -I$(SRC_DIR)/willuslib
CFLAGS += -I$(SRC_DIR)/include_mod

all: $(LIB_K2PDFOPT)

# Install library to $PKG_CONFIG_LIBDIR...
install: $(LIB_K2PDFOPT)
	[ -n "$${PKG_CONFIG_LIBDIR}" ] || exit 1
	mkdir -p $${PKG_CONFIG_LIBDIR}
	cp $< $${PKG_CONFIG_LIBDIR}

clean:
	rm -f $(LIB_K2PDFOPT) $(OBJS)

.PHONY: all install clean

$(LIB_K2PDFOPT): $(OBJS) | $(OBJ_DIRS)
	$(AR) cru $@ $(OBJS)
	-$(RANLIB) $@

$(OBJS): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c | $(OBJ_DIRS)
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJ_DIRS):
	mkdir -p $@
