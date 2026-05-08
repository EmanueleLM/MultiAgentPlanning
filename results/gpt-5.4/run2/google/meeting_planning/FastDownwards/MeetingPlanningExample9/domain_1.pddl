(define (domain san_francisco_meet_mary)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:constants
    mary - person
    union_square nob_hill - location
    t_12_00_pm t_1_15_pm - timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (can_travel ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?t - timepoint)
    (meeting_started ?p - person)
    (must_continue_meeting ?p - person)
    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (must_continue_meeting mary))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (can_travel ?from ?to ?depart ?arrive)
      (not (must_continue_meeting mary))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_mary
    :parameters ()
    :precondition (and
      (at nob_hill)
      (current_time t_12_00_pm)
      (available mary t_12_00_pm)
      (not (meeting_started mary))
      (not (met_minimum mary))
      (not (must_continue_meeting mary))
    )
    :effect (and
      (meeting_started mary)
      (must_continue_meeting mary)
    )
  )

  (:action continue_meeting_mary
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at nob_hill)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_started mary)
      (must_continue_meeting mary)
      (available mary ?t1)
      (available mary ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action finish_meeting_mary
    :parameters ()
    :precondition (and
      (at nob_hill)
      (current_time t_1_15_pm)
      (meeting_started mary)
      (must_continue_meeting mary)
      (available mary t_1_15_pm)
    )
    :effect (and
      (met_minimum mary)
      (not (must_continue_meeting mary))
    )
  )
)