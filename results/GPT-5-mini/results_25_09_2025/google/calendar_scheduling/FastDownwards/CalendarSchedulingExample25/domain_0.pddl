(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (next ?s - slot ?s2 - slot)                    ; consecutive half-hour slots
    (free ?a - agent ?s - slot)                    ; agent is free in this half-hour slot
    (attending ?a - agent ?s - slot)               ; agent committed to attend a meeting starting at slot ?s
    (meeting-scheduled ?s - slot)                  ; a meeting has been scheduled starting at slot ?s
  )

  ;; Each agent has a distinct attend action (preserve agent identity)
  (:action attend-anthony
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (free anthony ?s)
      (free anthony ?s2)
    )
    :effect (and (attending anthony ?s))
  )

  (:action attend-pamela
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (free pamela ?s)
      (free pamela ?s2)
    )
    :effect (and (attending pamela ?s))
  )

  (:action attend-zachary
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (free zachary ?s)
      (free zachary ?s2)
    )
    :effect (and (attending zachary ?s))
  )

  ;; Finalize/schedule the meeting once all three have committed to the same start slot
  (:action schedule-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (attending anthony ?s)
      (attending pamela ?s)
      (attending zachary ?s)
    )
    :effect (and (meeting-scheduled ?s))
  )
)