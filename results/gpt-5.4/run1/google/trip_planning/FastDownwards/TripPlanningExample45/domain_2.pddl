(define (domain trip_planning_example45)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day stay_len)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)

    (stay_length ?c - city ?l - stay_len)
    (remaining_after ?l1 - stay_len ?l2 - stay_len)
    (zero_len ?l - stay_len)

    (visited_lisbon)
    (visited_florence)
    (visited_copenhagen)

    (conf_day ?d - day)
    (required_at ?d - day ?c - city)
  )

  (:action stay_continue
    :parameters (?d1 - day ?d2 - day ?c - city ?l1 - stay_len ?l2 - stay_len)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (stay_length ?c ?l1)
      (remaining_after ?l1 ?l2)
      (not (zero_len ?l1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (stay_length ?c ?l1))
      (stay_length ?c ?l2)
    )
  )

  (:action stay_finish
    :parameters (?d1 - day ?d2 - day ?c - city ?l1 - stay_len ?l2 - stay_len)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (stay_length ?c ?l1)
      (remaining_after ?l1 ?l2)
      (zero_len ?l2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (stay_length ?c ?l1))
      (stay_length ?c ?l2)
      (visited_lisbon)
      (visited_florence)
      (visited_copenhagen)
    )
  )

  (:action fly_start
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?lto - stay_len)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (stay_length ?from ?lto)
      (zero_len ?lto)
      (stay_length ?to ?lto)
      (required_at ?d1 ?from)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )
)