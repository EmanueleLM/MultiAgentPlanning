(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (now ?t - time)
    (at ?loc - location ?t - time)
    (met-andrew)
    (reach8 ?t - time ?t2 - time)
    (reach15 ?t - time ?t2 - time)
    (reach30 ?t - time ?t2 - time)
    (reach60 ?t - time ?t2 - time)
    (reach22 ?t - time ?t2 - time)
    (reach24 ?t - time ?t2 - time)
    (reach105 ?t - time ?t2 - time)
  )

  (:action wait_60
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (reach60 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action wait_30
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (reach30 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action wait_15
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (reach15 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action wait_8
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and (now ?t) (at ?loc ?t) (reach8 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at ?loc ?t))
              (at ?loc ?t2)
            )
  )

  (:action travel_presidio_union
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (at presidio ?t) (reach22 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at presidio ?t))
              (at union_square ?t2)
            )
  )

  (:action travel_union_presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (at union_square ?t) (reach24 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (not (at union_square ?t))
              (at presidio ?t2)
            )
  )

  (:action meet_andrew_105
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (at union_square ?t) (reach105 ?t ?t2))
    :effect (and
              (not (now ?t))
              (now ?t2)
              (met-andrew)
            )
  )
)