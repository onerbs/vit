module uri

import vit.env

struct Host {
	name string [required]
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
pub fn (self Host) git(repo string) string {
	return 'git://$self.name/$self.user/${repo}.git'
}

// http returns the URI in HTTP protocol
pub fn (self Host) http(repo string) string {
	return 'http://$self.name/$self.user/$repo'
}

// https returns the URI in HTTPS protocol
pub fn (self Host) https(repo string) string {
	return 'https://$self.name/$self.user/$repo'
}

// ssh returns the URI in ssh protocol
pub fn (self Host) ssh(repo string) string {
	return 'git@$self.name:$self.user/${repo}.git'
}
