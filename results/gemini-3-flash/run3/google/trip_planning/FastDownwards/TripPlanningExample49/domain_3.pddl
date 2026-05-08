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

  ;; Spend a full day in the current city.
  ;; This advances the timeline and the stay counter for that specific city.
  (:action spend_day
    :parameters (?c - city ?d - day ?nd - day ?s - step ?ns - step)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (can_stay_at ?d ?c)
      (stay_count ?c ?s)
      (next_step ?s ?ns)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (stay_count ?c ?s))
      (stay_count ?c ?ns)
    )
  )

  ;; Fly between cities. In this model, commuting by flight represents a transition 
  ;; that counts as a stay day for both the origin and destination cities.
  ;; This interpretation resolves the mathematical inconsistency where 15 stay-days 
  ;; are required within a 13-day calendar window.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day ?sf - step ?nsf - step ?st - step ?nst - step)
    :precondition (and
      (at_city ?from)
      (flight ?from ?to)
      (current_day ?d)
      (next_day ?d ?nd)
      (can_stay_at ?d ?from)
      (can_stay_at ?d ?to)
      (stay_count ?from ?sf)
      (next_step ?sf ?nsf)
      (stay_count ?to ?st)
      (next_step ?st ?nst)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (not (stay_count ?from ?sf))
      (stay_count ?from ?nsf)
      (not (stay_count ?to ?st))
      (stay_count ?to ?nst)
    )
  )
)