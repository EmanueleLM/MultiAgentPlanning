(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (day ?d - day)
    (count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (is_day_1 ?d - day)
    (is_day_6 ?d - day)
    (is_day_13 ?d - day)
    (is_stockholm ?c - city)
    (trip_done)
  )

  ;; Stay in the same city for a day.
  (:action stay
    :parameters (?d_curr - day ?d_next - day ?city - city ?c_old - count ?c_new - count)
    :precondition (and
      (day ?d_curr)
      (next_day ?d_curr ?d_next)
      (at ?city)
      (count ?city ?c_old)
      (next_count ?c_old ?c_new)
      ;; Conference constraints: if it's Day 1 or Day 6, the city must be Stockholm.
      (or (not (is_day_1 ?d_curr)) (is_stockholm ?city))
      (or (not (is_day_6 ?d_curr)) (is_stockholm ?city))
    )
    :effect (and
      (not (day ?d_curr))
      (day ?d_next)
      (not (count ?city ?c_old))
      (count ?city ?c_new)
    )
  )

  ;; Fly from one city to another, counting both cities for the day of travel.
  (:action fly
    :parameters (?d_curr - day ?d_next - day ?from - city ?to - city ?c_from_old - count ?c_from_new - count ?c_to_old - count ?c_to_new - count)
    :precondition (and
      (day ?d_curr)
      (next_day ?d_curr ?d_next)
      (at ?from)
      (flight ?from ?to)
      (count ?from ?c_from_old)
      (next_count ?c_from_old ?c_from_new)
      (count ?to ?c_to_old)
      (next_count ?c_to_old ?c_to_new)
      ;; Conference constraints: if it's Day 1 or Day 6, the starting city must be Stockholm.
      (or (not (is_day_1 ?d_curr)) (is_stockholm ?from))
      (or (not (is_day_6 ?d_curr)) (is_stockholm ?from))
    )
    :effect (and
      (not (day ?d_curr))
      (day ?d_next)
      (not (at ?from))
      (at ?to)
      (not (count ?from ?c_from_old))
      (count ?from ?c_from_new)
      (not (count ?to ?c_to_old))
      (count ?to ?c_to_new)
    )
  )

  ;; Final action to count the last day (Day 13).
  (:action complete
    :parameters (?d_curr - day ?city - city ?c_old - count ?c_new - count)
    :precondition (and
      (day ?d_curr)
      (at ?city)
      (is_day_13 ?d_curr)
      (count ?city ?c_old)
      (next_count ?c_old ?c_new)
      ;; Conference constraints applied to Day 13 if necessary.
      (or (not (is_day_1 ?d_curr)) (is_stockholm ?city))
      (or (not (is_day_6 ?d_curr)) (is_stockholm ?city))
    )
    :effect (and
      (not (count ?city ?c_old))
      (count ?city ?c_new)
      (trip_done)
    )
  )
)