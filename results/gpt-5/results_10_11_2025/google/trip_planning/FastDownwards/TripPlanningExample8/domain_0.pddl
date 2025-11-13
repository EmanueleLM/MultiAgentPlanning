(define (domain trip-16days)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city
  )
  (:predicates
    (next ?d - day ?e - day)           ; successor day relation
    (prev ?d - day ?p - day)           ; predecessor relation: prev(d,p) means p immediately precedes d
    (first ?d - day)                   ; marks the first day (day1)
    (must-athens ?d - day)             ; days that must be assigned to Athens (days 1..7)
    (edge ?c1 - city ?c2 - city)       ; direct-flight edge (bidirectional facts provided in problem)
    (assigned ?d - day)                ; day has been assigned a city
    (at ?d - day ?c - city)            ; city assigned to day
    (linked ?d - day)                  ; transition d->d+1 has been validated (stay or flight)
  )

  ; Assign the first day (must be Athens when must-athens holds)
  (:action assign-city-for-day-first-athens
    :parameters (?d - day)
    :precondition (and
      (first ?d)
      (must-athens ?d)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d athens)
    )
  )

  ; Assign any non-first day to Athens when that day is in the mandatory Athens block
  (:action assign-city-for-day-next-athens
    :parameters (?d - day ?p - day)
    :precondition (and
      (prev ?d ?p)
      (assigned ?p)
      (must-athens ?d)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d athens)
    )
  )

  ; Assign the first day to a non-Athens city (only allowed when the first day is not in the Athens-mandatory set)
  (:action assign-city-for-day-first
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (not (must-athens ?d))
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )

  ; Assign any non-first day to an arbitrary city when the day is not in the Athens-mandatory set
  (:action assign-city-for-day-next
    :parameters (?d - day ?p - day ?c - city)
    :precondition (and
      (prev ?d ?p)
      (assigned ?p)
      (not (must-athens ?d))
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )

  ; Validate the first transition (day1 -> day2) as a stay (same city)
  (:action stay-between-days-first
    :parameters (?d - day ?e - day ?c - city)
    :precondition (and
      (first ?d)
      (next ?d ?e)
      (assigned ?d)
      (assigned ?e)
      (at ?d ?c)
      (at ?e ?c)
      (not (linked ?d))
    )
    :effect (and
      (linked ?d)
    )
  )

  ; Validate a subsequent transition (d -> d+1) as a stay (same city), in order
  (:action stay-between-days-next
    :parameters (?d - day ?e - day ?p - day ?c - city)
    :precondition (and
      (prev ?d ?p)
      (linked ?p)
      (next ?d ?e)
      (assigned ?d)
      (assigned ?e)
      (at ?d ?c)
      (at ?e ?c)
      (not (linked ?d))
    )
    :effect (and
      (linked ?d)
    )
  )

  ; Validate the first transition (day1 -> day2) as a flight (different cities with a direct edge)
  (:action fly-between-days-first
    :parameters (?d - day ?e - day ?c1 - city ?c2 - city)
    :precondition (and
      (first ?d)
      (next ?d ?e)
      (assigned ?d)
      (assigned ?e)
      (at ?d ?c1)
      (at ?e ?c2)
      (edge ?c1 ?c2)   ; enforces direct-flight connectivity and c1 != c2
      (not (linked ?d))
    )
    :effect (and
      (linked ?d)
    )
  )

  ; Validate a subsequent transition (d -> d+1) as a flight (different cities with a direct edge), in order
  (:action fly-between-days-next
    :parameters (?d - day ?e - day ?p - day ?c1 - city ?c2 - city)
    :precondition (and
      (prev ?d ?p)
      (linked ?p)
      (next ?d ?e)
      (assigned ?d)
      (assigned ?e)
      (at ?d ?c1)
      (at ?e ?c2)
      (edge ?c1 ?c2)   ; enforces direct-flight connectivity and c1 != c2
      (not (linked ?d))
    )
    :effect (and
      (linked ?d)
    )
  )
)