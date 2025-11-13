(define (domain meetingplanningexample9_strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person timepoint)
  (:predicates
    (at ?l - location)
    (time ?t - timepoint)
    (before-noon ?t - timepoint)
    (plus9 ?t1 ?t2 - timepoint)
    (plus7 ?t1 ?t2 - timepoint)
    (plus75 ?t1 ?t2 - timepoint)
    (start-ok ?t - timepoint)
    (met ?p - person)
    (friend-location ?p - person ?l - location)
  )

  (:action wait-until-noon
    :parameters (?t - timepoint)
    :precondition (and (time ?t) (before-noon ?t))
    :effect (and
      (not (time ?t))
      (time t720)
    )
  )

  (:action travel-union-to-nob
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (time ?t1)
      (at union_square)
      (plus9 ?t1 ?t2)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
      (not (at union_square))
      (at nob_hill)
    )
  )

  (:action travel-nob-to-union
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (time ?t1)
      (at nob_hill)
      (plus7 ?t1 ?t2)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
      (not (at nob_hill))
      (at union_square)
    )
  )

  (:action meet-mary-75
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (time ?t1)
      (at nob_hill)
      (friend-location mary nob_hill)
      (start-ok ?t1)
      (plus75 ?t1 ?t2)
      (not (met mary))
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
      (met mary)
    )
  )
)