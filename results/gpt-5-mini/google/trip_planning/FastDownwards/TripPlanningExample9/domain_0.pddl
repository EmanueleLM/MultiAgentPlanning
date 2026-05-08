(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                ; at city c at the end of day d
    (succ ?d1 - day ?d2 - day)            ; day successor (ordered days)
    (day-assigned ?d - day)               ; marks that an end-of-day location has been chosen
    (can-travel ?c1 - city ?c2 - city)    ; there exists an allowable same-day (possibly multi-leg) travel from c1 to c2
  )

  ; Stay in the same city from one day to the next (no flight required)
  (:action stay
    :parameters (?c - city ?dprev - day ?d - day)
    :precondition (and
      (at ?c ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
    )
    :effect (and
      (at ?c ?d)
      (day-assigned ?d)
    )
  )

  ; Move between cities from one day to the next. The transition is allowed only if (can-travel ?from ?to) holds.
  ; This encodes that inter-city moves use only allowed direct flights and may represent multi-leg same-day routing
  ; (where explicitly permitted by connectivity data).
  (:action move
    :parameters (?from - city ?to - city ?dprev - day ?d - day)
    :precondition (and
      (at ?from ?dprev)
      (succ ?dprev ?d)
      (not (day-assigned ?d))
      (can-travel ?from ?to)
    )
    :effect (and
      (at ?to ?d)
      (day-assigned ?d)
    )
  )

)