(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)

  (:predicates
    ;; object membership / roles
    (participant ?p - participant)
    (slot ?s - slot)

    ;; availability: participant is free for the 30-minute slot ?s
    (available ?p - participant ?s - slot)

    ;; meeting-scheduled marks the chosen 30-minute slot
    (meeting-scheduled ?s - slot)

    ;; simple flag to prevent scheduling more than one meeting
    (unscheduled)
  )

  ;; Schedule the meeting at a single 30-minute slot ?s if the participant ?p is available.
  ;; This domain models the meeting as occupying exactly one slot (each slot = 30 minutes).
  ;; The action requires the meeting is currently unscheduled and the participant is available at ?s.
  (:action schedule
    :parameters (?s - slot ?p - participant)
    :precondition (and
      (slot ?s)
      (participant ?p)
      (unscheduled)
      (available ?p ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
    )
  )
)