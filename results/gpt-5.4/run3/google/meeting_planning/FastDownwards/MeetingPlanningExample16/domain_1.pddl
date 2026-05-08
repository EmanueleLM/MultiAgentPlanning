(define (domain sf_meet_ronald)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time progress
  )

  (:constants
    ronald - person
    russian_hill chinatown - location
    m_105 - progress
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (travel_time_7 ?from - location ?to - location)
    (travel_time_9 ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (plus_7 ?t1 - time ?t2 - time)
    (plus_9 ?t1 - time ?t2 - time)
    (available ?p - person ?l - location ?t - time)
    (meeting ?p - person)
    (met_progress ?m - progress)
    (next_progress ?m1 - progress ?m2 - progress)
    (met_minimum ?p - person)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (not (meeting ronald))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_7
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_time_7 ?from ?to)
      (plus_7 ?t1 ?t2)
      (not (meeting ronald))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_9
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_time_9 ?from ?to)
      (plus_9 ?t1 ?t2)
      (not (meeting ronald))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_ronald
    :parameters (?t1 - time ?t2 - time ?m0 - progress ?m1 - progress)
    :precondition (and
      (at russian_hill)
      (current_time ?t1)
      (available ronald russian_hill ?t1)
      (next_time ?t1 ?t2)
      (met_progress ?m0)
      (next_progress ?m0 ?m1)
      (not (meeting ronald))
    )
    :effect (and
      (meeting ronald)
      (not (current_time ?t1))
      (current_time ?t2)
      (not (met_progress ?m0))
      (met_progress ?m1)
    )
  )

  (:action continue_meeting_ronald
    :parameters (?t1 - time ?t2 - time ?m1 - progress ?m2 - progress)
    :precondition (and
      (meeting ronald)
      (at russian_hill)
      (current_time ?t1)
      (available ronald russian_hill ?t1)
      (next_time ?t1 ?t2)
      (met_progress ?m1)
      (next_progress ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (met_progress ?m1))
      (met_progress ?m2)
    )
  )

  (:action finish_minimum_meeting_ronald
    :parameters ()
    :precondition (and
      (meeting ronald)
      (met_progress m_105)
    )
    :effect (and
      (met_minimum ronald)
    )
  )
)