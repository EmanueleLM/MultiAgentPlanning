(define (domain trip_planning_example19)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited_nice_in_window)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition
      (and
        (current_day day1)
        (not (at brussels day1))
        (not (at valencia day1))
        (not (at nice day1))
      )
    :effect
      (and
        (at ?c day1)
        (visited_nice_in_window)
      )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next ?d1 ?d2)
        (at ?c ?d1)
        (not (at brussels ?d2))
        (not (at valencia ?d2))
        (not (at nice ?d2))
      )
    :effect
      (and
        (at ?c ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next ?d1 ?d2)
        (at ?from ?d1)
        (direct ?from ?to)
        (not (at brussels ?d2))
        (not (at valencia ?d2))
        (not (at nice ?d2))
      )
    :effect
      (and
        (at ?to ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action mark_nice_window_day1
    :parameters ()
    :precondition
      (and
        (at nice day1)
        (not (visited_nice_in_window))
      )
    :effect
      (visited_nice_in_window)
  )

  (:action mark_nice_window_day2
    :parameters ()
    :precondition
      (and
        (at nice day2)
        (not (visited_nice_in_window))
      )
    :effect
      (visited_nice_in_window)
  )

  (:action mark_nice_window_day3
    :parameters ()
    :precondition
      (and
        (at nice day3)
        (not (visited_nice_in_window))
      )
    :effect
      (visited_nice_in_window)
  )

  (:action mark_nice_window_day4
    :parameters ()
    :precondition
      (and
        (at nice day4)
        (not (visited_nice_in_window))
      )
    :effect
      (visited_nice_in_window)
  )

  (:action mark_nice_window_day5
    :parameters ()
    :precondition
      (and
        (at nice day5)
        (not (visited_nice_in_window))
      )
    :effect
      (visited_nice_in_window)
  )

  (:action mark_nice_window_day6
    :parameters ()
    :precondition
      (and
        (at nice day6)
        (not (visited_nice_in_window))
      )
    :effect
      (visited_nice_in_window)
  )
)