(define (domain trip_planning_instance)
  (:requirements :typing :negative-preconditions :strips)
  (:types city day slot)

  (:predicates
    (next_day ?d1 - day ?d2 - day)        ; ordering of days (discrete time steps)
    (assigned ?d - day ?c - city)        ; day d is assigned to city c
    (day_assigned ?d - day)              ; day d has already been assigned (to some city)
    (flight ?from - city ?to - city)     ; direct flight exists from -> to
    (slot_of ?s - slot ?c - city)        ; slot s is a capacity token for city c (one token per requested day)
    (filled ?s - slot)                   ; slot s has been consumed (a day has been allocated to that city)
  )

  ;; Stay in the same city for the next day: consumes one destination-city slot and marks the next day assigned.
  (:action assign_stay
    :parameters (?d1 - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?d1 ?c)
      (next_day ?d1 ?d2)
      (not (day_assigned ?d2))
      (slot_of ?s ?c)
      (not (filled ?s))
    )
    :effect (and
      (assigned ?d2 ?c)
      (day_assigned ?d2)
      (filled ?s)
    )
  )

  ;; Fly between cities on consecutive days (only allowed when a direct flight exists): consumes one slot in the destination city.
  (:action assign_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?s - slot)
    :precondition (and
      (assigned ?d1 ?from)
      (next_day ?d1 ?d2)
      (not (day_assigned ?d2))
      (flight ?from ?to)
      (slot_of ?s ?to)
      (not (filled ?s))
    )
    :effect (and
      (assigned ?d2 ?to)
      (day_assigned ?d2)
      (filled ?s)
    )
  )
)