(define (domain multi-city-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)                           ; be in city on a specific day
    (assigned ?d - day)                              ; day has been assigned to some city
    (slot-available ?s - slot ?c - city)             ; slot available for city (consumed when used)
    (agent-direct-flight ?from - city ?to - city)    ; direct flight exists between cities
    (day-next ?d - day ?dn - day)                    ; sequential day relation
    (day-first ?d - day)                             ; marks the first day (day 1)
  )

  ;; Assign a city to the first day by consuming one of its available slots
  (:action start-assign
    :parameters (?c - city ?d - day ?s - slot)
    :precondition (and
      (day-first ?d)
      (slot-available ?s ?c)
      (not (assigned ?d))
    )
    :effect (and
      (at ?c ?d)
      (assigned ?d)
      (not (slot-available ?s ?c))
    )
  )

  ;; Stay in the same city from day d to next day dn by consuming one slot for dn
  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?c ?d)
      (day-next ?d ?dn)
      (slot-available ?s ?c)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
      (not (slot-available ?s ?c))
    )
  )

  ;; Travel between cities via direct flight from day d to next day dn, consume a slot for destination
  (:action travel
    :parameters (?from - city ?to - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?from ?d)
      (agent-direct-flight ?from ?to)
      (day-next ?d ?dn)
      (slot-available ?s ?to)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?to ?dn)
      (assigned ?dn)
      (not (slot-available ?s ?to))
    )
  )
)