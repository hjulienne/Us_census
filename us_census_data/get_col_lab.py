f = open("data_col.txt",'r')
fo = open("col_names.txt", "w")
cols = f.readlines()

for i in cols:

    i = i.split(':')[0]
    i = '_'.join(i.split(' '))
    fo.write("%s\n"%(i))
    print i
fo.close()
f.close()
