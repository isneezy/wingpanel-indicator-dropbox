/*
* Copyright (c) 2011-2018 Ivan Vilanculo (https://ivan.vilanculo.me)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not,see <http://www.gnu.org/licenses/>.
*
*/

public class Dropbox.Services.Service {
  public const int DROP_BOX_STATUS_UNKNOWN = -1;
  public const int DROP_BOX_STATUS_STOPPED = 0;
  public const int DROP_BOX_STATUS_SYNCING = 1;
  public const int DROP_BOX_STATUS_UPTODATE = 2;

  public Service () {}

  private string get_pid_file_path () {
    return GLib.Environment.get_home_dir () + "/.dropbox/dropbox.pid";
  }

  private string get_pid () {
    string pid;
    var pid_file = File.new_for_path(get_pid_file_path());
    if (!pid_file.query_exists ()) {
      return "";
    }
    try {
        FileInputStream @is = pid_file.read ();
        DataInputStream dis = new DataInputStream (@is);
        pid = dis.read_line ();
        return pid;
    } catch (Error e) {
      debug("Error " + e.message);
      return "";
    }
  }

  public bool is_dropbox_running () {
    var proc_file = File.new_for_path("/proc/" + get_pid() + "/cmdline");
    return proc_file.query_exists ();
  }

  public int get_dropbox_status () {
    int status = DROP_BOX_STATUS_UNKNOWN;

    if (is_dropbox_running()) {

      string dropbox_stdout;
      string dropbox_stderr;
      int dropbox_status;

      try {
        Process.spawn_command_line_sync ("dropbox status",
          out dropbox_stdout,
          out dropbox_stderr,
          out dropbox_status);

        dropbox_stdout = dropbox_stdout.split("\n")[0];
        switch (dropbox_stdout) {
          case "Up to date":
            status = DROP_BOX_STATUS_UPTODATE;
            break;

         case "Connecting...":
           status = DROP_BOX_STATUS_SYNCING;
           break;

         case "Starting...":
           status = DROP_BOX_STATUS_SYNCING;
           break;

         case "Checking for changes...":
           status = DROP_BOX_STATUS_SYNCING;
           break;
        }

        if (dropbox_stdout.has_prefix ("Syncing")) {
          status = DROP_BOX_STATUS_SYNCING;
        } else if (dropbox_stdout.has_prefix ("Indexing")) {
          status = DROP_BOX_STATUS_SYNCING;
        }
      } catch (SpawnError e) {}
    }

    return status;
  }
}

// void main (string[] args) {
//   Dropbox.Services.Service service = new Dropbox.Services.Service ();
//   print("status: %d\n", service.get_dropbox_status());
// }
