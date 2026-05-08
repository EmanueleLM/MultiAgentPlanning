(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    ;; agent at a location at a given (named) time point
    (at ?a - agent ?loc - location ?t - time)
    ;; sparse temporal edges encoding possible transitions (travel or wait)
    (travel-edge ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait-edge ?t1 - time ?t2 - time)
    ;; James is available for a contiguous 15-min interval from ?t1 to ?t2
    (available-james ?t1 - time ?t2 - time)
    ;; goal flag: required meeting occurred
    (met)
  )

  ;; generic wait along a declared wait-edge (stay at same place and advance to the later time)
  (:action wait
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t1) (wait-edge ?t1 ?t2))
    :effect (and (not (at ?a ?loc ?t1)) (at ?a ?loc ?t2))
  )

  ;; travel along a declared travel-edge (direction-specific duration encoded by the edge)
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel-edge ?from ?to ?t1 ?t2))
    :effect (and (not (at ?a ?from ?t1)) (at ?a ?to ?t2))
  )

  ;; Meet James for a declared available interval (encoded as an available-james edge)
  ;; The action consumes that interval and sets the met flag.
  (:action meet-james
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at you marina ?t1) (available-james ?t1 ?t2))
    :effect (and
             (not (at you marina ?t1))
             (at you marina ?t2)
             (met))
  )
)