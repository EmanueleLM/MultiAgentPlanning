(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (allowed_start ?s - slot)
    (meeting_scheduled)
    (chosen_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_start ?s1)
      (next_slot ?s1 ?s2)
      (participant_free janet ?s1)
      (participant_free janet ?s2)
      (participant_free rachel ?s1)
      (participant_free rachel ?s2)
      (participant_free cynthia ?s1)
      (participant_free cynthia ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (chosen_start ?s1)
    )
  )
)