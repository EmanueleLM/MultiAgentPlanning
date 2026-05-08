(define (domain sf_meet_john_day)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time meet_count)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (after_23 ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (person_at ?p - person ?l - location)
    (available ?p - person ?t - time)
    (meeting ?p - person)
    (meet_progress ?m - meet_count)
    (next_count ?m1 - meet_count ?m2 - meet_count)
    (met_minimum ?p - person)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (not (meeting john))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?t1)
      (after_23 ?t1 ?t2)
      (not (meeting john))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?t - time ?l - location)
    :precondition (and
      (current_time ?t)
      (at ?l)
      (person_at john ?l)
      (available john ?t)
      (not (meeting john))
      (meet_progress m_0)
    )
    :effect (and
      (meeting john)
    )
  )

  (:action continue_meeting_one_minute
    :parameters (?t1 - time ?t2 - time ?m1 - meet_count ?m2 - meet_count ?l - location)
    :precondition (and
      (meeting john)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available john ?t1)
      (available john ?t2)
      (at ?l)
      (person_at john ?l)
      (meet_progress ?m1)
      (next_count ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meet_progress ?m1))
      (meet_progress ?m2)
    )
  )

  (:action finish_meeting_minimum
    :parameters (?t - time ?l - location)
    :precondition (and
      (meeting john)
      (current_time ?t)
      (at ?l)
      (person_at john ?l)
      (meet_progress m_75)
    )
    :effect (and
      (met_minimum john)
    )
  )
)