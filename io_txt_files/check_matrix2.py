
import numpy as np
import argparse

def check_matrices(file_name= 'results_from_mem.txt', n1=3, n2=3, n3=3, K=100):
  with open(file_name) as f:
    data = f.read()

  all_data = data.split('\n')[:-1]

  n = max(n1,n2,n3)

  matrix1  = np.array([int(x) for x in all_data[0:n*n]]).reshape(n,n)[:n1,:n2]
  matrix2  = np.array([int(x) for x in all_data[K:K+n*n]]).reshape(n,n).T[:n2,:n3]
  out_matrix = np.array([int(x) for x in all_data[2*K:2*K+n*n]]).reshape(n,n)[:n1,:n3]

  correct_matrix= np.matmul(matrix1, matrix2)

  print(f'matrix 1: \n{matrix1}\nmatrix 2: \n{matrix2}\n\nCalculated Answer: \n{out_matrix}\nCorrect Answer: \n{correct_matrix}')
  print(f'\nIs answer correct : {(correct_matrix== out_matrix).all()}')

parser = argparse.ArgumentParser(description='Check matrices')
parser.add_argument('--filename', type=str, default= 'results_from_mem.txt')
parser.add_argument('--n1', type=int)
parser.add_argument('--n2', type=int)
parser.add_argument('--n3', type=int)
parser.add_argument('--K', type= int, default= 332)

args = parser.parse_args()

check_matrices(args.filename, args.n1, args.n2, args.n3, args.K)
