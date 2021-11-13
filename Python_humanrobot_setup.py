# -*- coding: utf-8 -*-
"""
Created on Fri Jan 25 11:48:12 2019

@author: Manuel Seet
"""

import matplotlib as mpl
import time
from playsound import playsound

#########Experimental parameters#######################

NumCorrPuzz = 2;
NumErrPuzz = 2;
NumRecovPuzz = 2;
 
start_signal = 'Puzzle {}. Experimenter, please press <ENTER> to start the puzzle';
puzz_starting = '\n======STARTING Puzzle {}======\n';
puzz_end = '\n======END of Puzzle {}=======\n';

mp3 = '.mp3';

#EEG Time Markers
RTurnStart = 000;
 
PreGrasp = 240;
PreLift = 241;
 
CorrFreeze = 250;
CorrMove = 251;
CorrLand = 252;
CorrRel = 253;
 
ErrFreeze = 260;
ErrMove = 261;
ErrLand = 262;
ErrRel = 263;
 
RcvFreeze = 270;
RcvErrMove = 271;
RcvErrLand = 272;
RcvApolOn = 273;
RcvApolOff = 274;
RcvCorrLift = 275;
RcvCorrLand = 276;
RcvCorrRel = 277;
 
RTurnEnd = 999;

#############Defining functions ############################

## robot funcitons
def robot_start():
    print("Robot Turn starting")
    playsound('RobotStart.mp3')
    playsound('one_beep.mp3')

def robot_end():
    playsound('RobotEnd.mp3')
    playsound('one_beep.mp3')
    
def robot_apology():
    apoLabel = str(apoLet+str(turnNo)+mp3);
    print('Puzzle {} Turn {} : (7) Robot APOLOGY'.format(i, str(turnNo)));
    playsound(apoLabel); #RcvApolOn


##Human functions 
def human_start():
    playsound('HumanStart.mp3')
    playsound('bleep.wav');
    playsound('bleep.wav');
    print('Human Subject Turn, waiting to end by keypress')

def human_end():
    input("...")
    playsound('bleep.wav');
    print('End of human turn\n')
    
def thank_humanturn():
    playsound('ThankHumanTurn.mp3')


##full puzzle functions

def robot_CorrPuzz():
    robot_start()
    robot_end()
    
def robot_RcvPuzz():
    robot_start()
    robot_apology()
    robot_end()

def human_AllPuzz():
    human_start()
    human_end()
    thank_humanturn()



##########################################################################
##############################Correct Puzzles###########################
##########################################################################

"""
for i in range(1,NumCorrPuzz): #add one to NumCorr
    print(start_signal.format(i))
    input("Waiting for experimenter response...")
    print(puzz_starting.format(i))
    
    time.sleep(3)
    
    #start first turn
    turnNo = 1;
    
    robot_CorrPuzz()
    human_AllPuzz()
    
    turnNo = turnNo+1;
    robot_CorrPuzz()
    human_AllPuzz()
    
    turnNo = turnNo+1;
    robot_CorrPuzz()
    human_AllPuzz()
    
    turnNo = turnNo+1;
    robot_CorrPuzz()

    
    print(puzz_end.format(i))
"""


for i in range(3,NumRecovPuzz+2): #add 3 to NumRecovPuzz to run through 2 puzzles
    print(start_signal.format(i))
    input("Waiting for experimenter response...")
    print(puzz_starting.format(i))
    
    time.sleep(3)
    
    ######Define apology#########
    if i%2 == 1:
        apoLet = 'A'
    if i%2 == 0:
        apoLet = 'B'
    #############################
    
    #start first turn
    turnNo = 1;
    
    robot_RcvPuzz()
    human_AllPuzz()
    
    turnNo = turnNo+1;
    robot_RcvPuzz()
    human_AllPuzz()
    
    turnNo = turnNo+1;
    robot_RcvPuzz()
    human_AllPuzz()
    
    turnNo = turnNo+1;
    robot_RcvPuzz()
    
    print(puzz_end.format(i))
    



















