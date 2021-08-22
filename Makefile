.PHONY: all ldid.o ldid clean

all: ldid.o ldid

ldid.o:
	gcc-iphone -Wall -arch arm64 -undefined dynamic_lookup -Isysroot/usr/include -Lsysroot/usr/lib -framework CoreFoundation -lplist -lcrypto -I. -O3 -g0 -c -std=c++11 -o ldid.o ldid.cpp

ldid:
	gcc-iphone -Wall -arch arm64 -undefined dynamic_lookup -Isysroot/usr/include -Lsysroot/usr/lib -framework CoreFoundation -lplist -lcrypto -I. -O3 -g0 -o ldid ldid.o -x c lookup2.c -lxml2 -framework Security
	ldid -Sent.xml ldid

clean:
	$(RM) ldid.o ldid
