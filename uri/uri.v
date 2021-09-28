module uri

import vit.env

struct Host {
	name string [required]
	repo string [required]
mut:
	user string = env.git_user
}

// new_host initialize a custom host.
pub fn new_host(host Host) Host {
	return host
}

// get_user return the host username.
pub fn (mut self Host) get_user() string {
	return self.user
}

// set_user update the host username.
pub fn (mut self Host) set_user(user string) {
	self.user = user
}

// git returns the URI in git protocol
pub fn (self Host) git() string {
	return 'git://$self.name/$self.user/${self.repo}.git'
}

// http returns the URI in HTTP protocol
pub fn (self Host) http() string {
	return 'http://$self.name/$self.user/$self.repo'
}

// https returns the URI in HTTPS protocol
pub fn (self Host) https() string {
	return 'https://$self.name/$self.user/$self.repo'
}

// ssh returns the URI in ssh protocol
pub fn (self Host) ssh() string {
	return 'git@$self.name:$self.user/${self.repo}.git'
}
