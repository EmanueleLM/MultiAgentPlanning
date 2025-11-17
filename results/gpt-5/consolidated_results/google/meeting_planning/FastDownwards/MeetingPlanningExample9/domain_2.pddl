(define (domain meeting-planning-example9)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint person level)
  (:constants
    union_square nob_hill - location
  )
  (:predicates
    (at ?l - location)
    (current ?t - timepoint)
    (add5 ?t1 - timepoint ?t2 - timepoint)
    (add7 ?t1 - timepoint ?t2 - timepoint)
    (add9 ?t1 - timepoint ?t2 - timepoint)
    (in_mary_window ?t - timepoint)
    (met ?m - level)
    (succ ?m1 - level ?m2 - level)
  )

  (:action wait_5
    :parameters (?t - timepoint ?t2 - timepoint)
    :precondition (and (current ?t) (add5 ?t ?t2))
    :effect (and (not (current ?t)) (current ?t2))
  )

  (:action move_union_square_to_nob_hill_9
    :parameters (?t - timepoint ?t2 - timepoint)
    :precondition (and (at union_square) (current ?t) (add9 ?t ?t2))
    :effect (and (not (at union_square)) (at nob_hill) (not (current ?t)) (current ?t2))
  )

  (:action move_nob_hill_to_union_square_7
    :parameters (?t - timepoint ?t2 - timepoint)
    :precondition (and (at nob_hill) (current ?t) (add7 ?t ?t2))
    :effect (and (not (at nob_hill)) (at union_square) (not (current ?t)) (current ?t2))
  )

  (:action meet_mary_5
    :parameters (?t - timepoint ?t2 - timepoint ?m - level ?n - level)
    :precondition (and
      (at nob_hill)
      (current ?t)
      (add5 ?t ?t2)
      (in_mary_window ?t)
      (in_mary_window ?t2)
      (met ?m)
      (succ ?m ?n)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (not (met ?m))
      (met ?n)
    )
  )
)