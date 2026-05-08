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

  ;; Stay in the current city for the day.
  ;; This action signifies that the entirety of day ?d is spent in city ?c.
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

  ;; Fly from one city to another.
  ;; In this planning abstraction, the travel day ?d counts as a visit day for BOTH the origin and destination cities.
  ;; This represents a day where the traveler is present in both locations (e.g., departing in the evening).
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day ?c_from - count ?nc_from - count ?c_to - count ?nc_to - count)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next_day ?d ?nd)
      (flight ?from ?to)
      (can_visit ?from ?d)
      (visit_count ?from ?c_from)
      (next_count ?c_from ?nc_from)
      (visit_count ?to ?c_to)
      (next_count ?c_to ?nc_to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (not (visit_count ?from ?c_from))
      (visit_count ?from ?nc_from)
      (not (visit_count ?to ?c_to))
      (visit_count ?to ?nc_to)
    )
  )
)