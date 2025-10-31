(define (domain multi-agent-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (monday)                       ; it's Monday
    (free-roy ?s - slot)           ; Roy considers slot available
    (free-kathryn ?s - slot)       ; Kathryn considers slot available
    (free-amy ?s - slot)           ; Amy considers slot available
    (scheduled ?s - slot)          ; meeting scheduled in a slot
    (meeting-scheduled)            ; a meeting has been scheduled
    (preferred-amy ?s - slot)      ; Amy's preferred slot(s)
  )

  ;; Distinct agent actions. Each agent may perform a scheduling action,
  ;; but all scheduling actions require that the chosen slot is free for
  ;; Roy, Kathryn and Amy, and that no meeting has already been scheduled.
  ;; This guarantees a meeting is only scheduled in a slot acceptable to all.
  (:action schedule-roy
    :parameters (?s - slot)
    :precondition (and
      (monday)
      (not (meeting-scheduled))
      (free-roy ?s)
      (free-kathryn ?s)
      (free-amy ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (free-roy ?s))
      (not (free-kathryn ?s))
      (not (free-amy ?s))
    )
  )

  (:action schedule-kathryn
    :parameters (?s - slot)
    :precondition (and
      (monday)
      (not (meeting-scheduled))
      (free-roy ?s)
      (free-kathryn ?s)
      (free-amy ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (free-roy ?s))
      (not (free-kathryn ?s))
      (not (free-amy ?s))
    )
  )

  (:action schedule-amy
    :parameters (?s - slot)
    :precondition (and
      (monday)
      (not (meeting-scheduled))
      (free-roy ?s)
      (free-kathryn ?s)
      (free-amy ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (free-roy ?s))
      (not (free-kathryn ?s))
      (not (free-amy ?s))
    )
  )
)