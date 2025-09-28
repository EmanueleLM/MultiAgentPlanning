(define (domain meeting-scheduling)
  (:requirements :typing :strips :equality :action-costs)
  (:types participant slot)

  (:predicates
    (is-participant ?p - participant)
    (is-slot ?s - slot)
    (free ?p - participant ?s - slot)
    (meeting-started ?s - slot)
    (attends ?p - participant ?s - slot)
  )

  (:functions (total-cost) (slot-cost ?s - slot))

  (:action start-meeting
    :parameters (?s - slot)
    :precondition (is-slot ?s)
    :effect (and (meeting-started ?s) (increase (total-cost) (slot-cost ?s)))
  )

  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (and (is-participant ?p) (is-slot ?s) (free ?p ?s) (meeting-started ?s))
    :effect (and (attends ?p ?s))
  )
)