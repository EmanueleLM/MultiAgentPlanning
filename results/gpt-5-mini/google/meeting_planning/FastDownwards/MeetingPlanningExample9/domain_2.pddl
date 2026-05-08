(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?a - agent ?l - loc ?t - time)
    (met_mary)
  )

  (:action travel_us_to_nh
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at traveler union_square ?t0)
      (next ?t0 ?t1)
      (not (at traveler nob_hill ?t1))
    )
    :effect (and
      (not (at traveler union_square ?t0))
      (at traveler nob_hill ?t1)
    )
  )

  (:action travel_nh_to_us
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at traveler nob_hill ?t0)
      (next ?t0 ?t1)
      (not (at traveler union_square ?t1))
    )
    :effect (and
      (not (at traveler nob_hill ?t0))
      (at traveler union_square ?t1)
    )
  )

  (:action wait_at_union_square
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at traveler union_square ?t0)
      (next ?t0 ?t1)
      (not (at traveler nob_hill ?t1))
    )
    :effect (and
      (at traveler union_square ?t1)
    )
  )

  (:action wait_at_nob_hill
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at traveler nob_hill ?t0)
      (next ?t0 ?t1)
      (not (at traveler union_square ?t1))
    )
    :effect (and
      (at traveler nob_hill ?t1)
    )
  )

  (:action start_meeting_traveler_mary_75min
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time)
    :precondition (and
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (at traveler nob_hill ?t0) (at traveler nob_hill ?t1)
      (at traveler nob_hill ?t2) (at traveler nob_hill ?t3) (at traveler nob_hill ?t4)
      (at mary nob_hill ?t0) (at mary nob_hill ?t1)
      (at mary nob_hill ?t2) (at mary nob_hill ?t3) (at mary nob_hill ?t4)
    )
    :effect (and
      (met_mary)
    )
  )
)