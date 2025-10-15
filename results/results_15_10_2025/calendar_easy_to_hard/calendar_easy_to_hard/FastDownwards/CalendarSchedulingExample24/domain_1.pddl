(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (attended ?p - person ?s - slot)
    (chosen ?s - slot)
    (person ?p - person)
    (slot ?s - slot)
  )

  (:action attend
    :parameters (?p - person ?s - slot)
    :precondition (and (free ?p ?s))
    :effect (attended ?p ?s)
  )

  (:action choose
    :parameters (?s - slot)
    :precondition (and)
    :effect (chosen ?s)
  )
)