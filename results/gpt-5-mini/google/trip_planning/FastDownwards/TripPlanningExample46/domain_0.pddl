(define (domain jack_of_all_trades_trip)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day slot)
  (:predicates
    (flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (free_day ?d - day)
    (day_unallocated ?d - day)
    (slot_free ?s - slot)
    (filled ?s - slot)
    (slot_of ?s - slot ?c - city)
  )

  (:action stay_in_city
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2) (free_day ?d2))
    :effect (and (at ?c ?d2) (not (free_day ?d2)))
  )

  (:action fly_between_cities
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next_day ?d1 ?d2) (free_day ?d2) (flight ?from ?to))
    :effect (and (at ?to ?d2) (not (free_day ?d2)))
  )

  (:action fill_slot_with_day
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and (slot_of ?s ?c) (slot_free ?s) (at ?c ?d) (day_unallocated ?d))
    :effect (and (filled ?s) (not (slot_free ?s)) (not (day_unallocated ?d)))
  )
)