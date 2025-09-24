(define (domain orchestrated-meeting)
  (:requirements :strips)
  (:predicates
    (person ?p)
    (slot ?s)
    (next ?s ?s2)
    (free ?p ?s)                ; person ?p is free for the half-hour slot starting at ?s
    (confirmed ?p ?s)           ; agent ?p has confirmed availability for a meeting starting at ?s (i.e. ?s and next ?s are free for that agent)
    (meeting-scheduled)
    (meeting-start ?s)
    (meeting-with ?p)
  )

  ;; Each agent has its own "confirm" action that checks its private availability for two contiguous slots.
  ;; Keeping actions distinct preserves agent identity in the planning model.
  (:action confirm-anthony
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (free anthony ?s)
      (free anthony ?s2)
      (person anthony)
    )
    :effect (and
      (confirmed anthony ?s)
    )
  )

  (:action confirm-pamela
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (free pamela ?s)
      (free pamela ?s2)
      (person pamela)
    )
    :effect (and
      (confirmed pamela ?s)
    )
  )

  (:action confirm-zachary
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (free zachary ?s)
      (free zachary ?s2)
      (person zachary)
    )
    :effect (and
      (confirmed zachary ?s)
    )
  )

  ;; Finalize action requires all agents to have confirmed the same start slot.
  ;; It publishes the meeting and the participants.
  (:action finalize-meeting
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (confirmed anthony ?s)
      (confirmed pamela ?s)
      (confirmed zachary ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
      (meeting-with anthony)
      (meeting-with pamela)
      (meeting-with zachary)
    )
  )
)