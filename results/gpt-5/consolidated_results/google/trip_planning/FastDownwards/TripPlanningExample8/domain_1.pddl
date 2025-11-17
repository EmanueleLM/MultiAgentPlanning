(define (domain trip-16days)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city
  )
  (:predicates
    (next ?d - day ?e - day)           ; successor day relation
    (prev ?d - day ?p - day)           ; predecessor relation: prev(d,p) means p immediately precedes d
    (first ?d - day)                   ; marks the first day (day1)
    (must ?d - day ?c - city)          ; day d must be assigned to city c
    (edge ?c1 - city ?c2 - city)       ; direct-flight edge (bidirectional facts provided in problem)
    (assigned ?d - day)                ; day has been assigned a city
    (at ?d - day ?c - city)            ; city assigned to day
    (linked ?d - day)                  ; transition d->d+1 has been validated (stay or flight)
  )

  ; Assign the first day to the city mandated by (must day city)
  (:action assign-city-for-day-first-must
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (must ?d ?c)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )

  ; Assign any non-first day to the city mandated by (must day city)
  (:action assign-city-for-day-next-must
    :parameters (?d - day ?p - day ?c - city)
    :precondition (and
      (prev ?d ?p)
      (assigned ?p)
      (must ?d ?c)
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
    :effect (linked ?d)
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
    :effect (linked ?d)
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
    :effect (linked ?d)
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
    :effect (linked ?d)
  )
)