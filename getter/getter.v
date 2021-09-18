module getter

import uwu.ups
import uwu.str
import term
import os

pub struct Getter {
mut:
	target string
	branch string
}

// new create a helper for cloning repositories.
pub fn new(cfg Getter) ?Getter {
	if cfg.target.len > 0 && os.exists(cfg.target) {
		mut target := str.quote(cfg.target)
		target = uwu.colorize(target, term.bold)
		ups.raise('cannot clone into $target: already exists') ?
	}
	target := str.safe_quote(os.real_path(cfg.target))
	return Getter{target, cfg.branch}
}

// set_target change the target directory for the cloned repository.
pub fn (mut self Getter) set_target(target string) {
	self.target = target
}

// set_branch change the target branch of the cloned repository.
pub fn (mut self Getter) set_branch(branch string) {
	self.branch = branch
}
