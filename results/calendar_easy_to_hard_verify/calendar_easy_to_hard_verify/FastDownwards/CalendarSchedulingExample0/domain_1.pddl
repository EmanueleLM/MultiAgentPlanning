(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (busy ?p - person ?s - slot)
    (next ?s - slot ?s2 - slot)
    (scheduled)
    (meeting-start ?s - slot)
  )
  (:action schedule-at-14_30
    :parameters ()
    :precondition (and
      (next slot-14_30 slot-15_00)
      (not (busy michelle slot-14_30)) (not (busy michelle slot-15_00))
      (not (busy steven slot-14_30)) (not (busy steven slot-15_00))
      (not (busy jerry slot-14_30)) (not (busy jerry slot-15_00))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-start slot-14_30)
    )
  )
)