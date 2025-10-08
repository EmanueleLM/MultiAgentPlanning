(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (busy ?p - person ?s - slot)        ;; participant ?p is busy during half-hour slot ?s
    (next ?s - slot ?s2 - slot)         ;; ?s2 is the immediate next half-hour slot after ?s
    (scheduled)                         ;; meeting has been scheduled
    (meeting-start ?s - slot)           ;; meeting starts at slot ?s (a half-hour boundary)
  )
  ;; This domain contains a single scheduling action that explicitly names the chosen earliest feasible start:
  (:action schedule-at-14_30
    :precondition (and
      (next slot-14_30 slot-15_00)
      (not (busy michelle slot-14_30)) (not (busy michelle slot-15_00))
      (not (busy steven slot-14_30))   (not (busy steven slot-15_00))
      (not (busy jerry slot-14_30))    (not (busy jerry slot-15_00))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-start slot-14_30)
    )
  )
)