(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:constants stephen edward angela - participant)
  (:predicates
    (free ?p - participant ?s - slot)       ; participant p is free in slot s
    (next ?s1 - slot ?s2 - slot)           ; s2 is the immediate successor of s1 on the 30-min grid
    (occupied ?s - slot)                   ; slot s is occupied by a scheduled meeting
    (scheduled ?m - meeting)               ; meeting m has been scheduled
    (work_slot ?s - slot)                  ; s is within work hours (09:00-17:00)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (work_slot ?s1) (work_slot ?s2)
      (next ?s1 ?s2)                      ; two consecutive slots for contiguous 60 minutes
      (free stephen ?s1) (free stephen ?s2)
      (free edward ?s1) (free edward ?s2)
      (free angela ?s1) (free angela ?s2)
      (not (occupied ?s1)) (not (occupied ?s2))
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (occupied ?s1) (occupied ?s2)
      ; remove free facts to enforce contiguous occupancy and prevent oscillation
      (not (free stephen ?s1)) (not (free stephen ?s2))
      (not (free edward ?s1))  (not (free edward ?s2))
      (not (free angela ?s1))  (not (free angela ?s2))
    )
  )
)