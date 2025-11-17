(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (now ?t - time)
    (met-andrew)
    (succ ?t1 - time ?t2 - time)
    (delta22 ?t1 - time ?t2 - time)
    (delta24 ?t1 - time ?t2 - time)
    (delta105 ?t1 - time ?t2 - time)
    (valid_meeting_start ?t - time)
  )

  (:action wait_one_min
    :parameters (?t1 - time ?t2 - time ?loc - location)
    :precondition (and (now ?t1) (succ ?t1 ?t2) (at ?loc))
    :effect (and
              (not (now ?t1)) (now ?t2)
            )
  )

  (:action travel_presidio_union
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (delta22 ?t1 ?t2) (at presidio))
    :effect (and
              (not (now ?t1)) (now ?t2)
              (not (at presidio)) (at union_square)
            )
  )

  (:action travel_union_presidio
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (delta24 ?t1 ?t2) (at union_square))
    :effect (and
              (not (now ?t1)) (now ?t2)
              (not (at union_square)) (at presidio)
            )
  )

  (:action meet_andrew_105
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (delta105 ?t1 ?t2) (at union_square) (valid_meeting_start ?t1))
    :effect (and
              (not (now ?t1)) (now ?t2)
              (met-andrew)
            )
  )
)