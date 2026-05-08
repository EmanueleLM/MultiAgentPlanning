(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?a - agent ?l - loc ?t - time)
    (met_mary)
  )

  ;; Travel actions for the traveler between the two explicit locations.
  ;; Each travel consumes one discrete time slot (one next step).
  (:action travel_us_to_nh
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at traveler union_square ?t0)
      (next ?t0 ?t1)
      ;; Ensure we do not create conflicting presence at the arrival time
      (not (at traveler union_square ?t1))
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
      (not (at traveler nob_hill ?t1))
      (not (at traveler union_square ?t1))
    )
    :effect (and
      (not (at traveler nob_hill ?t0))
      (at traveler union_square ?t1)
    )
  )

  ;; Waiting/staying in place for one time slot.
  ;; Separate actions per location to prevent being at two places at the same time (explicit checks).
  (:action wait_at_union_square
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at traveler union_square ?t0)
      (next ?t0 ?t1)
      (not (at traveler union_square ?t1))
      ;; Prevent producing a union_square presence at ?t1 if traveler is already at nob_hill at ?t1
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
      (not (at traveler nob_hill ?t1))
      (not (at traveler union_square ?t1))
    )
    :effect (and
      (at traveler nob_hill ?t1)
    )
  )

  ;; Start a contiguous 75-minute meeting (five contiguous 15-min slots).
  ;; This action is specific to the traveler and Mary and enforces Mary's presence at Nob Hill.
  (:action start_meeting_traveler_mary_75min
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time)
    :precondition (and
      ;; contiguous slots
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      ;; both present at Nob Hill for each slot
      (at traveler nob_hill ?t0) (at mary nob_hill ?t0)
      (at traveler nob_hill ?t1) (at mary nob_hill ?t1)
      (at traveler nob_hill ?t2) (at mary nob_hill ?t2)
      (at traveler nob_hill ?t3) (at mary nob_hill ?t3)
      (at traveler nob_hill ?t4) (at mary nob_hill ?t4)
    )
    :effect (and
      (met_mary)
    )
  )
)