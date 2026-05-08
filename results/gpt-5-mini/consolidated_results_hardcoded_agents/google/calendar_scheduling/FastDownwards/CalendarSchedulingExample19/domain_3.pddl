(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:predicates
    (free ?p - participant ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (occupied ?s - slot)
    (scheduled ?m - meeting)
  )

  ;; This action schedules the specific meeting ?m using two consecutive slots ?s1 and ?s2.
  ;; It requires those two slots to be free for each named participant and not already occupied,
  ;; and marks the slots occupied and the meeting scheduled. It also removes the free facts
  ;; for the participants for those slots to enforce contiguous occupancy.
  (:action schedule_meeting_m1
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (free stephen ?s1) (free stephen ?s2)
      (free edward ?s1) (free edward ?s2)
      (free angela ?s1) (free angela ?s2)
      (not (occupied ?s1)) (not (occupied ?s2))
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (occupied ?s1) (occupied ?s2)
      (not (free stephen ?s1)) (not (free stephen ?s2))
      (not (free edward ?s1)) (not (free edward ?s2))
      (not (free angela ?s1)) (not (free angela ?s2))
    )
  )
)