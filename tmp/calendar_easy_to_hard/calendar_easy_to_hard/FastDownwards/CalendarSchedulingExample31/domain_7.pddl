(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )
  (:action schedule-meeting-at
    :parameters (?s - slot ?a - person ?j - person ?b - person ?m - person ?c - person ?r - person)
    :precondition (and
      (not (meeting-scheduled))
      (free ?a ?s) (free ?j ?s) (free ?b ?s)
      (free ?m ?s) (free ?c ?s) (free ?r ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)