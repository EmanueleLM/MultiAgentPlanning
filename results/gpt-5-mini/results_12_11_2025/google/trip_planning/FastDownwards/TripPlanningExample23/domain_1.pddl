(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day ?d - day)
    (city ?c - city)
    (next ?d1 - day ?d2 - day)             ; consecutive day relation
    (edge ?c1 - city ?c2 - city)           ; direct flight adjacency (undirected encoded by two facts)
    (unassigned ?d - day)                  ; day has not yet been assigned a city
    (assigned ?d - day ?c - city)          ; day is assigned to a city
    (visited ?c - city)                    ; city has already been visited (start of its contiguous block)
  )

  ; Assign the city for the very first day (d1). The city must not have been visited yet.
  (:action assign-first
    :parameters (?c - city)
    :precondition (and (unassigned d1) (not (visited ?c)))
    :effect (and (assigned d1 ?c) (visited ?c) (not (unassigned d1)))
  )

  ; Continue staying in the same city from a previous day to the next day.
  (:action continue
    :parameters (?prev - day ?next - day ?c - city)
    :precondition (and (next ?prev ?next) (assigned ?prev ?c) (unassigned ?next))
    :effect (and (assigned ?next ?c) (not (unassigned ?next)))
  )

  ; Travel to a new city on the next day: requires a direct edge and that the destination city has not been visited before.
  (:action travel
    :parameters (?prev - day ?next - day ?from - city ?to - city)
    :precondition (and (next ?prev ?next) (assigned ?prev ?from) (unassigned ?next) (edge ?from ?to) (not (visited ?to)))
    :effect (and (assigned ?next ?to) (visited ?to) (not (unassigned ?next)))
  )
)