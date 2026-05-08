(define (domain MeetingPlanningExample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    (at ?l - location ?t - time)                       ; agent is at location at a specific minute
    (connected ?from - location ?to - location)        ; directed connectivity
    (person_at ?p - person ?l - location)              ; person static location
    (met ?p - person)                                  ; person has been met
    (succ ?t1 - time ?t2 - time)                       ; immediate successor minute (t2 = t1 + 1)
    (chain17 ?t1 - time ?t2 - time)                    ; t2 = t1 + 17
    (chain18 ?t1 - time ?t2 - time)                    ; t2 = t1 + 18
    (chain30 ?t1 - time ?t2 - time)                    ; t2 = t1 + 30
    (chain30_avail ?t1 - time ?t2 - time)              ; t2 = t1 + 30 and all minutes t1..t1+29 are within availability window
  )

  ;; Wait one minute at a location: propagate presence from time t to t+1.
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

  ;; Directed move from NobHill to Presidio taking exactly 17 minutes.
  (:action move_nobhill_to_presidio
    :parameters (?t - time ?t17 - time)
    :precondition (and
      (at NobHill ?t)
      (connected NobHill Presidio)
      (chain17 ?t ?t17)
    )
    :effect (and
      (not (at NobHill ?t))
      (at Presidio ?t17)
    )
  )

  ;; Directed move from Presidio to NobHill taking exactly 18 minutes.
  (:action move_presidio_to_nobhill
    :parameters (?t - time ?t18 - time)
    :precondition (and
      (at Presidio ?t)
      (connected Presidio NobHill)
      (chain18 ?t ?t18)
    )
    :effect (and
      (not (at Presidio ?t))
      (at NobHill ?t18)
    )
  )

  ;; Meet Matthew at Presidio for a contiguous 30-minute block. The chain30_avail relation
  ;; ensures the chosen start time has the full 30-minute availability window for Matthew.
  (:action meet_matthew
    :parameters (?t - time ?t30 - time)
    :precondition (and
      (at Presidio ?t)
      (person_at Matthew Presidio)
      (chain30_avail ?t ?t30)
      (chain30 ?t ?t30)
    )
    :effect (and
      (not (at Presidio ?t))
      (at Presidio ?t30)
      (met Matthew)
    )
  )
)