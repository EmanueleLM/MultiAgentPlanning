(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types participant slot)

  (:predicates
    (free ?p - participant ?s - slot)        ; participant is free at slot
    (unscheduled)                            ; meeting not yet scheduled (resource)
    (meeting-scheduled)                      ; a meeting has been scheduled
    (meeting-at ?s - slot)                   ; meeting is at slot
    (attends ?p - participant ?s - slot)     ; participant attends meeting at slot
    (early ?s - slot)                        ; slot before Brandon's preferred time (14:30)
    (late ?s - slot)                         ; slot at/after 14:30
  )

  (:functions
    (total-penalty)                          ; numeric penalty to capture Brandon's preference
  )

  ;; Actions are kept distinct per agent (orchestrator requires distinct actions).
  ;; Each action schedules the one meeting (consumes the unscheduled resource)
  ;; and records attendance for all three participants. Brandon's scheduling actions
  ;; are split into early/late to capture the numeric penalty for early slots.

  ;; Brandon schedules at an early slot (incurs penalty +1)
  (:action schedule-by-brandon-early
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (early ?s)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
      (increase (total-penalty) 1)
    )
  )

  ;; Brandon schedules at a late slot (no penalty)
  (:action schedule-by-brandon-late
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (late ?s)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
  )

  ;; Jerry schedules (no penalty implications)
  (:action schedule-by-jerry
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
  )

  ;; Bradley schedules (no penalty implications)
  (:action schedule-by-bradley
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
  )
)