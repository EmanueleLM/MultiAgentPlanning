(define (domain san_francisco_meeting_joseph)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent person location time meeting_stage
  )

  (:constants
    you - agent
    joseph - person
    chinatown nob_hill - location
    m0 m74 m75 - meeting_stage
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_link ?from - location ?to - location ?t1 - time ?t2 - time)
    (friend_at ?p - person ?l - location ?t - time)
    (meeting_stage ?s - meeting_stage)
    (next_stage ?s1 - meeting_stage ?s2 - meeting_stage)
    (meeting_active ?p - person)
    (met_minimum ?p - person)
  )

  (:action wait_one_minute
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at you ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_active joseph))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at you ?from)
      (current_time ?t1)
      (travel_link ?from ?to ?t1 ?t2)
      (not (meeting_active joseph))
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_minute
    :parameters (?t1 - time ?t2 - time ?s2 - meeting_stage)
    :precondition (and
      (at you nob_hill)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (friend_at joseph nob_hill ?t1)
      (meeting_stage m0)
      (next_stage m0 ?s2)
      (not (meeting_active joseph))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage m0))
      (meeting_stage ?s2)
      (meeting_active joseph)
    )
  )

  (:action continue_meeting_minute
    :parameters (?t1 - time ?t2 - time ?s1 - meeting_stage ?s2 - meeting_stage)
    :precondition (and
      (at you nob_hill)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (friend_at joseph nob_hill ?t1)
      (meeting_active joseph)
      (meeting_stage ?s1)
      (next_stage ?s1 ?s2)
      (not (meeting_stage m74))
      (not (meeting_stage m75))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?s1))
      (meeting_stage ?s2)
    )
  )

  (:action final_meeting_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at you nob_hill)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (friend_at joseph nob_hill ?t1)
      (meeting_active joseph)
      (meeting_stage m74)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage m74))
      (meeting_stage m75)
      (not (meeting_active joseph))
      (met_minimum joseph)
    )
  )
)