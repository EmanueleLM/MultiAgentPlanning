(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    brandon jerry bradley - participant
  )

  (:predicates
    (slot_in_workday ?s - slot)
    (participant_free ?p - participant ?s - slot)
    (preference_allowed ?p - participant ?s - slot)
    (meeting_unscheduled)
    (meeting_scheduled_at ?s - slot)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (slot_in_workday ?s)
      (participant_free brandon ?s)
      (participant_free jerry ?s)
      (participant_free bradley ?s)
      (preference_allowed brandon ?s)
      (preference_allowed jerry ?s)
      (preference_allowed bradley ?s)
    )
    :effect (and
      (meeting_scheduled_at ?s)
      (not (meeting_unscheduled))
    )
  )
)