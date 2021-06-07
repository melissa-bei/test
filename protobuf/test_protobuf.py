# coding: utf8
import cad_model_pb2 as a
b = a.Vector()
b.x = 1
b.y = 2
string = b.SerializeToString()
b.ParseFromString(b'\t\x00\x00\x00\x00\x00\x00\xf0?')
pass