(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  ;; participants declared as domain constants (not repeated in the problem objects)
  (:constants brian billy patricia - person)

  (:predicates
    (free ?p - person ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (preferred_by_billy ?s - slot)
  )

  ;; Schedule the meeting at a single 30-minute slot.
  ;; The action requires all three participants to be free at the chosen slot
  ;; and that no meeting has been scheduled yet.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (free brian ?s)
      (free billy ?s)
      (free patricia ?s)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
      (not (free brian ?s))
      (not (free billy ?s))
      (not (free patricia ?s))
    )
  )
)