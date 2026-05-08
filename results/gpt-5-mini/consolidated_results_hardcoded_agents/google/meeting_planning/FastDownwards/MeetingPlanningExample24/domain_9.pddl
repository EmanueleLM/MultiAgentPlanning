(define (domain meetingplanningexample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    (at ?loc - location ?t - time)                 ; agent located at a specific minute timepoint
    (edge17 ?from - location ?to - location)       ; directed edge taking 17 minutes
    (edge18 ?from - location ?to - location)       ; directed edge taking 18 minutes
    (person_at ?p - person ?loc - location)        ; static person location
    (met ?p - person)                              ; meeting achieved
    (succ ?t1 - time ?t2 - time)                   ; immediate successor (t -> t+1)
    (chain17 ?t1 - time ?t2 - time)                ; t -> t+17
    (chain18 ?t1 - time ?t2 - time)                ; t -> t+18
    (chain30 ?t1 - time ?t2 - time)                ; t -> t+30 contiguous block
    (chain30_avail ?t1 - time ?t2 - time)          ; 30-minute meeting block fully inside availability
  )

  ;; Wait one minute at the same location: advance occupancy by one minute.
  ;; This enforces contiguous occupancy minute-by-minute; waiting is only permitted
  ;; when the agent is physically at the location at the previous minute.
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
  ;; Uses chain17 to enforce exact, contiguous travel duration; agent is not available
  ;; at intermediate minute timepoints for other actions.
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
  ;; The meet action consumes the agent's occupancy at the meeting start time and re-establishes
  ;; occupancy exactly at the meeting end time. Meeting is only possible if the person is located
  ;; at the same meeting location and the 30-minute block is within the availability window.
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