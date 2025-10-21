(define (domain travel-itinerary)
  (:requirements :typing :negative-preconditions :strips)
  (:types city day)

  (:predicates
    (assigned ?d - day ?c - city)        ; day ?d is assigned to city ?c
    (unassigned ?d - day)               ; day ?d has not yet been assigned
    (next ?d1 - day ?d2 - day)          ; temporal successor relation between days
    (adjacent ?from - city ?to - city)  ; direct-flight adjacency or allowed stay
    (is-first ?d - day)                 ; marks the first day of the trip
  )

  ;; Assign the first day to a city (no previous-day requirement)
  (:action assign-first-day
    :parameters (?d - day ?c - city)
    :precondition (and (is-first ?d) (unassigned ?d))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)))
  )

  ;; Assign a subsequent day to a city, requiring the previous day assigned and a valid transition
  (:action assign-next-day
    :parameters (?dprev - day ?d - day ?cprev - city ?c - city)
    :precondition (and
                    (next ?dprev ?d)
                    (assigned ?dprev ?cprev)
                    (unassigned ?d)
                    (adjacent ?cprev ?c)
                  )
    :effect (and
              (assigned ?d ?c)
              (not (unassigned ?d))
            )
  )
)