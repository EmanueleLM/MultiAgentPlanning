(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at_time ?a - agent ?l - location ?t - time)        ; agent located at location at time point
    (succ ?t1 - time ?t2 - time)                        ; immediate successor interval from ?t1 to ?t2
    (travel_edge ?from - location ?to - location)       ; directed travel allowed (duration encoded by succ links in problem)
    (joshua_available ?l - location ?t1 - time ?t2 - time) ; Joshua present at location for the exact interval ?t1->?t2
    (met_joshua)                                        ; goal predicate: Joshua has been met for required contiguous interval
  )

  ;; Idle/wait for a contiguous interval (consumes the interval from ?t1 to ?t2)
  (:action idle
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time ?a ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
    )
  )

  ;; Travel consumes a contiguous interval that must be a successor link; travel_edge encodes allowed route
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time ?a ?from ?t1)
      (succ ?t1 ?t2)
      (travel_edge ?from ?to)
    )
    :effect (and
      (not (at_time ?a ?from ?t1))
      (at_time ?a ?to ?t2)
    )
  )

  ;; Meet Joshua for a contiguous interval exactly matching an available interval
  ;; This enforces contiguous occupancy for the whole meeting interval and requires Joshua to be present exactly for that interval
  (:action meet-joshua
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time ?a ?loc ?t1)
      (succ ?t1 ?t2)
      (joshua_available ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
      (met_joshua)
    )
  )
)