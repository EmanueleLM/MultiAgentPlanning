(define (domain meeting_scheduling_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:constants
    stephen edward angela - participant
  )

  (:predicates
    (next_slot ?s1 - timeslot ?s2 - timeslot)
    (busy ?p - participant ?s - timeslot)
    (scheduled ?m - meeting)
    (meeting_start ?m - meeting ?s - timeslot)
    (meeting_second_slot ?m - meeting ?s - timeslot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?m - meeting ?s1 - timeslot ?s2 - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (next_slot ?s1 ?s2)
      (not (busy stephen ?s1))
      (not (busy stephen ?s2))
      (not (busy edward ?s1))
      (not (busy edward ?s2))
      (not (busy angela ?s1))
      (not (busy angela ?s2))
    )
    :effect (and
      (scheduled ?m)
      (meeting_start ?m ?s1)
      (meeting_second_slot ?m ?s2)
    )
  )
)