(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (slot ?s - slot)
    (free-roy ?s - slot)
    (free-kathryn ?s - slot)
    (free-amy ?s - slot)
    (preferred-amy ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and (free-roy ?s) (free-kathryn ?s) (free-amy ?s))
    :effect (and
      (meeting-scheduled ?s)
      (not (free-roy ?s))
      (not (free-kathryn ?s))
      (not (free-amy ?s))
    )
  )
)