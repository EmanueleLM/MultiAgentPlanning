(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (busy ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (scheduled_slot ?s - slot)
    (meeting_scheduled)
  )

  (:action agree-margaret
    :parameters (?s - slot)
    :precondition (and (not (busy margaret ?s)) (not (agreed margaret ?s)) (not (meeting_scheduled)))
    :effect (agreed margaret ?s)
  )

  (:action agree-donna
    :parameters (?s - slot)
    :precondition (and (not (busy donna ?s)) (not (agreed donna ?s)) (not (meeting_scheduled)))
    :effect (agreed donna ?s)
  )

  (:action agree-helen
    :parameters (?s - slot)
    :precondition (and (not (busy helen ?s)) (not (agreed helen ?s)) (not (meeting_scheduled)))
    :effect (agreed helen ?s)
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and (agreed margaret ?s) (agreed donna ?s) (agreed helen ?s) (not (meeting_scheduled)))
    :effect (and (meeting_scheduled) (scheduled_slot ?s))
  )
)