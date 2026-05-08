(define (domain trip_planning_example_6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_visit ?c - city ?d - day)
    (flight ?c1 ?c2 - city)
  )

  ;; Stay in the current city for the day, increment its visit count, and move to the next day.
  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?count - count ?ncount - count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (visit_count ?c ?count)
      (next_count ?count ?ncount)
      (can_visit ?c ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (visit_count ?c ?count))
      (visit_count ?c ?ncount)
    )
  )

  ;; Spend the current day in the current city (incrementing its count), then fly to a new city for the start of the next day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day ?count - count ?ncount - count)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next_day ?d ?nd)
      (visit_count ?from ?count)
      (next_count ?count ?ncount)
      (flight ?from ?to)
      (can_visit ?from ?d)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (not (visit_count ?from ?count))
      (visit_count ?from ?ncount)
    )
  )
)