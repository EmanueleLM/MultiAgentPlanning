(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants roy kathryn amy - agent)
  (:predicates
    (available ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )
  (:action schedule-by-roy
    :parameters (?s - slot)
    :precondition (and
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (meeting-scheduled ?s)
  )
  (:action schedule-by-kathryn
    :parameters (?s - slot)
    :precondition (and
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (meeting-scheduled ?s)
  )
  (:action schedule-by-amy
    :parameters (?s - slot)
    :precondition (and
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (meeting-scheduled ?s)
  )
)