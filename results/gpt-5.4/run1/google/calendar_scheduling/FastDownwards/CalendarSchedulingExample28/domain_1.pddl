(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:constants
    meeting_1 - meeting
    brittany emily doris - participant
  )

  (:predicates
    (current_slot ?t - timeslot)
    (next_slot ?from - timeslot ?to - timeslot)
    (participant_free ?p - participant ?t - timeslot)
    (required_attendee ?m - meeting ?p - participant)
    (scheduled_at ?m - meeting ?t - timeslot)
    (meeting_scheduled ?m - meeting)
  )

  (:action advance_time
    :parameters (?from - timeslot ?to - timeslot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled meeting_1))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (current_slot ?t)
      (not (meeting_scheduled meeting_1))
      (required_attendee meeting_1 brittany)
      (required_attendee meeting_1 emily)
      (required_attendee meeting_1 doris)
      (participant_free brittany ?t)
      (participant_free emily ?t)
      (participant_free doris ?t)
    )
    :effect (and
      (meeting_scheduled meeting_1)
      (scheduled_at meeting_1 ?t)
    )
  )
)