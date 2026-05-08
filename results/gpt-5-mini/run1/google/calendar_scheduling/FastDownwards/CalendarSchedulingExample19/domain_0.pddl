(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (avail ?p - participant ?s - slot)
    (all-available ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
    (next ?s1 - slot ?s2 - slot)
  )

  ;; Schedule the one-hour meeting at a single discrete slot.
  ;; Preconditions require a designated "all-available" fact for that slot,
  ;; which the problem must assert only for slots that satisfy every participant's availability.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (all-available ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)