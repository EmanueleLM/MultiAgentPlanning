(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?a - agent ?l - loc ?t - time)
    (met_mary)
  )

  (:action move_us_to_nh
    :parameters (?t_from - time ?t_to - time)
    :precondition (and
      (next ?t_from ?t_to)
      (at traveler union_square ?t_from)
    )
    :effect (and
      (not (at traveler union_square ?t_from))
      (at traveler nob_hill ?t_to)
    )
  )

  (:action move_nh_to_us
    :parameters (?t_from - time ?t_to - time)
    :precondition (and
      (next ?t_from ?t_to)
      (at traveler nob_hill ?t_from)
    )
    :effect (and
      (not (at traveler nob_hill ?t_from))
      (at traveler union_square ?t_to)
    )
  )

  (:action wait_at
    :parameters (?loc - loc ?t_from - time ?t_to - time)
    :precondition (and
      (next ?t_from ?t_to)
      (at traveler ?loc ?t_from)
    )
    :effect (and
      (not (at traveler ?loc ?t_from))
      (at traveler ?loc ?t_to)
    )
  )

  ;; Meeting of 75 minutes = 5 contiguous 15-minute intervals.
  ;; Requires traveler and mary at nob_hill for a chain of 6 timepoints connected by 5 next links.
  (:action meet_mary_75min
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time)
    :precondition (and
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5)
      (at traveler nob_hill ?t0) (at traveler nob_hill ?t1) (at traveler nob_hill ?t2)
      (at traveler nob_hill ?t3) (at traveler nob_hill ?t4) (at traveler nob_hill ?t5)
      (at mary nob_hill ?t0) (at mary nob_hill ?t1) (at mary nob_hill ?t2)
      (at mary nob_hill ?t3) (at mary nob_hill ?t4) (at mary nob_hill ?t5)
    )
    :effect (and
      (met_mary)
    )
  )
)