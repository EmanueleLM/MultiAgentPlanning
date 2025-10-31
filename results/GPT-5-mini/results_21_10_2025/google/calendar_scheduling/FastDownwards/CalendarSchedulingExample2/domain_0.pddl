(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (available ?p - participant ?s - slot)
    (amy_pref ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Single scheduling action that assigns the meeting to one slot.
  ;; It requires all three named participants to be available at that slot
  ;; and enforces Amy's preference as a hard constraint via amy_pref.
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