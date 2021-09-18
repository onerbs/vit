module vit

import uwu

pub fn exec(cmd string) bool {
	uwu.exec('git $cmd') or {
		$if debug {
			eprintln(err.msg)
		}
		return false
	}
	return true
}
