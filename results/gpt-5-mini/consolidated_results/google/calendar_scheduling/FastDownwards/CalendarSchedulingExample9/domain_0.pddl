(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (free ?p - participant ?s - slot)
    (scheduled)
    (chosen ?s - slot)
  )

  ;; Single action to schedule the meeting at a chosen 30-minute slot.
  ;; Preconditions:
  ;;   - meeting is not yet scheduled
  ;;   - Diane, Kelly, and Deborah are all free at the chosen slot
  ;; Effects:
  ;;   - meeting becomes scheduled
  ;;   - record which slot was chosen
  (:action schedule_at
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)