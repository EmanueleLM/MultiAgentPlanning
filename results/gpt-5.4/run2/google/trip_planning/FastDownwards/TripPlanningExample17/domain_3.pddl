(define (domain tripplanningexample17)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    segment
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current ?d - day ?c - city)

    (first_day ?s - segment ?d - day)
    (last_day ?s - segment ?d - day)
    (segment_city ?s - segment ?c - city)
    (segment_open ?s - segment)
    (segment_done ?s - segment)
    (next_segment ?s1 - segment ?s2 - segment)

    (day_used ?d - day)
  )

  (:action start_first_segment
    :parameters (?s - segment ?d - day ?c - city)
    :precondition (and
      (first_day ?s ?d)
      (segment_city ?s ?c)
      (segment_open ?s)
      (current ?d ?c)
      (not (day_used ?d))
    )
    :effect (and
      (day_used ?d)
      (segment_done ?s)
    )
  )

  (:action continue_segment
    :parameters (?s - segment ?d - day ?d2 - day ?c - city)
    :precondition (and
      (segment_city ?s ?c)
      (segment_open ?s)
      (segment_done ?s)
      (current ?d ?c)
      (next ?d ?d2)
      (not (last_day ?s ?d))
      (not (day_used ?d2))
    )
    :effect (and
      (not (current ?d ?c))
      (current ?d2 ?c)
      (day_used ?d2)
    )
  )

  (:action finish_segment_and_continue
    :parameters (?s1 - segment ?s2 - segment ?d - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
      (segment_city ?s1 ?c1)
      (segment_city ?s2 ?c2)
      (segment_open ?s1)
      (segment_done ?s1)
      (next_segment ?s1 ?s2)
      (current ?d ?c1)
      (last_day ?s1 ?d)
      (next ?d ?d2)
      (first_day ?s2 ?d2)
      (direct ?c1 ?c2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (segment_open ?s1))
      (segment_open ?s2)
      (not (current ?d ?c1))
      (current ?d2 ?c2)
      (day_used ?d2)
      (segment_done ?s2)
    )
  )
)