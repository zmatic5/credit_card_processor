# Basic Credit Card Processing

## Overview

This task implements software for processing commands on credit card accounts.

### Design Decisions

- Built using plain Ruby, organized using Rails-style structure and naming.
- Commands are handled by service objects.
- Used a (Command) Factory pattern to map command strings to their corresponding service classes.
- Input validation is split into separate validator classes.
- Credit card data is stored in an in-memory singleton store.
- Follows single-responsibility and clean-code principles.

### Usage
Run the CLI with a text file containing the commands:

```BASH
bin/card *.txt
```

Input.txt is already provided, or use another .txt file.
Summary will be written to stdout, and log.txt file will show all the commands that ran and if they were successful or not.

### Testing

To run the test suite:

```BASH
rspec
```

### Linting

To run RuboCop:

```BASH
rubocop
```
