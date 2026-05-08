(define (domain meeting_planning_example11)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint)

  (:predicates
    ;; Agent location at a discrete timepoint
    (at ?loc - location ?t - timepoint)

    ;; Allowed waiting (staying at same location) between two timepoints
    (wait_leg ?loc - location ?t1 - timepoint ?t2 - timepoint)

    ;; Allowed travel leg between locations represented as a (start,end) pair of timepoints
    (travel_leg ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)

    ;; Carol is present at the given timepoint (discrete sampling of her availability)
    (carol_present ?t - timepoint)

    ;; There is a continuous meeting window at location between two timepoints (encodes required meeting duration)
    (meet_window ?loc - location ?t1 - timepoint ?t2 - timepoint)

    ;; Goal predicate: traveler met Carol for at least the required continuous window
    (met_carol)
  )

  ;; Wait: advance from an earlier timepoint to a later timepoint while remaining at the same location.
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

  ;; Travel: move from one location at time t1 to another location at time t2 (t2 is later than t1).
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

  ;; Meet Carol: requires the agent to be at the meeting location at the meeting start,
  ;; Carol to be present at the endpoints, and an explicit meet_window encoding required continuous duration.
  ;; The action advances the agent in time to the meeting end.
  (:action meet_carol
    :parameters (?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?loc ?t1)
      (carol_present ?t1)
      (carol_present ?t2)
      (meet_window ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met_carol)
    )
  )
)