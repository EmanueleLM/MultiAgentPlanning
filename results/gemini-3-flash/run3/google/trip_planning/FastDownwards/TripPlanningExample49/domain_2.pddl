(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?s - step)
    (next_step ?s1 ?s2 - step)
    (flight ?c1 ?c2 - city)
    (can_stay_at ?d - day ?c - city)
  )

  ;; Move between cities. This action represents taking a direct flight.
  ;; Commuting does not advance the day; a day is spent using the spend_day action.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at_city ?from) (flight ?from ?to))
    :effect (and (not (at_city ?from)) (at_city ?to))
  )

  ;; Spend a full day in the current city.
  ;; This advances the timeline and the stay counter for that specific city.
  ;; If a stay_requirement exists (via can_stay_at), it must be respected.
  (:action spend_day
    :parameters (?c - city ?d - day ?nd - day ?s - step ?ns - step)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (stay_count ?c ?s)
      (next_step ?s ?ns)
      (can_stay_at ?d ?c)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (stay_count ?c ?s))
      (stay_count ?c ?ns)
    )
  )
)