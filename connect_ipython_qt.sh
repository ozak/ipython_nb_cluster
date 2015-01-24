#!/bin/bash
srun -I -N1 -n1 -c 8  --exclusive -p parallel --x11=first --pty ipython qtconsole
