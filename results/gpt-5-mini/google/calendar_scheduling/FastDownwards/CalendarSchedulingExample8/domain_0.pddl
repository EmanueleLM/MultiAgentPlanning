(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (free ?p - participant ?s - slot)
    (occupied ?p - participant ?s - slot)
    (meeting ?m - meeting)
    (meeting-scheduled ?m - meeting)
    (meeting-at ?m - meeting ?s - slot)
    (assigned-first ?p - participant)
    (assigned-second ?p - participant)
    (assigned-third ?p - participant)
  )

  ;; Single action that schedules the specified meeting in one 30-minute slot.
  ;; Preconditions:
  ;;  - the meeting has not already been scheduled
  ;;  - the chosen slot exists
  ;;  - the three participants exist and are free in that slot (uses audited availability)
  ;; Effects:
  ;;  - mark the meeting as scheduled and located at the chosen slot
  ;;  - mark each participant as occupied in that slot
  ;;  - record the explicit assignment order: Adam, Jerry, Matthew
  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting-scheduled ?m))
      (slot ?s)
      (participant adam) (participant jerry) (participant matthew)
      (free adam ?s) (free jerry ?s) (free matthew ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (meeting-at ?m ?s)
      (occupied adam ?s) (occupied jerry ?s) (occupied matthew ?s)
      (assigned-first adam) (assigned-second jerry) (assigned-third matthew)
    )
  )
)