# Fawry-task-internship
# Q1 : Custom Command (mygrep.sh)
## Explanation the task

- The script reads options using getopts.

- -n option enables printing line numbers.

- -v option enables inverted matching (print non-matching lines).

- After parsing options, the script expects a search string and a file.

- If missing arguments or if the file doesn't exist, it shows an error.

- It reads the file line-by-line, searching for the string (case-insensitive).

- If -v is active, the match result is inverted.

- It prints matching lines, optionally with line numbers.

# mygrep.sh 

- ├── 1. Basic Functionality
     - ├── Search for a text string inside a file
     - ├── Ignore case differences (case-insensitive)
     - └── Print lines containing the search string

- ├── 2. Option Support
     - ├── -n → Print line numbers with each match
     - ├── -v → Invert the match (print lines that "do not" contain the string)
     - └── Allow combining options (-vn or -nv)

- ├── 3. Error Handling
     - ├── If the file does not exist → Print an error message
     - ├── If input arguments are missing → Print an error message
     - └── Support --help → Show usage instructions

- ├── 4. Testing Examples
     - ├── ./mygrep.sh hello testfile.txt
     - ├── ./mygrep.sh -n hello testfile.txt
     - ├── ./mygrep.sh -vn hello testfile.txt
     - └── ./mygrep.sh -v testfile.txt → Should display a warning

- └── 5. Reflective Section
     - ├── Explain how the script processes the inputs and options
     - ├── If you wanted to add regex or additional options, describe how you would modify the script
     - └── What was the hardest part you faced and how you solved it



# mygrep.sh

A mini custom version of the `grep` command!

---

## 📚 Theoretical Section for Submission

### ✏️ 1. How the script processes inputs and options:

- The script starts by using `getopts` to parse options (`-n` or `-v`).
- Each option is stored in a Boolean variable (`true`/`false`) based on whether it's used.
- After parsing options, it uses `shift` to remove them from the arguments, leaving the search string and filename.
- If the user forgets the search string or filename → it prints an error message and shows usage instructions.
- If the specified file does not exist → it prints an error and exits.

---

### ✏️ 2. If we want to support regex or additional options (`-i`, `-c`, `-l`):

If I wanted to add support for more options like:

- `-i`: Ignore case sensitivity (already managed internally with `grep -i`).
- `-c`: Print the number of matching lines instead of the lines themselves.
- `-l`: Print the filename if any match is found.

I would do the following:

- Add new cases inside the `getopts` parsing.
- Create new Boolean variables like `count_only`, `list_only`.
- During output, either count matches or print the filename based on the active options.
- To support full regex instead of fixed string matching (`-F`), I would remove the `-F` option from the `grep` command.

---

### ✏️ 3. The hardest part during implementation:

The most challenging parts were:

- Handling combined options correctly (e.g., treating `-vn` and `-nv` identically).
- Implementing the inverted match logic (`-v`) correctly, flipping matches when needed.

To solve this, I carefully used Boolean flags (`true`/`false`) and structured conditions clearly.

---

## 🌟 Final Organized Submission Checklist:

- ✅ `mygrep.sh` script works correctly with options.
- ✅ Support for `--help` flag.
- ✅ Professional level option parsing using `getopts`.
- ✅ Explained input and option handling clearly.
- ✅ Described how to add regex and more options.
- ✅ Mentioned challenges and how they were handled.

---
---

# Q2 : Scenario
      
