
import numpy as np
import argparse

from numpy.core.fromnumeric import size

def pad_matrix(matrix1, matrix2, n):
  n1, n2 = matrix1.shape
  n3, n4 =  matrix2.shape

  #n_max= max(n1, n2, n3, n4)

  matrix1_pad= np.zeros((n,n))
  matrix2_pad= np.zeros((n,n))

  matrix1_pad[:n1, :n2]= matrix1
  matrix2_pad[:n3, :n4]= matrix2

  return matrix1_pad, matrix2_pad 


def save_matrix(matrix1, matrix2, mem_size=1000, K=332, n1=3, n2=3, n3=3, c=1, write_filename= 'out.txt'):
  matrix1 = np.array(matrix1)
  matrix2 = np.array(matrix2)

  n = max(n1,n2,n3)
  
  matrix1, matrix2 = pad_matrix(matrix1, matrix2, n)

  matrix1_flat = matrix1.flatten().astype('int')
  matrix2_flat = matrix2.T.flatten().astype('int')

  to_mem=np.zeros((mem_size+1,)).astype('int')
  for idx in range(0, n*n):
    to_mem[idx] = matrix1_flat[idx]
  
  for idx in range(0, n*n):
    to_mem[K+idx] = matrix2_flat[idx]

  to_mem[-2]=c
  to_mem[-3]=n
  
  to_mem= '\n'.join(to_mem.astype('str'))

  with open(write_filename, 'w') as f:
    f.write(to_mem)
  print(f'written to {write_filename}')


parser = argparse.ArgumentParser(description='Write matrices')
# parser.add_argument('--matrix1', type=str)
# parser.add_argument('--matrix2', type=str)
parser.add_argument('--mem_size', type=int, default= 1000)
parser.add_argument('--K', type= int, default= 332)
parser.add_argument('--n1', type=int)
parser.add_argument('--n2', type=int)
parser.add_argument('--n3', type=int)
parser.add_argument('--c', type= int)
parser.add_argument('--filename', type=str, default= 'data_to_mem.txt')

args = parser.parse_args()


matrix1 = np.random.randint(10, size= (args.n1,args.n2))
matrix2 = np.random.randint(10, size= (args.n2,args.n3))


save_matrix(matrix1,matrix2,args.mem_size, args.K, args.n1, args.n2, args.n3, args.c, args.filename)
