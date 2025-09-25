(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (meeting-at ?s - slot)
  )

  ;; Brittany can propose/schedule the meeting at a slot if all are free then.
  (:action brittany-schedule
    :parameters (?s - slot)
    :precondition (and
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
    )
    :effect (and
      (meeting-at ?s)
      ;; mark the slot as no longer free for the three participants
      (not (free brittany ?s))
      (not (free emily ?s))
      (not (free doris ?s))
    )
  )

  ;; Emily can propose/schedule the meeting at a slot if all are free then.
  (:action emily-schedule
    :parameters (?s - slot)
    :precondition (and
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
    )
    :effect (and
      (meeting-at ?s)
      (not (free brittany ?s))
      (not (free emily ?s))
      (not (free doris ?s))
    )
  )

  ;; Doris can propose/schedule the meeting at a slot if all are free then.
  (:action doris-schedule
    :parameters (?s - slot)
    :precondition (and
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
    )
    :effect (and
      (meeting-at ?s)
      (not (free brittany ?s))
      (not (free emily ?s))
      (not (free doris ?s))
    )
  )
)