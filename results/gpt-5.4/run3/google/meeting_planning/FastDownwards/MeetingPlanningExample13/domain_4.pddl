(define (domain san_francisco_betty_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent friend location time meet_stage
  )

  (:constants
    you - agent
    betty - friend
    presidio north_beach - location
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (next_minute ?t1 - time ?t2 - time)
    (advance_17 ?t1 - time ?t2 - time)
    (advance_18 ?t1 - time ?t2 - time)
    (route_17 ?from - location ?to - location)
    (route_18 ?from - location ?to - location)
    (friend_at ?f - friend ?l - location)
    (betty_available ?t - time)
    (in_meeting ?f - friend)
    (meeting_stage ?s - meet_stage)
    (meeting_next ?s1 - meet_stage ?s2 - meet_stage)
    (met_minimum ?f - friend)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (at you ?l)
      (not (in_meeting betty))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_presidio_to_north_beach
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at you presidio)
      (current_time ?t1)
      (advance_18 ?t1 ?t2)
      (route_18 presidio north_beach)
      (not (in_meeting betty))
    )
    :effect (and
      (not (at you presidio))
      (at you north_beach)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_north_beach_to_presidio
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at you north_beach)
      (current_time ?t1)
      (advance_17 ?t1 ?t2)
      (route_17 north_beach presidio)
      (not (in_meeting betty))
    )
    :effect (and
      (not (at you north_beach))
      (at you presidio)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action advance_meeting_one_minute
    :parameters (?t1 - time ?t2 - time ?s1 - meet_stage ?s2 - meet_stage)
    :precondition (and
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (at you north_beach)
      (friend_at betty north_beach)
      (betty_available ?t1)
      (meeting_stage ?s1)
      (meeting_next ?s1 ?s2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?s1))
      (meeting_stage ?s2)
      (in_meeting betty)
    )
  )

  (:action finish_meeting_requirement
    :parameters ()
    :precondition (and
      (meeting_stage m75)
      (at you north_beach)
      (in_meeting betty)
    )
    :effect (and
      (met_minimum betty)
    )
  )
)