module repo

pub struct Entry {
pub:
	hash    string
	author  string
	message string
}

// log return the list of commits.
pub fn (self Repository) log() ?[]Entry {
	out := self.exec('log --pretty=format:%h\\%an\\%s') ?
	return out.split_into_lines().map(log_entry)
}

// log_entry create a log entry.
fn log_entry(line string) Entry {
	parts := line.split_nth('\\', 3)
	return Entry{parts[0], parts[1], parts[2]}
}
