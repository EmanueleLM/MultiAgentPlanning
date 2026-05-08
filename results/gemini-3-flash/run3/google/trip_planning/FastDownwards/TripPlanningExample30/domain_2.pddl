(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (conn ?c1 ?c2 - city)
    (can_stay ?c - city ?d - day)
  )

  ;; Travel between cities. Does not advance the day or change stay counts.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (conn ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Spend a day in a city. Advances the day and the city's stay counter.
  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (stay_count ?c ?n)
      (next_count ?n ?nn)
      (can_stay ?c ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (stay_count ?c ?n))
      (stay_count ?c ?nn)
    )
  )
)