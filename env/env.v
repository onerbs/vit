module env

import uwu
import os

pub const git_user = init_git_user()

// init_git_user return the username for a git cloud service.
pub fn init_git_user() string {
	mut res := os.getenv('GIT_USER')
	for res.len == 0 {
		res = uwu.input('git user').trim_space()
	}
	return res
}
