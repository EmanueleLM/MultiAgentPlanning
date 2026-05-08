(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at_time ?a - agent ?loc - location ?t - time)        ; agent is at loc at discrete stage t
    (succ ?t1 - time ?t2 - time)                          ; ordering of discrete stages (t1 < t2)
    (travel_edge ?from - location ?to - location)         ; allowed directed travel link
    (joshua_present ?loc - location ?t1 - time ?t2 - time); Joshua present for the exact interval [t1,t2]
    (met_joshua)                                          ; goal marker: Joshua met
  )

  ;; Idle: advance the agent from one stage to its successor (contiguous occupancy)
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

  ;; Travel: traverse an allowed directed edge exactly between the specified ordered stage pair
  ;; (The concrete duration is enforced by which succ pairs are provided in the problem instance.)
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

  ;; Meet Joshua: occupy the specified contiguous interval; requires Joshua present for that exact interval.
  ;; Meeting occupies the agent continuously from t1 to t2 and sets the goal marker.
  (:action meet-joshua
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time ?a ?loc ?t1)
      (succ ?t1 ?t2)
      (joshua_present ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at_time ?a ?loc ?t1))
      (at_time ?a ?loc ?t2)
      (met_joshua)
    )
  )
)