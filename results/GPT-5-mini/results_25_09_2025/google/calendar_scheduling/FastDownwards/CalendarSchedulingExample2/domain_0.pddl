(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Three distinct scheduling actions (one per agent). Any of these agents
  ;; may perform the scheduling action, but each action is kept distinct.
  ;; Preconditions require that all three agents are available at the chosen slot.
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