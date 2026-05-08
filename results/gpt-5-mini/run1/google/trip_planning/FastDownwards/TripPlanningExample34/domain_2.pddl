(define (domain trip_planning_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; city assignment for a specific day
    (assigned ?d - day)              ; day has been assigned
    (next ?d1 - day ?d2 - day)       ; day ordering
    (direct_flight ?c1 - city ?c2 - city) ; connectivity (direct flights)
    (is_first ?d - day)              ; marks the first day (start)
  )

  ;; set the city for the first day
  (:action start_day
    :parameters (?c - city ?d - day)
    :precondition (and (is_first ?d) (not (assigned ?d)))
    :effect (and (at ?c ?d) (assigned ?d))
  )

  ;; remain in the same city from day d to its successor dn
  (:action stay_next_day
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn) (not (assigned ?dn)))
    :effect (and (at ?c ?dn) (assigned ?dn))
  )

  ;; fly from ?from to ?to between consecutive days if a direct flight exists
  (:action fly_next_day
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (direct_flight ?from ?to) (next ?d ?dn) (not (assigned ?dn)))
    :effect (and (at ?to ?dn) (assigned ?dn))
  )
)