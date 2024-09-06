---
title: SDS Weekly Update
sub_title: May 17, 2024
author: Pranav
theme:
  override:
    execution_output:
      colors:
        background: black
---

Recap: Winter 2024
===

# What I Last Semester

<!-- pause -->

1. Refactored methods from `AnnotationCategoriesHelper` to appropriate class
   and scrapped redundant helper class.
<!-- new_line -->
<!-- pause -->
2. Complete test coverage in `CheckboxCriterion.create_or_update_csv_row`.
<!-- new_line -->
<!-- pause -->
3. Allow spreadsheet uploads to not be sensitive to `file extension`
<!-- new_line -->
<!-- pause -->
4. Allow TAs to `see starter files`
<!-- new_line -->
<!-- pause -->
5. Hide `inactive groups` in the `submissions table`
<!-- new_line -->
<!-- pause -->
6. Hide `inactive groups` in the `assignments summary table`

<!-- end_slide -->

Recap: Winter 2024
===

<!-- pause -->

# Chapter 1: Refactoring `AnnotationCategoriesHelper`

<!-- pause -->
## Recap

<!-- pause -->
- There was an unnecessary additional `helper class` that only had functions that
  could be better refactored to a `model`.
<!-- new_line -->
<!-- pause -->
- The functions had to do with computing JSON and CSV representations of
  information in the database.

<!-- pause -->
## What I/Aina Did

<!-- pause -->
Refactor it.

<!-- pause -->
## Key Learnings

<!-- pause -->

- How to navigate the Rails codebase
<!-- new_line -->
<!-- pause -->
- Environment set up
<!-- new_line -->
<!-- pause -->
- How to figure out what UI component is for what 
<!-- new_line -->
<!-- pause -->
- How to write RSpec tests
<!-- new_line -->
<!-- pause -->
- Terminal slides!
<!-- end_slide -->

Recap: Winter 2024
===
# Chapter 2: Complete Test Coverage for `CheckboxCriterion.create_or_update_csv_row`

<!-- pause -->
## Recap
<!-- pause -->
* There was a method in `CheckboxCriterion` that needed
  testing.

<!-- pause -->
## What I Did

<!-- pause -->
Test it.
<!-- pause -->

## Key Learnings

<!-- pause -->

- How to write tests: the sequel.
  - Mocking/stubbing

<!-- end_slide -->

Recap: Winter 2024
===

# Chapter 3: Allow spreadsheet uploads to not be sensitive to file extension
<!-- pause -->

## Recap
<!-- pause -->
* **User request:** if a form field is obviously only accepting a specific file
  type (e.g. CSV), assume any file being uploaded is of that type, regardless
  of its extension.
<!-- pause -->

## What I/Aina Did
* Modified the `process_file_upload` method by making it accept an argument denoting which filetype are allowed for this file upload.
<!-- new_line -->
<!-- pause -->
* Made `process_file_upload` not care about filetypes if only one allowed filetype was allowed
<!-- new_line -->
<!-- pause -->
* Added better `error handling` for the reading and parsing CSV files
<!-- new_line -->
<!-- pause -->
* Adjusted all instances of `process_file_upload` to make use of these change
<!-- new_line -->
<!-- pause -->
* Modified front-end inputs to use the `accept` attribute and "gently nudge" users into uploading the correct filetypes
<!-- new_line -->
<!-- pause -->
* Added `RSpec tests` for all of the above
<!-- end_slide -->

Recap: Winter 2024
===

# Chapter 3: Allow spreadsheet uploads to not be sensitive to file extension

## Key Learnings
<!-- pause -->
- How the Rails frontend works
<!-- new_line -->
<!-- pause -->
- More RSpec concepts
<!-- new_line -->
<!-- pause -->
  - File Fixtures
<!-- new_line -->
<!-- pause -->
- How to make memes about stressful situations
<!-- new_line -->
<!-- pause -->
- Patience
<!-- end_slide -->

Recap: Winter 2024
===

# Chapter 4: TAs See Starter Files
<!-- pause -->
## Recap
<!-- pause -->
- Assignments can have several sets of starter files
<!-- new_line -->
<!-- pause -->
- But TAs cannot see which starter files are assigned to which students
<!-- pause -->

## What I Did
<!-- pause -->
- Changed `Rails policies` to allow TAs to access starter-file related routes
<!-- new_line -->
<!-- pause -->
- Add a `read-only mode` to the Starter Files page of an assignment, which TAs
  would be able to access
<!-- new_line -->
<!-- pause -->
- Made `"Starter Files" tab visible` on TA assignment summary page
<!-- pause -->

## Demo 

```bash +exec
firefox-aurora http://localhost:3000/csc108/courses/1/assignments/4/starter_file
```

<!-- pause -->
## What I Learned
<!-- pause -->
- Rails `policies`
<!-- new_line -->
<!-- pause -->
- A substanstial amount about the structure of the `Markus frontend`
<!-- new_line -->
<!-- pause -->
- `Jest` testing
<!-- end_slide -->

Recap: Winter 2024
===
# Chapter 5 and 6: Hide Inactive Groups by Default on Submissions and Summary Pages

## The Problems

<!-- pause -->
- A group in which all students are inactive is itself considered inactive.
<!-- new_line -->
<!-- pause -->
- When looking at submissions/summary page, inactive groups still show up despite not
  needing to be marked
<!-- pause -->
  - This is kinda annoying

<!-- pause -->
## The Solution
<!-- pause -->
- Hide inactive groups by default on the submissions/summary page
<!-- pause -->
  - Add option to display them if need be

<!-- pause -->
## Demos
```bash +exec
firefox-aurora http://localhost:3000/csc108/courses/1/assignments/2/submissions/browse
```
<!-- pause -->

## Key Learnings
<!-- pause -->
```
For line in previous challenges:
    print line
```
<!-- end_slide -->

This Week
===
<!-- pause -->
## The Problem
<!-- pause -->
- Issue `#5401`: request to add a `progress bar` when you upload a file for slow internet connections

<!-- pause -->
## What I Did
<!-- pause -->
- Add progress bar using `ajax` and the `XMLHTTPRequest` API
<!-- pause -->
  - Thanks to David for providing very useful starter code
<!-- new_line -->
<!-- pause -->
- Write tests for the same
<!-- pause -->

## Code Walkthrough

<!-- pause -->
```bash +exec
firefox-aurora https://codepen.io/PerfectIsShit/pen/zogMXP
```
<!-- pause -->
```bash +exec
firefox-aurora http://localhost:3000/csc108/courses/1/assignments/4/submissions/file_manager
```
<!-- end_slide -->

This Week
===
<!-- pause -->
## What I Learned
<!-- new_line -->
<!-- pause -->
- `XMLHTTPRequest`'s APIs and how you can use it to keep track of file upload progress
<!-- new_line -->
<!-- pause -->
- A *LOT* about `mocking`
<!-- pause -->
  - Tests required extensive mocking so that I could focus on testing just the core functionality
<!-- new_line -->
<!-- pause -->
- Testing `compartmentalized React components`
<!-- pause -->
  - Strategy: test the `state` of the parent component and the associated
    `props` of the child component
<!-- pause -->

## Demo
```bash +exec
firefox-aurora http://localhost:3000/csc108/courses/1/assignments/4/submissions/file_manager
```

<!-- end_slide -->
<!-- jump_to_middle -->
The End
===
