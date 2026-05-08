(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    time
    meeting_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (can_travel ?from - location ?to - location ?depart - time ?arrive - time)
    (margaret_available ?t - time)
    (meeting_started)
    (meeting_progress ?s - meeting_stage)
    (stage_next ?s1 - meeting_stage ?s2 - meeting_stage)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next ?t1 ?t2)
      (not (meeting_started))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (can_travel ?from ?to ?depart ?arrive)
      (not (meeting_started))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at north_beach)
      (current_time ?t1)
      (margaret_available ?t1)
      (next ?t1 ?t2)
      (meeting_progress ms0)
      (not (meeting_started))
    )
    :effect (and
      (meeting_started)
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ms0))
      (meeting_progress ms1)
    )
  )

  (:action continue_meeting
    :parameters (?t1 - time ?t2 - time ?s1 - meeting_stage ?s2 - meeting_stage)
    :precondition (and
      (meeting_started)
      (at north_beach)
      (current_time ?t1)
      (margaret_available ?t1)
      (next ?t1 ?t2)
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