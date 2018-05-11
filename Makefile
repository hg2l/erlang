hello:
	cd hello \
	&& erlc hello.erl \
	&& erl -noshell -s hello hello -s init stop

fs:
	cd fileserver \
	&& erlc afile_server.erl \
	&& erlc afile_client.erl \
	&& erl -noshell -s afile_client main -s init stop

.PHONY: hello fs
