(define (domain san_francisco_betty_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    time
    meet_stage
  )

  (:constants
    pacific_heights fishermans_wharf - location
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_13_ph_to_fw ?from_t - time ?to_t - time)
    (travel_12_fw_to_ph ?from_t - time ?to_t - time)
    (betty_available ?t - time)
    (meet_stage_current ?m - meet_stage)
    (meet_stage_next ?m1 - meet_stage ?m2 - meet_stage)
  )

  (:action wait_one_minute
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_pacific_heights_to_fishermans_wharf
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at pacific_heights)
      (current_time ?t1)
      (travel_13_ph_to_fw ?t1 ?t2)
    )
    :effect (and
      (not (at pacific_heights))
      (at fishermans_wharf)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_fishermans_wharf_to_pacific_heights
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at fishermans_wharf)
      (current_time ?t1)
      (travel_12_fw_to_ph ?t1 ?t2)
    )
    :effect (and
      (not (at fishermans_wharf))
      (at pacific_heights)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_betty_one_minute
    :parameters (?t1 - time ?t2 - time ?m1 - meet_stage ?m2 - meet_stage)
    :precondition (and
      (at fishermans_wharf)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (betty_available ?t1)
      (meet_stage_current ?m1)
      (meet_stage_next ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meet_stage_current ?m1))
      (meet_stage_current ?m2)
    )
  )
)