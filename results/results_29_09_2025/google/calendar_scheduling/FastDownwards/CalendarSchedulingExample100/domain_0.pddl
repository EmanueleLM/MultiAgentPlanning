(define (domain meeting-scheduler)
  (:requirements :strips :negative-preconditions :typing)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    ;; busy predicates are participant-specific to keep constraints traceable
    (busy-denise ?s - slot)
    (busy-joseph ?s - slot)
    (busy-henry ?s - slot)
    (busy-christian ?s - slot)
    ;; result of scheduling
    (meeting-scheduled ?s - slot)
  )

  ;; Single action to schedule the required 60-minute meeting at a chosen start slot.
  ;; Preconditions explicitly check each participant's busy predicate (participant-specific).
  (:action schedule-meeting-at
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (busy-denise ?s))
      (not (busy-joseph ?s))
      (not (busy-henry ?s))
      (not (busy-christian ?s))
      ;; ensure slot is not already used
      (not (meeting-scheduled ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
    )
  )
)