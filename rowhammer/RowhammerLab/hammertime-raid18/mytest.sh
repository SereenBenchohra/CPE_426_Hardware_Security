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
/home/sereeen/hammertime/py//dem_exploit.py 128m.adjacent.res mem.msys > 128adjacent.dedup
echo ""
echo "		Flip Fen Shui"
/home/sereeen/hammertime/py//ffs_exploit.py 128m.adjacent.res mem.msys > 128adjacent.ffs
echo ""
echo "		x86 Exploits"
/home/sereeen/hammertime/py//x86pte_exploits.py 128m.adjacent.res mem.msys 1 > 128adjacent.exploits
echo ""
echo ""
echo ""
echo "128m.double.pwg1.res:"
echo "          Dedup Est Machina"
/home/sereeen/hammertime/py//dem_exploit.py 128m.double.pwg1.res mem.msys > 128doublepwg.dedup
echo ""
echo "          Flip Fen Shui"
/home/sereeen/hammertime/py//ffs_exploit.py 128m.double.pwg1.res mem.msys > 128doublepwg.ffs
echo ""
echo "          x86 Exploits"
/home/sereeen/hammertime/py//x86pte_exploits.py 128m.double.pwg1.res mem.msys 1 > 128doublepwg.exploits
echo ""
echo ""
echo ""
echo "128m.double.res:"
echo "          Dedup Est Machina"
/home/sereeen/hammertime/py//dem_exploit.py 128m.double.res mem.msys > 128double.dedup
echo ""
echo "          Flip Fen Shui"
/home/sereeen/hammertime/py//ffs_exploit.py 128m.double.res mem.msys > 128double.ffs
echo ""
echo "          x86 Exploits"
/home/sereeen/hammertime/py//x86pte_exploits.py 128m.double.res mem.msys 1 > 128double.exploits
echo ""
echo ""
echo ""
echo "128m.single.res:"
echo "          Dedup Est Machina"
/home/sereeen/hammertime/py//dem_exploit.py 128m.single.res mem.msys > 128single.dedup
echo ""
echo "          Flip Fen Shui"
/home/sereeen/hammertime/py//ffs_exploit.py 128m.single.res mem.msys > 128single.ffs
echo ""
echo "          x86 Exploits"
/home/sereeen/hammertime/py//x86pte_exploits.py 128m.single.res mem.msys 1 > 128single.exploits
echo ""
echo ""
