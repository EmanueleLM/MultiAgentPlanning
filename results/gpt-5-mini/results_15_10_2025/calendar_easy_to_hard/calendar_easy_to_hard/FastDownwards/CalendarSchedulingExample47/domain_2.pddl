(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (is-person ?p - person)
    (is-slot ?s - slot)
    (available ?p - person ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action attend
    :parameters (?p - person ?s - slot)
    :precondition (and (is-slot ?s) (is-person ?p) (available ?p ?s) (not (meeting-scheduled)) (not (attends ?p ?s)))
    :effect (attends ?p ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person ?p4 - person ?p5 - person ?p6 - person ?p7 - person)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (attends ?p1 ?s)
      (attends ?p2 ?s)
      (attends ?p3 ?s)
      (attends ?p4 ?s)
      (attends ?p5 ?s)
      (attends ?p6 ?s)
      (attends ?p7 ?s)
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)