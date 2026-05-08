(define (domain tripplanningexample31)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    frankfurt reykjavik split - city
  )

  (:predicates
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct ?from - city ?to - city)

    (in_frankfurt_on ?d - day)
    (in_reykjavik_on ?d - day)
    (in_split_on ?d - day)

    (workshop_day ?d - day)
    (workshop_attended)

    (visited_frankfurt)
    (visited_reykjavik)
    (visited_split)
  )

  (:action stay_frankfurt
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (in_frankfurt_on ?d)
      (visited_frankfurt)
    )
  )

  (:action stay_reykjavik
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (not (workshop_day ?d))
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (in_reykjavik_on ?d)
      (visited_reykjavik)
    )
  )

  (:action stay_reykjavik_workshop
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (workshop_day ?d)
      (not (workshop_attended))
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (in_reykjavik_on ?d)
      (visited_reykjavik)
      (workshop_attended)
    )
  )

  (:action stay_split
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (in_split_on ?d)
      (visited_split)
    )
  )

  (:action fly_frankfurt_to_reykjavik
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (direct frankfurt reykjavik)
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at frankfurt))
      (at reykjavik)
    )
  )

  (:action fly_reykjavik_to_frankfurt
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (direct reykjavik frankfurt)
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at reykjavik))
      (at frankfurt)
    )
  )

  (:action fly_frankfurt_to_split
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (direct frankfurt split)
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at frankfurt))
      (at split)
    )
  )

  (:action fly_split_to_frankfurt
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (direct split frankfurt)
      (not (in_frankfurt_on ?d))
      (not (in_reykjavik_on ?d))
      (not (in_split_on ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at split))
      (at frankfurt)
    )
  )
)