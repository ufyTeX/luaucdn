spec:
	busted .

clean:
	rm -rf *.so

lint:
	luacheck src spec

doc:
	ldoc -d docs  .

.PHONY: clean lint spec doc
