import cx_Freeze

exe = [cx_Freeze.Executable("lastfmscrobble.py")]

cx_Freeze.setup( name = "lastfmscrobble", version = "1.0", options = {"build_exe": {"packages": ["errno", "os", "re", "stat", "subprocess","collections", "pprint","shutil"], "include_files": []}}, executables = exe )