import csv
import glob

dedup_data = []
ffs_data = []
exploits_data = []

def isFLoat(word):
    try: 
        float(word)
        return True
    except:
        return False

for filename in glob.glob('*.dedup'):
    with open(filename) as txt :
        for line in txt:
            for word in line.split():
                if word.isdecimal() is True or isFLoat(word) == True:
                    dedup_data.append(word);

    print("done")

with open ("dedupA1.csv", mode='w+') as WordsFromText:
    writer = csv.writer(WordsFromText, dialect='excel')
    writer.writerow(dedup_data)




for filename in glob.glob('*.ffs'):
    with open(filename) as txt :
        for line in txt:
            for word in line.split():
                if word.isdecimal() is True or isFLoat(word) == True:
                    ffs_data.append(word);

    print("done")

with open ("ffsA1.csv", mode='w+') as WordsFromText:
    writer = csv.writer(WordsFromText, dialect='excel')
    writer.writerow(ffs_data)


for filename in glob.glob('*.exploits'):
    with open(filename) as txt :
        for line in txt:
            for word in line.split():
                if word.isdecimal() is True or isFLoat(word) == True:
                    exploits_data.append(word);

    print("done")

with open ("exploitsA1.csv", mode='w+') as WordsFromText:
    writer = csv.writer(WordsFromText, dialect='excel')
    writer.writerow(exploits_data)