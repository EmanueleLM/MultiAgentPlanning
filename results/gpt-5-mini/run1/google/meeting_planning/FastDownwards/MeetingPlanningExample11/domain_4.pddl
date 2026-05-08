(define (domain meeting_planning_example11)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint)

  (:predicates
    (at ?loc - location ?t - timepoint)
    (wait_leg ?loc - location ?t1 - timepoint ?t2 - timepoint)
    (travel_leg ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (carol_present ?t - timepoint)
    (meet_window ?loc - location ?t1 - timepoint ?t2 - timepoint)
    (met_carol)
  )

  ;; Wait advances time while staying at the same location (models waiting/idle).
  (:action wait
    :parameters (?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?loc ?t1)
      (wait_leg ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  ;; Travel moves the agent from one location at an earlier timepoint to another location at a later timepoint.
  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from ?t1)
      (travel_leg ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Meet Carol: requires being at the same location at the meeting start time,
  ;; Carol present at both endpoints, and an explicit meet_window encoding a continuous meeting of sufficient length.
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
      ;; remain at the meeting location at the meeting end time
      (at ?loc ?t2)
    )
  )
)