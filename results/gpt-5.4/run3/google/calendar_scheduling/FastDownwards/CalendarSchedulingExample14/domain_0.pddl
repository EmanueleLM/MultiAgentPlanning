(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (allowed_for_meeting ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_for_meeting ?m ?s)
      (requires ?m brandon)
      (participant_free brandon ?s)
      (requires ?m jerry)
      (participant_free jerry ?s)
      (requires ?m bradley)
      (participant_free bradley ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)