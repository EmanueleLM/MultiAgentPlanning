(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (first ?d - day)                         ; marks the first day of the trip
    (next ?d1 - day ?d2 - day)               ; consecutive-day relation
    (edge ?c1 - city ?c2 - city)             ; direct flight adjacency (both directions declared in problem)
    (unassigned ?d - day)                    ; day has not yet been assigned a city
    (assigned ?d - day ?c - city)            ; day is assigned to a city
    (visited ?c - city)                      ; city has been started (beginning of its contiguous block)
  )

  ;; Assign a city to the first day. This starts that city's contiguous block.
  (:action assign-start
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (unassigned ?d) (not (visited ?c)))
    :effect (and (assigned ?d ?c) (visited ?c) (not (unassigned ?d)))
  )

  ;; Continue staying in the same city from a previous day to the next day.
  (:action continue
    :parameters (?prev - day ?next - day ?c - city)
    :precondition (and (next ?prev ?next) (assigned ?prev ?c) (unassigned ?next))
    :effect (and (assigned ?next ?c) (not (unassigned ?next)))
  )

  ;; Travel to a new city on the next day via a direct flight (edge). The destination
  ;; must not have been visited before to enforce a single contiguous visit per city.
  (:action travel
    :parameters (?prev - day ?next - day ?from - city ?to - city)
    :precondition (and (next ?prev ?next) (assigned ?prev ?from) (edge ?from ?to) (unassigned ?next) (not (visited ?to)))
    :effect (and (assigned ?next ?to) (visited ?to) (not (unassigned ?next)))
  )
)