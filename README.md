# Keleclient
Bloc Project Kele API Client

The purpose was to create a Ruby Gem API Client to access and use the student endpoints of the Bloc API.


*Retrieve Authorization*

```
$  irb or pry
>  require_relative 'lib/kele'
=> true
>  kele_client = Kele.new("email@example.com", "password")
```

*Retrieve the User's information as a Ruby hash*

```
>  kele_client.get_me
```

*Retrieve the current users Mentor's available time slots. `mentor_id` is listed from the previous step.*

```
> kele_client.get_mentor_availability(mentor_id)
```

*Retrieve the Roadmap for current user.*

```
>  kele_client.get_roadmap(roadmap_id)
```

*Retrieve checkpoints for current user.*

```
>  kele_client.get_checkpoint(checkpoint_id)
```

*Retrieve a list of messages, respond to an existing message, and create a new message thread.*

```
kele_client.get_messages        #returns all messages
kele_client.get_messages(1)     # returns the first page of message threads
```

*Submit a assignment completion for assignments*

```
kele_client.create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
```
checkpoint_id - The checkpoint ID retrieved from the get_checkpoint
assignment_branch - The Github branch for the assignment
assignment_commit_link - The GitHub commit link for the assignment
Comment - assignment submission comment
enrollment_id - The student's enrollment id - retrieved from the get_me

*Update an assignment*

```
kele_client.update_submission(checkpoint_submission_id, checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
```
checkpoint_submission_id - Retrieved when submitting an assignment in the response
checkpoint_id - The checkpoint ID retrieved from the get_checkpoint
assignment_branch - The Github branch for the assignment
assignment_commit_link - The GitHub commit link for the assignment
Comment - assignment submission comment
enrollment_id - The student's enrollment id - retrieved from the get_me