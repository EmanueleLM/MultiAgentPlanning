(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )
  (:action schedule-meeting-at
    :parameters (?s - slot ?amy - person ?jonathan - person ?brittany - person ?matthew - person ?catherine - person ?carl - person)
    :precondition (and
      (not (meeting-scheduled))
      (distinct ?amy ?jonathan ?brittany ?matthew ?catherine ?carl)
      (free ?amy ?s) (free ?jonathan ?s) (free ?brittany ?s)
      (free ?matthew ?s) (free ?catherine ?s) (free ?carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (free ?amy ?s)) (not (free ?jonathan ?s)) (not (free ?brittany ?s))
      (not (free ?matthew ?s)) (not (free ?catherine ?s)) (not (free ?carl ?s))
    )
  )
)