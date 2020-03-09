#Create a General Blockchain
"""
Created on Mon Mar  9 21:11:15 2020
@author: Mitchell Ciupak
"""

#Installed
# Flask v. 0.12.2
# Postman v.7.20.0

#Import
import datetime
import hashlib
import json
from flask import Flask, jsonify

#Init Blockchain
class Blockchain:
    def __init__(self):
        self.chain = []
        self.createBlock(proof = 1, previous_hash = '0')
        
    def create_block(self, proof, previous_hash):
        block = {'index' : len(self.chain) + 1,
                 'timestamp' : str(datetime.datetime.now()),
                 'proof' : proof,
                 'previous_hash' : previous_hash}
        self.chain.append(block)
        return block
    
    def get_previous_block(self):
        return self.chain[-1]

#Mine the Blockchain