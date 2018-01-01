unit Constants;

interface

uses
  Winapi.Messages;

const
  OneKibiByte = Int64(1024);
  OneMebiByte = Int64(1024) * OneKibiByte;
  OneGibiByte = Int64(1024) * OneMebiByte;
  OneTebiByte = Int64(1024) * OneGibiByte;
  OnePebiByte = Int64(1024) * OneTebiByte;
  OneExbiByte = Int64(1024) * OnePebiByte;

const
  THREAD_MSG_PLAY_NEXT = $0001;

const
{$DEFINE WRITEDEBUGLOG}
  BuildInt = 3422;
  Portable = False;
  WM_INFO_UPDATE = WM_USER + 101;
  RESET_UI = 0;
  SHOW_ERROR = 1;
  UPDATE_PROGRESS = 2;
  UPDATE_META_NAME = 3;
  UPDATE_META_BITRATE = 4;
  UPDATE_META = 7;
  STATUS_UPDATE = 8;
  REPAINT_RADIO_LIST = 9;
  STOP_IMG_ANIM = 10;
  DOWNLOAD_LYRIC = 11;
  START_RECORDING = 12;
  PLAY_NEXT_SONG = 13;
  UPDATE_LEVELS = 14;
  STOP_TIMERS = 15;

implementation

end.

