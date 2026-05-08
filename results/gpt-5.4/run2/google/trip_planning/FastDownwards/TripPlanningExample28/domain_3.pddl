(define (domain tripplanningexample28)
  (:requirements :strips :typing)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d ?d_next - day)
    (current_day ?d - day)

    (visited_on ?c - city ?d - day)

    (need_visit ?c - city ?d - day)

    (total_day ?d - day)
    (trip_complete)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next))
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_on ?c ?d))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next_day ?d ?d_next)
      (direct_flight ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d_next))
  )

  (:action finish
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (total_day ?d)
      (need_visit venice day_1)
      (visited_on venice day_1)
      (need_visit venice day_2)
      (visited_on venice day_2)
      (need_visit venice day_3)
      (visited_on venice day_3)
      (need_visit venice day_4)
      (visited_on venice day_4)
      (need_visit venice day_5)
      (visited_on venice day_5)
      (need_visit venice day_6)
      (visited_on venice day_6)

      (need_visit florence day_7)
      (visited_on florence day_7)
      (need_visit florence day_8)
      (visited_on florence day_8)
      (need_visit florence day_9)
      (visited_on florence day_9)
      (need_visit florence day_10)
      (visited_on florence day_10)
      (need_visit florence day_11)
      (visited_on florence day_11)
      (need_visit florence day_12)
      (visited_on florence day_12)

      (need_visit zurich day_6)
      (visited_on zurich day_6)
      (need_visit zurich day_7)
      (visited_on zurich day_7))
    :effect (trip_complete)
  )
)