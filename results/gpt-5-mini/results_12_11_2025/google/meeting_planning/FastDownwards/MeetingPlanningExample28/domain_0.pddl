(define (domain mapper)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent person location time)

  (:predicates
    (at_time ?a - agent ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (travel_allowed ?from - location ?to - location ?t1 - time ?t2 - time)
    (joshua_present ?loc - location ?t1 - time ?t2 - time)
    (met_joshua)
    (arrival0900_honored)
    (occupied_interval ?a - agent ?loc - location ?t1 - time ?t2 - time)
    (travel_record ?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
  )

  ;; Idle: remain at the same location across an explicitly enumerated contiguous time interval.
  (:action idle
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at_time ?a ?loc ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
      (occupied_interval ?a ?loc ?t1 ?t2)
    )
  )

  ;; Travel: move between two locations only if a directed travel record exists for that exact start/end time pair.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_time ?a ?from ?t1) (travel_allowed ?from ?to ?t1 ?t2) (succ ?t1 ?t2))
    :effect (and
      (not (at_time ?a ?from ?t1))
      (at_time ?a ?to ?t2)
      (travel_record ?a ?from ?to ?t1 ?t2)
    )
  )

  ;; Meet Joshua: only possible during an explicitly enumerated Joshua availability interval.
  ;; Meeting is modeled as occupying the full specified interval; the only allowed meeting interval
  ;; is one that has been provided as Joshua's availability (thereby enforcing the minimum duration).
  (:action meet-joshua
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at_time ?a ?loc ?t1) (joshua_present ?loc ?t1 ?t2) (succ ?t1 ?t2))
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
      (occupied_interval ?a ?loc ?t1 ?t2)
      (met_joshua)
    )
  )
)