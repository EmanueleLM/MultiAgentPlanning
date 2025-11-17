(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)
  (:constants stephen edward angela - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (next ?s1 - slot ?s2 - slot)            ; immediate successor on the 30-min grid
    (occupied ?s - slot)
    (scheduled ?m - meeting)
    (work_slot ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (work_slot ?s1) (work_slot ?s2)
      (next ?s1 ?s2)
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