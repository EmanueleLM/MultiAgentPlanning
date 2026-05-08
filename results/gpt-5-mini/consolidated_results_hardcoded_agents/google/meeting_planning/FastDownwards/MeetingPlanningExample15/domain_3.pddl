(define (domain MeetingPlanningExample15)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location ?t - time)                         ; agent at location at a given stage/time
    (next ?t1 - time ?t2 - time)                                   ; successor relation between stages
    (travel-allowed ?from - location ?to - location ?t1 - time ?t2 - time) ; allowed directional travel from t1 to t2
    (meeting-interval ?t1 - time ?t2 - time)                       ; declared contiguous interval satisfying John's availability and min duration
    (meeting-site ?l - location)                                   ; designated location where meeting with John can occur
    (met-john)                                                     ; goal predicate: meeting completed (>= minimum duration)
  )

  ;; Wait: advance along the explicit successor chain while staying at same location.
  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?l ?t1))
      (at ?a ?l ?t2)
    )
  )

  ;; Travel: use a direction-aware travel-allowed tuple to move from a specific start stage/time to the matching arrival stage/time.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from ?t1)
      (travel-allowed ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from ?t1))
      (at ?a ?to ?t2)
    )
  )

  ;; Meet: perform a contiguous meeting at a designated meeting-site that spans an explicitly declared meeting-interval.
  ;; The meeting-interval object is provided in the problem and guarantees John is present throughout [t1,t2] and that the interval meets the minimum duration.
  (:action meet
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l ?t1)
      (meeting-site ?l)
      (meeting-interval ?t1 ?t2)
      (not (met-john))
    )
    :effect (and
      (not (at ?a ?l ?t1))
      (at ?a ?l ?t2)
      (met-john)
    )
  )
)