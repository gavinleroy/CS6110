#!/usr/bin/python3

# SEND MORE MONEY 
# encoding using Z3
# Gavin Gray CS 6110 SP21
# University of Utah
from z3 import *
#    SEND
#  + MORE
#  ------
# = MONEY

# Change to 0 if the MSD is allowed to be '0'
MSD_MIN = 1
# DEFINE THE VARIABLES
S, E, N, D, M, O, R, Y = Ints('S E N D M O R Y')
SEND, MORE, MONEY = Ints('SEND MORE MONEY')
# Create the solver
s = Solver()
s.add(And(MSD_MIN <= S, S <= 9)) # MSD
s.add(And(0 <= E, E <= 9))
s.add(And(0 <= N, N <= 9))
s.add(And(0 <= D, D <= 9))
s.add(And(MSD_MIN <= M, M <= 9)) # MSD
s.add(And(0 <= O, O <= 9))
s.add(And(0 <= R, R <= 9))
s.add(And(0 <= Y, Y <= 9))
# I'm sure there's an easier way to do this :(
s.add(Not(Or(S == E, S == N, S == D, S == M, S == O, S == R, S == Y))) # S
s.add(Not(Or(E == S, E == N, E == D, E == M, E == O, E == R, E == Y))) # E
s.add(Not(Or(N == S, N == E, N == D, N == M, N == O, N == R, N == Y))) # N
s.add(Not(Or(D == S, D == E, D == N, D == M, D == O, D == R, D == Y))) # D
s.add(Not(Or(M == S, M == E, M == D, M == N, M == O, M == R, M == Y))) # M
s.add(Not(Or(O == S, O == E, O == N, O == D, O == M, O == R, O == Y))) # O
s.add(Not(Or(R == S, R == E, R == N, R == D, R == M, R == O, R == Y))) # R
s.add(Not(Or(Y == S, Y == E, Y == N, Y == D, Y == M, Y == O, Y == R))) # Y
s.add(SEND == D + N*10 + E*100 + S*1000) # SEND
s.add(MORE == E + R*10 + O*100 + M*1000) # MORE
s.add(MONEY == Y + E*10 + N*100 + O*1000 + M*10000) # MONEY
s.add(MONEY == SEND + MORE) # MONEY

total_sols = 0
while s.check() == sat:
    total_sols += 1
    print(s.model())
    s.add(Or( S != s.model()[S] 
            , E != s.model()[E]
            , N != s.model()[N]
            , D != s.model()[D]
            , M != s.model()[M]
            , O != s.model()[O]
            , R != s.model()[R]
            , Y != s.model()[Y]
            ))
print('solution count: ', total_sols)
