(define (domain trip_planning_example43)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_day ?c - city ?d - day)
    (meeting_done)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at dublin))
      (not (at porto))
      (not (at venice))
    )
    :effect (and
      (at ?c)
      (visited_day ?c day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_day dublin ?d2))
      (not (visited_day porto ?d2))
      (not (visited_day venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited_day dublin ?d2))
      (not (visited_day porto ?d2))
      (not (visited_day venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_day ?to ?d2)
    )
  )

  (:action meet_friends_day1
    :parameters ()
    :precondition (and
      (current_day day1)
      (at venice)
      (visited_day venice day1)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )

  (:action meet_friends_day2
    :parameters ()
    :precondition (and
      (current_day day2)
      (at venice)
      (visited_day venice day2)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )

  (:action meet_friends_day3
    :parameters ()
    :precondition (and
      (current_day day3)
      (at venice)
      (visited_day venice day3)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )

  (:action meet_friends_day4
    :parameters ()
    :precondition (and
      (current_day day4)
      (at venice)
      (visited_day venice day4)
      (not (meeting_done))
    )
    :effect (meeting_done)
  )
)