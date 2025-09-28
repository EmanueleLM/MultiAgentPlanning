(define (domain trip_planning)
  (:requirements :typing :negative-preconditions)
  (:types agent city day slot)
  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (day-used ?d - day)
    (lyon-slot-filled ?s - slot)
    (buch-slot-filled ?s - slot)
    (manch-slot-filled ?s - slot)
    (window-day ?d - day)
    (relatives-visited)
  )

  (:action traveler_start
    :parameters (?a - agent ?c - city ?d - day)
    :effect (at ?a ?c ?d)
  )

  (:action traveler_stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (at ?a ?c ?d2)
  )

  (:action traveler_fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (at ?a ?to ?d2)
  )

  (:action fill_lyon_slot
    :parameters (?s - slot ?d - day ?a - agent)
    :precondition (and (at ?a lyon ?d) (not (day-used ?d)) (not (lyon-slot-filled ?s)))
    :effect (and (lyon-slot-filled ?s) (day-used ?d))
  )

  (:action fill_buch_slot
    :parameters (?s - slot ?d - day ?a - agent)
    :precondition (and (at ?a bucharest ?d) (not (day-used ?d)) (not (buch-slot-filled ?s)))
    :effect (and (buch-slot-filled ?s) (day-used ?d))
  )

  (:action fill_manch_slot
    :parameters (?s - slot ?d - day ?a - agent)
    :precondition (and (at ?a manchester ?d) (not (day-used ?d)) (not (manch-slot-filled ?s)))
    :effect (and (manch-slot-filled ?s) (day-used ?d))
  )

  (:action visit_relatives
    :parameters (?a - agent ?d - day)
    :precondition (and (at ?a lyon ?d) (window-day ?d))
    :effect (relatives-visited)
  )
)