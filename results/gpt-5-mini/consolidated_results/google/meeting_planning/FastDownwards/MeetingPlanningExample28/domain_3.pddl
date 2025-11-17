(define (domain meeting-planning)
  (:requirements :strips :typing)
  (:types agent location time)

  (:predicates
    (at_time ?a - agent ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (travel_allowed ?from - location ?to - location ?t1 - time ?t2 - time)
    (joshua_present ?loc - location ?t1 - time ?t2 - time)
    (met_joshua)
  )

  ;; Idle: advance the agent from one explicit time point to its successor.
  (:action idle
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at_time ?a ?loc ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
    )
  )

  ;; Travel: move between two locations when a matching travel_allowed (start,end) pair is present.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_time ?a ?from ?t1) (travel_allowed ?from ?to ?t1 ?t2))
    :effect (and
      (not (at_time ?a ?from ?t1))
      (at_time ?a ?to ?t2)
    )
  )

  ;; Meet Joshua: occupy an explicitly enumerated interval that is within Joshua's availability.
  (:action meet-joshua
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at_time ?a ?loc ?t1) (joshua_present ?loc ?t1 ?t2))
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
      (met_joshua)
    )
  )
)