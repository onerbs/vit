module vit

import uwu
import term
import os

// absolute path to the `git` executable.
const exe = init_git()

fn init_git() string {
	path := os.find_abs_path_of_executable('git') or {
		eprintln('Error: The `git` executable was not found.')
		exit(1)
	}
	return path
}

// exec execute a command or throw an error.
pub fn exec(cmd string) ? {
	uwu.exec('"$vit.exe" $cmd') ?
}

// get return the output of the executed command.
pub fn get(cmd string) string {
	return uwu.exec('"$vit.exe" $cmd') or {
		$if debug {
			mut msg := err.msg
			if term.can_show_color_on_stderr() {
				msg = term.red(msg)
			}
			eprintln(msg)
		}
		return ''
	}
}
