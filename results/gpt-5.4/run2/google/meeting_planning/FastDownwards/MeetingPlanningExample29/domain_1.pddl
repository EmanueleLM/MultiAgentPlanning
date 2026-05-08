(define (domain san_francisco_meet_nancy)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler location friend time meeting_stage
  )

  (:constants
    nancy - friend
    m0 m1 m2 m3 m4 m5 - meeting_stage
  )

  (:predicates
    (at ?p - traveler ?l - location)
    (road ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (friend_at ?f - friend ?l - location)
    (available ?f - friend ?t - time)
    (meeting_progress ?f - friend ?s - meeting_stage)
    (next_stage ?s1 - meeting_stage ?s2 - meeting_stage)
    (in_meeting_session ?f - friend)
    (met_minimum ?f - friend)
  )

  (:action wait
    :parameters (?p - traveler ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (in_meeting_session nancy))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?p - traveler ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from)
      (road ?from ?to)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (in_meeting_session nancy))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meet
    :parameters (?p - traveler ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (friend_at nancy ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available nancy ?t1)
      (meeting_progress nancy m0)
      (not (in_meeting_session nancy))
    )
    :effect (and
      (not (meeting_progress nancy m0))
      (meeting_progress nancy m1)
      (in_meeting_session nancy)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action continue_meet
    :parameters (?p - traveler ?l - location ?t1 - time ?t2 - time ?s1 - meeting_stage ?s2 - meeting_stage)
    :precondition (and
      (at ?p ?l)
      (friend_at nancy ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available nancy ?t1)
      (in_meeting_session nancy)
      (meeting_progress nancy ?s1)
      (next_stage ?s1 ?s2)
    )
    :effect (and
      (not (meeting_progress nancy ?s1))
      (meeting_progress nancy ?s2)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action finish_meet
    :parameters (?p - traveler ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (friend_at nancy ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available nancy ?t1)
      (in_meeting_session nancy)
      (meeting_progress nancy m4)
    )
    :effect (and
      (not (meeting_progress nancy m4))
      (meeting_progress nancy m5)
      (not (in_meeting_session nancy))
      (met_minimum nancy)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)