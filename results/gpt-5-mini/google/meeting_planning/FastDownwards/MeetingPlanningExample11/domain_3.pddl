(define (domain meeting_planning_example11)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint)
  (:predicates
    (at ?loc - location ?t - timepoint)
    (carol_present ?t - timepoint)
    (met_carol)
    (travel_leg ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (meet_window ?loc - location ?t1 - timepoint ?t2 - timepoint)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from ?t1)
      (travel_leg ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (not (at ?to ?t1))
      (at ?to ?t2)
    )
  )

  (:action meet_carol
    :parameters (?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?loc ?t1)
      (carol_present ?t1)
      (carol_present ?t2)
      (meet_window ?loc ?t1 ?t2)
    )
    :effect (and
      (met_carol)
      (at ?loc ?t2)
    )
  )
)