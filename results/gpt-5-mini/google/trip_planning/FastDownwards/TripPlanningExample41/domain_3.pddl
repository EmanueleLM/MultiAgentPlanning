(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)            ;; presence of traveler in city on a day
    (next_day ?d1 - day ?d2 - day)    ;; temporal order
    (free_day ?d - day)               ;; day not yet assigned

    (flight ?from - city ?to - city)  ;; direct flight connectivity

    (slot_city ?s - slot ?c - city)   ;; slot belongs to a city (quota modeling)
    (slot_free ?s - slot)             ;; slot not yet consumed
    (slot_assigned ?s - slot ?d - day) ;; slot consumed for a specific day
  )

  ;; stay in same city on consecutive days, consume a city slot for the new day
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (free_day ?d2)
      (slot_city ?s ?c)
      (slot_free ?s)
    )
    :effect (and
      (at ?c ?d2)
      (slot_assigned ?s ?d2)
      (not (slot_free ?s))
      (not (free_day ?d2))
    )
  )

  ;; fly from one city to another on consecutive days, consume a slot of destination city
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?s - slot)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (flight ?from ?to)
      (free_day ?d2)
      (slot_city ?s ?to)
      (slot_free ?s)
    )
    :effect (and
      (at ?to ?d2)
      (slot_assigned ?s ?d2)
      (not (slot_free ?s))
      (not (free_day ?d2))
    )
  )
)