(define (domain tripplanningexample34)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (required_start ?c - city ?d - day)
    (required_end ?c - city ?d - day)

    (visited_valencia_window)

    (final_day_reached)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?dnext)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d)
      (next ?d ?dnext)
      (direct ?from ?to)
      (not (required_start ?from ?d))
      (not (required_end ?from ?dnext))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action mark_valencia_window
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day day_10)
      (visited_valencia_window)
      (at florence)
      (not (final_day_reached))
    )
    :effect (final_day_reached)
  )
)