(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :action-costs :fluents)
  (:types person slot)
  (:predicates
    (next ?s - slot ?s2 - slot)
    (ready ?s - slot)
    (checked ?s - slot)
    (busy ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
    (undesirable ?s - slot)
  )
  (:functions (total-cost))
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (ready ?s)
      (not (busy heather ?s))
      (not (busy nicholas ?s))
      (not (busy zachary ?s))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (ready ?s))
      (when (undesirable ?s) (increase (total-cost) 1))
    )
  )
  (:action fail-heather
    :parameters (?s - slot ?next - slot)
    :precondition (and
      (ready ?s)
      (next ?s ?next)
      (busy heather ?s)
    )
    :effect (and
      (checked ?s)
      (not (ready ?s))
      (ready ?next)
    )
  )
  (:action fail-nicholas
    :parameters (?s - slot ?next - slot)
    :precondition (and
      (ready ?s)
      (next ?s ?next)
      (busy nicholas ?s)
    )
    :effect (and
      (checked ?s)
      (not (ready ?s))
      (ready ?next)
    )
  )
  (:action fail-zachary
    :parameters (?s - slot ?next - slot)
    :precondition (and
      (ready ?s)
      (next ?s ?next)
      (busy zachary ?s)
    )
    :effect (and
      (checked ?s)
      (not (ready ?s))
      (ready ?next)
    )
  )
)