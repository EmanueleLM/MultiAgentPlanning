(define (domain travel-days)
  ; Domain models an 8-day city-by-day itinerary with direct flights only.
  ; Soft preferences (encoded as comments) and applied relaxations:
  ; - Desired stays (sum=10 > 8): Berlin 4, Munich 3, Dubrovnik 3.
  ; - Relaxation policy: reduce Dubrovnik first, then Munich, keeping Berlin at 4.
  ; - Applied relaxation: Berlin 4, Munich 3, Dubrovnik 1 (total = 8).
  ; - Max one flight per day: enforced by sequential day frontier and single assignment per day.
  ; - Direct flights only: enforced via connected predicate; no Berlin<->Dubrovnik edge.
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (at ?d - day ?c - city)            ; city assigned for a given day
    (next ?d - day ?d2 - day)          ; successor relation between days
    (connected ?c - city ?c2 - city)   ; direct-flight adjacency only
    (decided ?d - day)                 ; day has been assigned exactly one city
    (frontier ?d - day)                ; the latest assigned day; planning proceeds in order
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?c)
      (not (decided ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (decided ?d2)
      (not (frontier ?d))
      (frontier ?d2)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?from)
      (connected ?from ?to)   ; direct flight required
      (not (decided ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (decided ?d2)
      (not (frontier ?d))
      (frontier ?d2)
    )
  )
)