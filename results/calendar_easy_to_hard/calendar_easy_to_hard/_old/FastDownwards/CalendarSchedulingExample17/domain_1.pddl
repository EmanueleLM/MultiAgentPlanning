(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (busy ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (scheduled_slot ?s - slot)
    (meeting_scheduled)
  )

  (:action agree
    :parameters (?a - agent ?s - slot)
    :precondition (and (not (busy ?a ?s)) (not (agreed ?a ?s)) (not (meeting_scheduled)))
    :effect (agreed ?a ?s)
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and (agreed margaret ?s) (agreed donna ?s) (agreed helen ?s) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot ?s))
  )
)