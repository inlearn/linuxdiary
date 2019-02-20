#!/bin/bash
If [ $UID -ne 0 ]; then
	echo not root.
else
	echo root
fi

