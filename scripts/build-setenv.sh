#!/bin/sh
LDFLAGS="-L/Applications/jrubystack-1.7.5-0/common/lib $LDFLAGS"
export LDFLAGS
CFLAGS="-I/Applications/jrubystack-1.7.5-0/common/include $CFLAGS"
export CFLAGS
		    
PKG_CONFIG_PATH="/Applications/jrubystack-1.7.5-0/common/lib/pkgconfig"
export PKG_CONFIG_PATH
