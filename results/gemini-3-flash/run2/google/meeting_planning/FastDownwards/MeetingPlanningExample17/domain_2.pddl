(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time
  )
  (:constants
    alamo_square sunset_district - location
  )
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - time)
    (next_1 ?t1 ?t2 - time)
    (next_15 ?t1 ?t2 - time)
    (next_16 ?t1 ?t2 - time)
    (next_17 ?t1 ?t2 - time)
    (matthew_available ?t - time)
    (met_matthew)
  )

  (:action wait_1
    :parameters (?t_start - time ?t_end - time)
    :precondition (and (at_time ?t_start) (next_1 ?t_start ?t_end))
    :effect (and (not (at_time ?t_start)) (at_time ?t_end))
  )

  (:action move_as_to_sd
    :parameters (?t_start - time ?t_end - time)
    :precondition (and (at_loc alamo_square) (at_time ?t_start) (next_16 ?t_start ?t_end))
    :effect (and (not (at_loc alamo_square)) (at_loc sunset_district) (not (at_time ?t_start)) (at_time ?t_end))
  )

  (:action move_sd_to_as
    :parameters (?t_start - time ?t_end - time)
    :precondition (and (at_loc sunset_district) (at_time ?t_start) (next_17 ?t_start ?t_end))
    :effect (and (not (at_loc sunset_district)) (at_loc alamo_square) (not (at_time ?t_start)) (at_time ?t_end))
  )

  (:action meet_matthew
    :parameters (?t_start - time ?t_end - time)
    :precondition (and
      (at_loc sunset_district)
      (at_time ?t_start)
      (next_15 ?t_start ?t_end)
      (matthew_available ?t_start)
      (matthew_available ?t_end)
    )
    :effect (and
      (not (at_time ?t_start))
      (at_time ?t_end)
      (met_matthew)
    )
  )
)