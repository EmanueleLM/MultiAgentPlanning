(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (now ?t - time)
    (at ?loc - location ?t - time)
    (met-andrew)
    (succ60 ?t - time ?t2 - time)
    (succ30 ?t - time ?t2 - time)
    (succ15 ?t - time ?t2 - time)
    (succ8  ?t - time ?t2 - time)
    (succ22 ?t - time ?t2 - time)
    (succ24 ?t - time ?t2 - time)
    (succ105 ?t - time ?t2 - time)
  )

  ;; Waiting actions consume a specific allowed successor pair so durations are enforced structurally.
  (:action wait_60
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (succ60 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action wait_30
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (succ30 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action wait_15
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (succ15 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action wait_8
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (succ8 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  ;; Travel actions consume travel-specific successor facts so the travel durations are enforced exactly.
  (:action travel_presidio_union
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (at presidio ?t) (succ22 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at presidio ?t))
              (at union_square ?t2)
            )
  )

  (:action travel_union_presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (at union_square ?t) (succ24 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at union_square ?t))
              (at presidio ?t2)
            )
  )

  ;; Meeting action requires being at Union Square at a start time that is linked by succ105 to the exact end time.
  ;; This enforces contiguous occupancy for the full 105 minutes and also restricts meeting to pre-authorized start/end pairs.
  (:action meet_andrew_105
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (at union_square ?t) (succ105 ?t ?t2) (not (met-andrew)))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (met-andrew)
            )
  )
)