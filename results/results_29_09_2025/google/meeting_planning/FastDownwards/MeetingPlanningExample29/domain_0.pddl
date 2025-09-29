(define (domain multiagent-meetings)
  (:requirements :strips :negative-preconditions :equality :fluents)
  (:types agent location person)

  (:predicates
    (at ?a - agent ?l - location)
    (met ?p - person)
  )

  (:functions
    (clock)          ; global clock in minutes since midnight
    (met-count)      ; number of friends met
  )

  ;; Traveler movement actions (distinct)
  (:action travel-traveler-sunset-to-haight
    :parameters ()
    :precondition (and
      (at traveler sunset)
    )
    :effect (and
      (not (at traveler sunset))
      (at traveler haight)
      (increase (clock) 15)
    )
  )

  (:action travel-traveler-haight-to-sunset
    :parameters ()
    :precondition (and
      (at traveler haight)
    )
    :effect (and
      (not (at traveler haight))
      (at traveler sunset)
      (increase (clock) 15)
    )
  )

  ;; Wait actions to reach critical times (explicit, not inventing arbitrary waits)
  (:action wait-to-1155
    :parameters ()
    :precondition (and
      (<= (clock) 1155)
    )
    :effect (and
      (assign (clock) 1155)
    )
  )

  (:action wait-to-1170
    :parameters ()
    :precondition (and
      (<= (clock) 1170)
    )
    :effect (and
      (assign (clock) 1170)
    )
  )

  ;; Nancy becomes available at start of her window (explicitly modeled)
  (:action nancy-start-availability
    :parameters ()
    :precondition (and
      (= (clock) 1170)   ; 19:30 in minutes since midnight
    )
    :effect (and
      (at nancy haight)
    )
  )

  ;; (Optional) Nancy leaves at the end of her window (keeps model consistent)
  (:action nancy-end-availability
    :parameters ()
    :precondition (and
      (= (clock) 1305)   ; 21:45 in minutes since midnight
      (at nancy haight)
    )
    :effect (and
      (not (at nancy haight))
    )
  )

  ;; Meeting action distinct for the traveler meeting Nancy
  ;; Enforces start exactly at earliest feasible time (1170) as a hard constraint
  ;; and enforces minimum meeting duration of 75 minutes.
  (:action meet-nancy
    :parameters ()
    :precondition (and
      (at traveler haight)
      (at nancy haight)
      (= (clock) 1170)                 ; meeting must start at 19:30 (earliest feasible)
      (<= (+ (clock) 75) 1305)        ; meeting must finish no later than 21:45
    )
    :effect (and
      (met nancy)
      (increase (met-count) 1)
      (increase (clock) 75)           ; meeting duration = 75 minutes (Nancy's minimum)
    )
  )
)