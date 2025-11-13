(define (domain meetingplanningexample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    ;; Agent occupancy at a discrete minute timepoint.
    (at ?loc - location ?t - time)

    ;; Directed travel edges whose durations are encoded by separate chain relations.
    (edge17 ?from - location ?to - location)   ;; takes 17 minutes
    (edge18 ?from - location ?to - location)   ;; takes 18 minutes

    ;; Static friend location.
    (person_at ?p - person ?loc - location)

    ;; Meeting achieved flag.
    (met ?p - person)

    ;; Immediate successor (t -> t+1).
    (succ ?t1 - time ?t2 - time)

    ;; Precomputed chained time relations encoding contiguous durations.
    (chain17 ?t1 - time ?t2 - time)   ;; t -> t+17 (contiguous travel block)
    (chain18 ?t1 - time ?t2 - time)   ;; t -> t+18 (contiguous travel block)
    (chain30 ?t1 - time ?t2 - time)   ;; t -> t+30 (contiguous 30-minute block)
    (chain30_avail ?t1 - time ?t2 - time) ;; 30-minute meeting block entirely inside availability
  )

  ;; Wait one minute: advance occupancy by one minute at the same location.
  ;; Enforces contiguous occupancy minute-by-minute for idle time.
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

  ;; Travel along a directed edge that takes exactly 17 minutes.
  ;; Agent is unavailable for other actions during the contiguous travel block.
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

  ;; Travel along a directed edge that takes exactly 18 minutes.
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
  ;; occupancy exactly at the meeting end time; it sets the met predicate to enforce the primary goal.
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