
import numpy as np
import argparse

def check_matrices(file_name= 'results_from_mem.txt', n=3, K=100):
  with open(file_name) as f:
    data = f.read()

  all_data = data.split('\n')[:-1]

  matrix1  = np.array([int(x) for x in all_data[0:n*n]]).reshape(n,n)
  matrix2  = np.array([int(x) for x in all_data[K:K+n*n]]).reshape(n,n).T
  out_matrix = np.array([int(x) for x in all_data[2*K:2*K+n*n]]).reshape(n,n)

  correct_matrix= np.matmul(matrix1, matrix2)

  print(f'matrix 1: \n{matrix1}\nmatrix 2: \n{matrix2}\n\nCalculated Answer: \n{out_matrix}\nCorrect Answer: \n{correct_matrix}')
  print(f'\nIs answer correct : {(correct_matrix== out_matrix).all()}')

parser = argparse.ArgumentParser(description='Check matrices')
parser.add_argument('--filename', type=str, default= 'results_from_mem.txt')
parser.add_argument('--n', type=int)
parser.add_argument('--K', type= int, default= 332)

args = parser.parse_args()

check_matrices(args.filename, args.n, args.K)
