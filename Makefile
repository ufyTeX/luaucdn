spec:
	busted .

clean:
	rm -rf *.so

lint:
	luacheck src spec

doc:
	ldoc -d ${DOCS_DIR}  .

.PHONY: clean lint spec doc
