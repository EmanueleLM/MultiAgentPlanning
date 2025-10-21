(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?a - person ?b - person ?c - person ?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (not (meeting-scheduled))
      (free ?a ?s) (free ?a ?s2)
      (free ?b ?s) (free ?b ?s2)
      (free ?c ?s) (free ?c ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)