---
title: SDS Weekly Update - The Tale of Pranav
sub_title: April 5, 2024 (Last Week?? Already??)
author: Pranav
theme:
  override:
    execution_output:
      colors:
        background: black
---

The Tale of Pranav
===

# What I Did This Semester

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

Tasks and Key Learnings
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
- How to figure out what UI component is for what (thanks Mimis)
<!-- new_line -->
<!-- pause -->
- How to write RSpec tests
<!-- new_line -->
<!-- pause -->
- How to not blow up my computer by running the entire test suite every time (thanks Bruce).
<!-- new_line -->
<!-- pause -->
- Terminal slides!
<!-- end_slide -->

Meme of the Week
=== 

![](./figures/sds-update-2-2-24/meme.png)
<!-- end_slide -->

Tasks and Key Learnings
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

Tasks and Key Learnings
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

Tasks and Key Learnings
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

Meme of the Week
=== 

![](./figures/sds-update-4-5-24/1.png)

<!-- end_slide -->
Tasks and Key Learnings
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

## Demo 

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


Meme of the Week
===
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
<!-- pause -->
![](./figures/sds-update-3-15-24/2.png)
<!-- column: 1 -->
<!-- pause -->
![](./figures/sds-update-3-15-24/3.png)
<!-- end_slide -->

Tasks and Key Learnings
===
# Chapter 5: Hide Inactive Groups by Default on Submissions Page

## The Problem

<!-- pause -->
- A group in which all students are inactive is itself considered inactive.
<!-- new_line -->
<!-- pause -->
- When looking at submissions, inactive groups still show up despite not
  needing to be marked
<!-- pause -->
  - This is kinda annoying

<!-- pause -->
## The Solution
<!-- pause -->
- Hide inactive groups by default on the submissions page
<!-- pause -->
  - Add option to display them if need be

## The Method
<!-- pause -->
- ~Copy Bruce and Mimis' pull request from last semester line by line~ Critically analyze the
  frontend and backend to figure out a logical sequence of steps.
<!-- pause -->
  - I actually did try to do this on a whim
<!-- pause -->
  - It did not work.
<!-- pause -->
  - *shocked face*
<!-- new_line -->
<!-- pause -->
- Actually: had to understand how the code works, what changes were made, etc.
  - Thanks Bruce and Mimis!
<!-- end_slide -->

Tasks and Key Learnings
===
# Chapter 5: Hide Inactive Groups by Default on Submissions Page
## Challenges I Faced/What I Learned
<!-- pause -->
- More `Jest` testing
<!-- new_line -->
<!-- pause -->
- `React Table`
<!-- pause -->
  - The advantages and disadvantages of using external React components

<!-- pause -->
## Demo

<!-- end_slide -->

Tasks and Key Learnings
===
# Chapter 6: Hide Inactive Groups by Default on _Summary_ Page

<!-- pause -->
```
For line on previous slide:
    print line
```

<!-- pause -->
## OTHER Challenges

- React Table component on summary page not loaded during some tests
<!-- new_line -->
<!-- pause -->
- To demonstrate my frustration:
<!-- pause -->
  - Example of _passing_ test from `SubmissionsTable`:
<!-- pause -->

```typescript
it("initially contains the active group", () => {
    expect(screen.findByText("group_0002")).toBeInTheDocument();
});
```
<!-- pause -->
- Example of _failing_ test from `AssignmentsSummaryTable`:
<!-- pause -->

```typescript
it("initially contains the active group", () => {
    expect(screen.findByText("group_0002")).toBeInTheDocument();
});
```
<!-- pause -->
- *Distant screaming intensifies*
<!-- end_slide -->

Meme of the Week
===
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
<!-- pause -->
![](./figures/sds-update-4-5-24/3.png)
<!-- column: 1 -->
<!-- pause -->
![](./figures/sds-update-4-5-24/2.png)
<!-- end_slide -->

<!-- jump_to_middle -->
The End
===
