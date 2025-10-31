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

  ;; Start in a city on day 1 (allows planner to choose start city)
  (:action traveler_start
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and)
    :effect (at ?a ?c ?d)
  )

  ;; Stay in same city from day d1 to next day d2
  (:action traveler_stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (at ?a ?c ?d2)
  )

  ;; Fly between cities using direct flights only (advances to next day)
  (:action traveler_fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (at ?a ?to ?d2)
  )

  ;; Fill a Lyon stay slot when the traveler is at Lyon on some unused day
  (:action fill_lyon_slot
    :parameters (?s - slot ?d - day ?a - agent)
    :precondition (and (at ?a lyon ?d) (not (day-used ?d)) (not (lyon-slot-filled ?s)))
    :effect (and (lyon-slot-filled ?s) (day-used ?d))
  )

  ;; Fill a Bucharest stay slot when the traveler is at Bucharest on some unused day
  (:action fill_buch_slot
    :parameters (?s - slot ?d - day ?a - agent)
    :precondition (and (at ?a bucharest ?d) (not (day-used ?d)) (not (buch-slot-filled ?s)))
    :effect (and (buch-slot-filled ?s) (day-used ?d))
  )

  ;; Fill a Manchester stay slot when the traveler is at Manchester on some unused day
  (:action fill_manch_slot
    :parameters (?s - slot ?d - day ?a - agent)
    :precondition (and (at ?a manchester ?d) (not (day-used ?d)) (not (manch-slot-filled ?s)))
    :effect (and (manch-slot-filled ?s) (day-used ?d))
  )

  ;; Visit relatives action must be executed while at Lyon on a day inside the relatives window
  (:action visit_relatives
    :parameters (?a - agent ?d - day)
    :precondition (and (at ?a lyon ?d) (window-day ?d))
    :effect (relatives-visited)
  )
)