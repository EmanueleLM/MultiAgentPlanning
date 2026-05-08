(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    timeslot
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (current_slot ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (scheduled ?m - meeting ?t - timeslot)
    (meeting_pending ?m - meeting)
    (participant_required ?m - meeting ?p - participant)
  )

  (:action advance_to_next_slot
    :parameters (?from - timeslot ?to - timeslot ?m - meeting)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (meeting_pending ?m)
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (meeting_pending ?m)
      (current_slot ?t)
      (participant_required ?m ?p1)
      (participant_required ?m ?p2)
      (participant_required ?m ?p3)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
    )
    :effect (and
      (not (meeting_pending ?m))
      (scheduled ?m ?t)
    )
  )
)