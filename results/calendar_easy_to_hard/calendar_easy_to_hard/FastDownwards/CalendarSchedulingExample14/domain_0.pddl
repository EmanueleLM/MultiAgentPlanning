(define (domain multiagent-meeting)
  (:requirements :typing :strips :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)   ; person p is available to start a 30-min meeting at slot s
    (preferred ?s - slot)              ; Brandon prefers meetings starting at or after 14:30
    (scheduled ?s - slot)              ; meeting scheduled at slot s
    (attends ?p - person ?s - slot)    ; person p attends meeting at slot s
    (meeting-scheduled)                ; a meeting has been scheduled
  )

  ;; Three distinct scheduling actions (keeps agents' actions distinct).
  ;; All scheduling actions require that all participants are available for that slot
  ;; and that the slot matches Brandon's preference (preferred). Requiring preferred
  ;; enforces Brandon's stated preference (avoid before 14:30).
  (:action brandon-schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting-scheduled)
    )
  )

  (:action jerry-schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting-scheduled)
    )
  )

  (:action bradley-schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting-scheduled)
    )
  )
)