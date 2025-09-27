(define (domain meeting-schedule)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)         ; agent is free at slot
    (attended ?a - agent ?s - slot)     ; agent has signaled attendance at slot
    (meeting-scheduled ?s - slot)       ; meeting scheduled at slot
  )

  ;; Generic attend action: agent marks they will attend at a slot (requires being free)
  (:action attend
    :parameters (?a - agent ?s - slot)
    :precondition (free ?a ?s)
    :effect (attended ?a ?s)
  )

  ;; Confirm action: all agents must have attended the same slot to schedule the meeting
  (:action confirm
    :parameters (?s - slot)
    :precondition (and
      (attended karen ?s)
      (attended brandon ?s)
      (attended donald ?s)
      (attended kelly ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)