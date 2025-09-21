(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (participant ?p - person)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot ?a - person ?b - person ?c - person ?d - person ?e - person ?f - person)
    :precondition (and
      (not (meeting-scheduled))
      (participant ?a) (participant ?b) (participant ?c) (participant ?d) (participant ?e) (participant ?f)
      (free ?a ?s) (free ?b ?s) (free ?c ?s) (free ?d ?s) (free ?e ?s) (free ?f ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)