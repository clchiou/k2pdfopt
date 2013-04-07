SRCS=	k2pdfopt.c \
	willuslib/strbuf.c \
	willuslib/bmpmupdf.c \
	willuslib/mem.c \
	willuslib/point2d.c \
	willuslib/string.c \
	willuslib/ansi.c \
	willuslib/linux.c \
	willuslib/wzfile.c \
	willuslib/wgs.c \
	willuslib/render.c \
	willuslib/gslpolyfit.c \
	willuslib/token.c \
	willuslib/wfile.c \
	willuslib/array.c \
	willuslib/pdfwrite.c \
	willuslib/ocr.c \
	willuslib/wmupdf.c \
	willuslib/win.c \
	willuslib/ocrtess.c \
	willuslib/ocrjocr.c \
	willuslib/math.c \
	willuslib/filelist.c \
	willuslib/fontdata.c \
	willuslib/fontrender.c \
	willuslib/bmpdjvu.c \
	willuslib/bmp.c \
	willuslib/wsys.c \
	willuslib/willusversion.c \
	k2pdfoptlib/k2version.c \
	k2pdfoptlib/bmpregions.c \
	k2pdfoptlib/k2ocr.c \
	k2pdfoptlib/k2menu.c \
	k2pdfoptlib/k2master.c \
	k2pdfoptlib/k2usage.c \
	k2pdfoptlib/k2parsecmd.c \
	k2pdfoptlib/devprofile.c \
	k2pdfoptlib/k2bmp.c \
	k2pdfoptlib/k2publish.c \
	k2pdfoptlib/pagelist.c \
	k2pdfoptlib/breakinfo.c \
	k2pdfoptlib/k2proc.c \
	k2pdfoptlib/k2settings.c \
	k2pdfoptlib/k2file.c \
	k2pdfoptlib/k2sys.c \
	k2pdfoptlib/userinput.c \
	k2pdfoptlib/wrapbmp.c \
	k2pdfoptlib/k2mem.c \
	k2pdfoptlib/bmpregion.c \
	k2pdfoptlib/k2mark.c \
	nacl_libc.c

OBJS=$(subst .c,.o,$(SRCS))

CFLAGS += -w -fpermissive -O2 -Ik2pdfoptlib -Iwilluslib -Iinclude_mod

LIBS :=	-ltesseract -llept -lfitz -lopenjpeg -ljbig2dec -lfreetype \
	-ljpeg -lpng -lz $(LIBS)

all: k2pdfopt

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

k2pdfopt: $(OBJS)
	$(CC) $(LDFLAGS) -o k2pdfopt $(OBJS) $(LIBS)

clean:
	rm -f k2pdfopt $(OBJS)

.PHONY: all clean
