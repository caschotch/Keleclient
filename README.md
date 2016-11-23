# Keleclient
Bloc Project Kele API Client



Example usage to get auth_token

```
$  irb or pry
>  require_relative 'lib/kele'
=> true
>  kele_client = Kele.new("email@example.com", "password")
```

Retrieve the User's information as a Ruby hash

```
>  kele_client.get_me
```

Retrieve the current users Mentor's available time slots. `mentor_id` is listed from the previous step.

```
> kele_client.get_mentor_availability(mentor_id)
```

Retrieve the Roadmap for current user.

```
>  kele_client.get_roadmap(roadmap_id)
```

Retrieve checkpoints for current user.

```
>  kele_client.get_checkpoint(checkpoint_id)
```
