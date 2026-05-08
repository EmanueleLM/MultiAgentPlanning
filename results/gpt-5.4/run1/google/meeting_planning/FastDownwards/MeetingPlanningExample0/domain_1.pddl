(define (domain san_francisco_meet_stephanie)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meeting_stage
  )

  (:constants
    stephanie - person
    marina_district mission_district - location
    m0 m1 m2 m3 m4 - meeting_stage
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (available ?p - person ?t - time)
    (meeting_progress ?p - person ?m - meeting_stage)
    (next_meeting_stage ?m1 - meeting_stage ?m2 - meeting_stage)
  )

  (:action wait_before_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress stephanie m0)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_marina_to_mission_before_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina_district)
      (connected marina_district mission_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress stephanie m0)
    )
    :effect (and
      (not (at marina_district))
      (at mission_district)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_mission_to_marina_before_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at mission_district)
      (connected mission_district marina_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress stephanie m0)
    )
    :effect (and
      (not (at mission_district))
      (at marina_district)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_stephanie_segment
    :parameters (?t1 - time ?t2 - time ?m1 - meeting_stage ?m2 - meeting_stage)
    :precondition (and
      (at mission_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available stephanie ?t1)
      (meeting_progress stephanie ?m1)
      (next_meeting_stage ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress stephanie ?m1))
      (meeting_progress stephanie ?m2)
    )
  )
)