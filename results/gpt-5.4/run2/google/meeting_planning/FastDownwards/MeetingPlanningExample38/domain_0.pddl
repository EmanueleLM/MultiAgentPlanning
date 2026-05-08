(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    friend
    location
    time
    meeting_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location ?depart - time ?arrive - time)
    (next_minute ?t1 - time ?t2 - time)
    (friend_at ?f - friend ?l - location)
    (available ?f - friend ?t - time)
    (meeting ?f - friend)
    (meeting_progress ?s - meeting_stage)
    (stage_next ?s1 - meeting_stage ?s2 - meeting_stage)
  )

  (:action wait_one_minute
    :parameters (?l - location ?t1 - time ?t2 - time ?f - friend)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (not (meeting ?f))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time ?f - friend)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to ?depart ?arrive)
      (not (meeting ?f))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?f - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at north_beach)
      (current_time ?t1)
      (friend_at ?f north_beach)
      (available ?f ?t1)
      (next_minute ?t1 ?t2)
      (meeting_progress m0)
      (not (meeting ?f))
    )
    :effect (and
      (meeting ?f)
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress m0))
      (meeting_progress m1)
    )
  )

  (:action continue_meeting
    :parameters (?f - friend ?t1 - time ?t2 - time ?s1 - meeting_stage ?s2 - meeting_stage)
    :precondition (and
      (meeting ?f)
      (at north_beach)
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (available ?f ?t1)
      (meeting_progress ?s1)
      (stage_next ?s1 ?s2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?s1))
      (meeting_progress ?s2)
    )
  )
)