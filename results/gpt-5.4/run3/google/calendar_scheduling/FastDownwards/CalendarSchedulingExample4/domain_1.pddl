(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_planned)
    (participant_named_donna ?p - participant)
    (participant_named_john ?p - participant)
    (participant_named_billy ?p - participant)
  )

  (:action schedule_meeting
    :parameters (?d - participant ?j - participant ?b - participant ?s - slot)
    :precondition (and
      (not (meeting_planned))
      (participant_named_donna ?d)
      (participant_named_john ?j)
      (participant_named_billy ?b)
      (free ?d ?s)
      (free ?j ?s)
      (free ?b ?s)
    )
    :effect (and
      (meeting_planned)
      (scheduled ?s)
    )
  )
)