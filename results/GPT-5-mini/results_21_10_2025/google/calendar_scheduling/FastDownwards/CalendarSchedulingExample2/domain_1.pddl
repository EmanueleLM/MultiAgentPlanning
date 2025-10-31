(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (available ?p - participant ?s - slot)
    (amy_pref ?s - slot)           ;; slots acceptable to Amy (her preference)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule the meeting at a single slot. This action requires:
  ;; - the chosen item is a slot
  ;; - all three participants are available at that slot
  ;; - the slot respects Amy's stated preference (amy_pref)
  ;; - no meeting has already been scheduled
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
      (amy_pref ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)