CC=processing-java
TARGET=pong

all:
	$(CC) --sketch=$(shell pwd)/$(TARGET) --run