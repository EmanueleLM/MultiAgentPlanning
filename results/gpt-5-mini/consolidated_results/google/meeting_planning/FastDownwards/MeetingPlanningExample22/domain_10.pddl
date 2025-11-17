(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (now ?t - time)
    (at ?loc - location ?t - time)
    (met-andrew)
    (is_presidio ?loc - location)
    (is_union_square ?loc - location)

    ;; successor relations encode allowed contiguous time progressions
    (succ60 ?t - time ?t2 - time)
    (succ30 ?t - time ?t2 - time)
    (succ15 ?t - time ?t2 - time)
    (succ8  ?t - time ?t2 - time)
    (succ22 ?t - time ?t2 - time)
    (succ24 ?t - time ?t2 - time)
    (succ105 ?t - time ?t2 - time)
  )

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

  (:action travel_presidio_union
    :parameters (?t - time ?t2 - time ?from - location ?to - location)
    :precondition (and (now ?t) (at ?from ?t) (succ22 ?t ?t2) (is_presidio ?from) (is_union_square ?to))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?from ?t))
              (at ?to ?t2)
            )
  )

  (:action travel_union_presidio
    :parameters (?t - time ?t2 - time ?from - location ?to - location)
    :precondition (and (now ?t) (at ?from ?t) (succ24 ?t ?t2) (is_union_square ?from) (is_presidio ?to))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?from ?t))
              (at ?to ?t2)
            )
  )

  (:action meet_andrew_105
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (succ105 ?t ?t2) (is_union_square ?loc) (not (met-andrew)))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (met-andrew)
            )
  )

)