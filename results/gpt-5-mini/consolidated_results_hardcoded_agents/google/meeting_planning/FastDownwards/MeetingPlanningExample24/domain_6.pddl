(define (domain meetingplanningexample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    (at ?loc - location ?t - time)                 ; agent location at time
    (connected ?from - location ?to - location)    ; directed connectivity (informational)
    (edge17 ?from - location ?to - location)       ; directed edge with 17-minute travel time
    (edge18 ?from - location ?to - location)       ; directed edge with 18-minute travel time
    (person_at ?p - person ?loc - location)        ; static person location
    (met ?p - person)                              ; meeting achieved
    (succ ?t1 - time ?t2 - time)                   ; immediate successor t1->t2 (1 minute)
    (chain17 ?t1 - time ?t2 - time)                ; t1 -> t2 is +17 minutes
    (chain18 ?t1 - time ?t2 - time)                ; t1 -> t2 is +18 minutes
    (chain30 ?t1 - time ?t2 - time)                ; t1 -> t2 is +30 minutes (contiguous occupancy)
    (chain30_avail ?t1 - time ?t2 - time)          ; 30-minute block fully inside availability window
  )

  ;; Wait one minute: advance occupancy at the same location by one time step.
  (:action wait
    :parameters (?loc - location ?t - time ?t1 - time)
    :precondition (and
      (at ?loc ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (not (at ?loc ?t))
      (at ?loc ?t1)
    )
  )

  ;; Move along a directed edge that takes exactly 17 minutes.
  (:action move_edge17
    :parameters (?from - location ?to - location ?t - time ?t17 - time)
    :precondition (and
      (at ?from ?t)
      (edge17 ?from ?to)
      (chain17 ?t ?t17)
    )
    :effect (and
      (not (at ?from ?t))
      (at ?to ?t17)
    )
  )

  ;; Move along a directed edge that takes exactly 18 minutes.
  (:action move_edge18
    :parameters (?from - location ?to - location ?t - time ?t18 - time)
    :precondition (and
      (at ?from ?t)
      (edge18 ?from ?to)
      (chain18 ?t ?t18)
    )
    :effect (and
      (not (at ?from ?t))
      (at ?to ?t18)
    )
  )

  ;; Meet a person for a contiguous 30-minute block fully inside their availability window.
  (:action meet_person_30
    :parameters (?p - person ?loc - location ?t - time ?t30 - time)
    :precondition (and
      (at ?loc ?t)
      (person_at ?p ?loc)
      (chain30 ?t ?t30)
      (chain30_avail ?t ?t30)
    )
    :effect (and
      (not (at ?loc ?t))
      (at ?loc ?t30)
      (met ?p)
    )
  )
)