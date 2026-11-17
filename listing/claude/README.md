# Claude connector listing

## Listing copy

**Name**

Wizeprep Study

**One-liner**

See what to study today, review your Wizeprep lessons, and practice with questions and flash cards in Claude.

**Description**

Connect your Wizeprep student account to see today’s study tasks and the courses you’re enrolled in. Explore a course outline, review lesson notes you have access to, and jump to the Wizeprep player to watch a lesson. Work through one available practice question at a time, or review the front and back of a flash card before saving your rating. You can also ask for a proposal to adjust your private study plan.

Course access and connection permissions determine what you can read and save. Course-wide progress, history, and insights are available in the Wizeprep course player. Section practice and applying plan proposals aren’t available yet. Claude.ai is for users aged 18 and older.

**Category**

Education. [Claude Marketplace’s education category](https://claude.com/marketplace/connectors-plugins?categories=education)

**Setup**

A Wizeprep student account with access to Study and a Claude account. Connect from the Connectors Directory, or add it as a custom connector using the [setup guide](../../README.md#claude). You choose the requested read and write permissions when you connect.

**Links**

[Setup and troubleshooting](../../README.md), [Privacy notice](https://www.wizeprep.com/v2/mcp/privacy), [Terms](https://www.wizeprep.com/v2/mcp/terms), [Wizeprep contact page](https://www.wizeprep.com/call-us)

- **TODO(Ryan)** Confirm the publisher identity, support email and URL, launch countries, and 13+ Wizeprep eligibility wording for each host. Claude.ai’s minimum age is 18.
- **TODO(Mike)** Confirm the live connector tool list and display titles, and capture the [listing screenshots](screenshots/README.md) after launch.

## Use cases

| Use case | Example prompt |
| --- | --- |
| Prioritize today’s work | “What’s on my Wizeprep study list today? Give me up to three priorities.” |
| Find a course and its lessons | “Which Wizeprep courses am I enrolled in? Show the outline for the course I pick.” |
| Review a lesson | “Summarize the notes for the lesson I just chose and show me the link.” |
| Practice at your own pace | “Give me one accessible standalone Wizeprep practice question. Wait for my answer before explaining it.” |
| Recall a flash card | “Show my Wizeprep decks. Once I choose one, show a card front and give me time to recall the answer.” |

## Tool table

Names and flags are from the Wizeprep Study registry snapshot. The registry does not publish titles yet. Titles below are proposed display text. The flags describe the snapshot, and the descriptions reflect the v1 scope. Confirm the titles, flags, and available tools from the live server before submitting the listing. [Claude connector checklist](https://claude.com/docs/connectors/building/review-criteria)

| Name | Proposed title | Read-only | Destructive | Open-world | What it does in v1 |
| --- | --- | --- | --- | --- | --- |
| `system_whoami` | View connection permissions | true | false | false | Shows what the connected account can read or save. |
| `today` | View today’s study list | true | false | false | Shows today’s private study tasks and private practice summary. |
| `schedule` | View study schedule | true | false | false | Reads the private study list for a date range. |
| `add_task` | Add a study task | false | false | false | Adds one task to the private study list. |
| `update_task` | Update a study task | false | false | false | Edits the date, title, or status of an existing private task. |
| `make_plan` | Generate private study tasks | false | false | false | Generates private study tasks from a dated goal and can refresh previously generated tasks. |
| `set_goal` | Manage a study goal | false | true | false | Adds, edits, or removes a dated private study goal. |
| `plan_proposal` | Propose study plan changes | true | false | false | Prepares proposed changes to a private study plan for review. |
| `find_course` | Find a catalog course | true | false | false | Finds published courses in Wizeprep’s catalog. |
| `add_course` | Add a course to study planning | false | false | false | Adds a course or the MCAT to the private planning list. |
| `remove_course` | Archive a planned course | false | true | false | Archives a course on the private planning list after confirmation. |
| `course_map` | View enrolled courses and outlines | true | false | false | Lists enrolled courses or opens the outline for a selected course package. |
| `open_lesson` | Open a lesson link | true | false | true | Returns lesson details and the Wizeprep player link. |
| `lesson_notes` | Read lesson notes | true | false | false | Reads notes from an accessible lesson. |
| `lesson_transcript` | Read a lesson transcript | true | false | false | Reads captions when the lesson has them and the account has full access. |
| `lesson_done` | Complete a private lesson task | false | false | false | Completes an existing private task for the lesson or points to the course player. |
| `search` | Search Wizeprep study materials | true | false | false | Searches authorized desk materials and the Wizeprep catalog. |
| `practice` | Start a practice question | false | false | false | Opens a private practice attempt or offers an accessible standalone course question. |
| `hint` | Show a practice hint | true | false | false | Returns an available hint for the current course question. |
| `swap_question` | Switch practice question | true | false | false | Requests another available question where supported. |
| `check_answer` | Check and save a practice answer | false | false | false | Checks the submitted answer and saves it when grading and saving are available. |
| `practice_review` | Review a private practice attempt | true | false | false | Retrieves the result of an answered private practice question. |
| `progress` | View private practice results | true | false | false | Shows results from private practice. Course-wide progress is in the course player. |
| `history` | View standalone question attempts | true | false | false | Reads attempts for one accessible standalone question. Course-wide history is in the course player. |
| `flashcard_decks` | List flash card decks | true | false | false | Lists Wizeprep flash card decks the student can open. |
| `flashcards_due` | Read or flip a flash card | true | false | false | Shows a card front or reveals its back after recall. |
| `flashcard_rate` | Save a flash card rating | false | false | false | Records the student’s rating for spaced review. |
| `desk_list` | List private study desk items | true | false | false | Lists the student’s saved study materials. |
| `desk_read` | Read a private study desk item | true | false | false | Opens one item the student can read. |
| `desk_save` | Save a private study desk item | false | false | false | Creates or edits a note, syllabus, practice set, or link on the student’s desk. |
| `desk_delete` | Remove a private study desk item | false | true | false | Removes a desk item after confirmation and deletes its uploaded file if present. |
| `desk_upload_link` | Create a study desk upload link | false | false | true | Creates a short-lived upload link for the signed-in owner. |

The snapshot also includes these names. Their v1 status is listed here to help verify the live tool scan.

| Name | Proposed title | Read-only | Destructive | Open-world | v1 status |
| --- | --- | --- | --- | --- | --- |
| `study_insights` | View course study insights | true | false | false | Held. Use the course player. |
| `apply_plan_changes` | Apply study plan changes | false | false | false | Held. Proposed changes can be reviewed. |
| `planner` | View course planner | true | false | false | Retired. The private study list uses `schedule`. |
| `planner_settings` | Edit course planner settings | false | false | false | Retired. Dated goals use `set_goal`. |
| `redistribute` | Redistribute course planner tasks | false | false | false | Retired. A proposed redistribution can be reviewed with `plan_proposal`. |
