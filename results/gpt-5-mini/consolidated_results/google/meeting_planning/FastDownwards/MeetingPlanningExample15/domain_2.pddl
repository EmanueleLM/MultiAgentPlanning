(define (domain MeetingPlanningExample15)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location ?t - time)               ; agent at location at a given stage/time
    (next ?t1 - time ?t2 - time)                         ; successor relation between stages
    (travel-allowed ?from - location ?to - location ?t1 - time ?t2 - time) ; allowed directional travel from t1 to t2
    (john-available ?t - time)                           ; John is present at Golden Gate Park at this stage/time
    (meeting-interval ?t1 - time ?t2 - time)             ; a contiguous interval [t1,t2] during which John is present and a meeting of required duration may occur
    (met-john)                                           ; goal predicate: meeting (>= minimum duration) completed
  )

  ;; Wait (stay) advancing from one explicit stage/time to its successor while remaining at the same location.
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

  ;; Travel along a direction-aware allowed link from a specific start stage/time to its corresponding arrival stage/time.
  ;; The travel-allowed predicate encodes the direction and the exact start->end pair that matches the known travel duration.
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

  ;; Perform a contiguous meeting that spans an explicitly declared meeting-interval [t1,t2].
  ;; The meeting-interval object in the problem encodes both John's availability over the whole interval and that the interval meets the minimum duration requirement (>= 90 minutes).
  ;; The action moves the agent from the interval start to the interval end while producing the met-john fluent.
  (:action meet
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l ?t1)
      (meeting-interval ?t1 ?t2)
      (john-available ?t1)
      (john-available ?t2)
      (not (met-john))
    )
    :effect (and
      (not (at ?a ?l ?t1))
      (at ?a ?l ?t2)
      (met-john)
    )
  )
)