(define (domain san_francisco_meet_sarah)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    time
    meet_stage
  )

  (:constants
    richmond_district presidio - location
    m0 m1 m104 m105 - meet_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location)
    (next_minute ?t1 - time ?t2 - time)
    (travel_7 ?t1 - time ?t2 - time)
    (sarah_available ?t - time)
    (meeting_stage ?m - meet_stage)
    (next_stage ?m1 - meet_stage ?m2 - meet_stage)
    (in_meeting_sarah)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (not (in_meeting_sarah))
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
      (current_time ?t1)
      (connected ?from ?to)
      (travel_7 ?t1 ?t2)
      (not (in_meeting_sarah))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_sarah
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at presidio)
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (sarah_available ?t1)
      (meeting_stage m0)
      (not (in_meeting_sarah))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage m0))
      (meeting_stage m1)
      (in_meeting_sarah)
    )
  )

  (:action continue_meeting_sarah
    :parameters (?t1 - time ?t2 - time ?m1 - meet_stage ?m2 - meet_stage)
    :precondition (and
      (at presidio)
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (sarah_available ?t1)
      (in_meeting_sarah)
      (meeting_stage ?m1)
      (next_stage ?m1 ?m2)
      (not (meeting_stage m0))
      (not (meeting_stage m104))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?m1))
      (meeting_stage ?m2)
    )
  )

  (:action finish_meeting_sarah
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at presidio)
      (current_time ?t1)
      (next_minute ?t1 ?t2)
      (sarah_available ?t1)
      (in_meeting_sarah)
      (meeting_stage m104)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage m104))
      (meeting_stage m105)
      (not (in_meeting_sarah))
    )
  )
)