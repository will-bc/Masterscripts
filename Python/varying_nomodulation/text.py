

names = []
with open('example3.py', 'r+') as fd:
    for line in fd:
        names.append(line.split(' ')[-1].strip())

    
    names.insert(4, 0) # element 2 will be 3. in your list
    print (names)
    fd.seek(0)
    fd.truncate()

    for i in xrange(len(names)):
	fd.write("%d. %s\n" %(i + 1, names[i]))


