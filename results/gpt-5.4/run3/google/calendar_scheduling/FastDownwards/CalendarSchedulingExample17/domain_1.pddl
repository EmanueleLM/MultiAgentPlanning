(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (allowed_for_meeting ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
    (meeting_participant ?m - meeting ?p - participant)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (allowed_for_meeting ?m ?s)
      (meeting_participant ?m ?p1)
      (meeting_participant ?m ?p2)
      (meeting_participant ?m ?p3)
      (not (= ?p1 ?p2))
      (not (= ?p1 ?p3))
      (not (= ?p2 ?p3))
      (participant_free ?p1 ?s)
      (participant_free ?p2 ?s)
      (participant_free ?p3 ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
    )
  )
)