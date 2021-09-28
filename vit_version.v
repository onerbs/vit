module vit

// import semver { Version }

// version return the current git version.
pub fn version() string {
	return get('--version').all_after_last(' ')
}

// // semver return the current git version in semver format.
// pub fn semver() Version {
// 	// TODO handle Git for Windows versions.
// 	parts := version().split('.').map(it.int())
// 	return semver.build(parts[0], parts[1], parts[2])
// }
