import os



for w in range (5, 51,5):  
	print(w)
	
	for ww in range (1,8,1):
		
		print(ww) 
	   	os.system("mpiexec -n 2  python example3.py")
		#execfile("example3.py")
	 	#exec(compile(open("example3.py").read(), file, 'exec'))
		print(str(w)+','+str(ww))
