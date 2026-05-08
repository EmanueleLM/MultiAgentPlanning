; trip-domain for FastDownward
; Reconciliation note: Agents requested stays sum to 11 days (Prague 3, Vienna 3, Porto 5) which exceeds the 9-day horizon.
; To produce a feasible plan meeting the workshop constraint (Prague on day 1-3) and direct-flight connectivity,
; I allocate: Prague 3 days, Vienna 3 days, Porto 3 days (total 9). This reduces Porto from 5 to 3 days — this is a conflict
; with porto_agent's hard request for 5 days. The conflict is flagged here; the PDDL below encodes the feasible allocation.
(define (domain trip-domain)
  (:requirements :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    ; basic objects
    (city ?c - city)
    (day ?d - day)

    ; temporal relation: next day
    (next ?d1 - day ?d2 - day)

    ; day assignment bookkeeping
    (free-day ?d - day)
    (assigned ?d - day)

    ; tokens to enforce city-day counts
    (available ?t - token)
    (token-of ?t - token ?c - city)

    ; location facts
    (at ?c - city ?d - day)

    ; direct flight connectivity (symmetric facts will be provided in problem)
    (direct-flight ?from - city ?to - city)

    ; Workshop requirement: must be scheduled by assigning Prague on day1..day3
    (window ?d - day)
    (workshop-scheduled)
  )

  ; --- Start-of-trip assignments (day1) ---
  (:action assign-start-prague
    :parameters (?t - token)
    :precondition (and (free-day day1) (available ?t) (token-of ?t prague))
    :effect (and
              (not (free-day day1))
              (not (available ?t))
              (at prague day1)
              (assigned day1)
              (workshop-scheduled)
            )
  )

  (:action assign-start-vienna
    :parameters (?t - token)
    :precondition (and (free-day day1) (available ?t) (token-of ?t vienna))
    :effect (and
              (not (free-day day1))
              (not (available ?t))
              (at vienna day1)
              (assigned day1)
            )
  )

  (:action assign-start-porto
    :parameters (?t - token)
    :precondition (and (free-day day1) (available ?t) (token-of ?t porto))
    :effect (and
              (not (free-day day1))
              (not (available ?t))
              (at porto day1)
              (assigned day1)
            )
  )

  ; --- Assign next day: staying in the same city (no flight) ---
  (:action assign-next-same
    :parameters (?prev - day ?d - day ?c - city ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at ?c ?prev)
                    (available ?t)
                    (token-of ?t ?c)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at ?c ?d)
              (assigned ?d)
            )
  )

  ; --- Assign next day: moving from a different city where a direct flight exists ---
  (:action assign-next-from-other
    :parameters (?prev - day ?d - day ?from - city ?c - city ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at ?from ?prev)
                    (not (at ?c ?prev))            ; ensures from != c
                    (direct-flight ?from ?c)
                    (available ?t)
                    (token-of ?t ?c)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at ?c ?d)
              (assigned ?d)
            )
  )

  ; --- Prague-specific variants that set workshop when assigning Prague on window days ---
  (:action assign-next-prague-window-same
    :parameters (?prev - day ?d - day ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (window ?d)
                    (free-day ?d)
                    (at prague ?prev)
                    (available ?t)
                    (token-of ?t prague)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at prague ?d)
              (assigned ?d)
              (workshop-scheduled)
            )
  )

  (:action assign-next-prague-window-from-other
    :parameters (?prev - day ?d - day ?from - city ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (window ?d)
                    (free-day ?d)
                    (at ?from ?prev)
                    (not (at prague ?prev))
                    (direct-flight ?from prague)
                    (available ?t)
                    (token-of ?t prague)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at prague ?d)
              (assigned ?d)
              (workshop-scheduled)
            )
  )

  ; Non-window Prague assignment (does not set workshop)
  (:action assign-next-prague-same
    :parameters (?prev - day ?d - day ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at prague ?prev)
                    (available ?t)
                    (token-of ?t prague)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at prague ?d)
              (assigned ?d)
            )
  )

  (:action assign-next-prague-from-other
    :parameters (?prev - day ?d - day ?from - city ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at ?from ?prev)
                    (not (at prague ?prev))
                    (direct-flight ?from prague)
                    (available ?t)
                    (token-of ?t prague)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at prague ?d)
              (assigned ?d)
            )
  )

  ; Vienna-target variants (no workshop effects required)
  (:action assign-next-vienna-same
    :parameters (?prev - day ?d - day ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at vienna ?prev)
                    (available ?t)
                    (token-of ?t vienna)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at vienna ?d)
              (assigned ?d)
            )
  )

  (:action assign-next-vienna-from-other
    :parameters (?prev - day ?d - day ?from - city ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at ?from ?prev)
                    (not (at vienna ?prev))
                    (direct-flight ?from vienna)
                    (available ?t)
                    (token-of ?t vienna)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at vienna ?d)
              (assigned ?d)
            )
  )

  ; Porto-target variants
  (:action assign-next-porto-same
    :parameters (?prev - day ?d - day ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at porto ?prev)
                    (available ?t)
                    (token-of ?t porto)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at porto ?d)
              (assigned ?d)
            )
  )

  (:action assign-next-porto-from-other
    :parameters (?prev - day ?d - day ?from - city ?t - token)
    :precondition (and
                    (next ?prev ?d)
                    (free-day ?d)
                    (at ?from ?prev)
                    (not (at porto ?prev))
                    (direct-flight ?from porto)
                    (available ?t)
                    (token-of ?t porto)
                  )
    :effect (and
              (not (free-day ?d))
              (not (available ?t))
              (at porto ?d)
              (assigned ?d)
            )
  )

)