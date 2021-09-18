module uri

// bitbucket create a new URL maker with the BitBucket host.
pub fn bitbucket() Host {
	return new_host(name: 'bitbucket.org')
}

// codeberg create a new URL maker with the CodeBerg host.
pub fn codeberg() Host {
	return new_host(name: 'codeberg.org')
}

// github create a new URL maker with the GitHub host.
pub fn github() Host {
	return new_host(name: 'github.com')
}

// gitlab create a new URL maker with the GitLab host.
pub fn gitlab() Host {
	return new_host(name: 'gitlab.com')
}

// sourcehut create a new URL maker with the SourceHut host.
pub fn sourcehut() Host {
	return new_host(name: 'git.sr.ht')
}
