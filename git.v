module vit

import uwu

// exec execute a git command.
pub fn exec(cmd string) bool {
	uwu.exec('git $cmd') or {
		$if debug {
			eprintln(err.msg)
		}
		return false
	}
	return true
}
