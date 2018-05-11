-module(afile_client).
-export([ls/1, get_file/2, main/0]).

ls(Server) ->
    Server ! {self(), list_dir},
    receive
        {Server, FileList} ->
            FileList
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive
        {Server, Content} ->
            Content
    end.

main() ->
    FileServer = afile_server:start("."),
    timer:sleep(1000),
    io:format("fileserver started."),
    io:format(ls(FileServer)).
