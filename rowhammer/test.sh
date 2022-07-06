#!/bin/bash
128m.adjacent.res  128m.double.pwg1.res  128m.double.res  128m.single.res
cd $1
echo "mem.msys:"
cat mem.msys
echo ""
echo ""
echo ""
echo "128m.adjacent.res:"
echo "		Dedup Est Machina"
~/Desktop/CPE426/rowhammer/hammertime/py/dem_exploit.py 128m.adjacent.res mem.msys
echo ""
echo "		Flip Fen Shui"
~/Desktop/CPE426/rowhammer/hammertime/py/ffs_exploit.py 128m.adjacent.res mem.msys
echo ""
echo "		x86 Exploits"
~/Desktop/CPE426/rowhammer/hammertime/py/x86pte_exploits.py 128m.adjacent.res mem.msys 1
echo ""
echo ""
echo ""
echo "128m.double.pwg1.res:"
echo "          Dedup Est Machina"
~/Desktop/CPE426/rowhammer/hammertime/py/dem_exploit.py 128m.double.pwg1.res mem.msys
echo ""
echo "          Flip Fen Shui"
~/Desktop/CPE426/rowhammer/hammertime/py/ffs_exploit.py 128m.double.pwg1.res mem.msys
echo ""
echo "          x86 Exploits"
~/Desktop/CPE426/rowhammer/hammertime/py/x86pte_exploits.py 128m.double.pwg1.res mem.msys 1
echo ""
echo ""
echo ""
echo "128m.double.res:"
echo "          Dedup Est Machina"
~/Desktop/CPE426/rowhammer/hammertime/py/dem_exploit.py 128m.double.res mem.msys
echo ""
echo "          Flip Fen Shui"
~/Desktop/CPE426/rowhammer/hammertime/py/ffs_exploit.py 128m.double.res mem.msys
echo ""
echo "          x86 Exploits"
~/Desktop/CPE426/rowhammer/hammertime/py/x86pte_exploits.py 128m.double.res mem.msys 1
echo ""
echo ""
echo ""
echo "128m.single.res:"
echo "          Dedup Est Machina"
~/Desktop/CPE426/rowhammer/hammertime/py/dem_exploit.py 128m.single.res mem.msys
echo ""
echo "          Flip Fen Shui"
~/Desktop/CPE426/rowhammer/hammertime/py/ffs_exploit.py 128m.single.res mem.msys
echo ""
echo "          x86 Exploits"
~/Desktop/CPE426/rowhammer/hammertime/py/x86pte_exploits.py 128m.single.res mem.msys 1
echo ""
echo ""
