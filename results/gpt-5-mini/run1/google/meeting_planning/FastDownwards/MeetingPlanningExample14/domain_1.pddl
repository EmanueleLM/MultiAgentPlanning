(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (free ?a - agent ?t - time)
    (travel_link ?from - location ?to - location ?tfrom - time ?tto - time)
    (met-with-mary)
  )

  ;; Travel along an explicitly listed timed travel link.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?a ?from ?tfrom)
      (free ?a ?tfrom)
      (free ?a ?tto)
      (travel_link ?from ?to ?tfrom ?tto)
    )
    :effect (and
      (not (at ?a ?from ?tfrom))
      (at ?a ?to ?tto)
      (not (free ?a ?tfrom))
      (not (free ?a ?tto))
    )
  )

  ;; Stay at the same location for another named timepoint (used to model waiting/staying).
  (:action stay
    :parameters (?a - agent ?loc - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?a ?loc ?tfrom)
      (free ?a ?tto)
    )
    :effect (and
      (at ?a ?loc ?tto)
      (not (free ?a ?tto))
    )
  )

  ;; Meeting action: requires both agents co-located at the same two timepoints (two-hour meeting),
  ;; consumes those timepoints' free tokens and asserts meeting completion.
  (:action meet_mary
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?loc ?t1)
      (at mary ?loc ?t1)
      (at ?a ?loc ?t2)
      (at mary ?loc ?t2)
      (free ?a ?t1)
      (free ?a ?t2)
      (free mary ?t1)
      (free mary ?t2)
    )
    :effect (and
      (met-with-mary)
      (not (free ?a ?t1))
      (not (free ?a ?t2))
      (not (free mary ?t1))
      (not (free mary ?t2))
    )
  )
)