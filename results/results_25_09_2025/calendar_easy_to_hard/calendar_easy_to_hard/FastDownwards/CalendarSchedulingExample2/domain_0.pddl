(define (domain multi-agent-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:constants roy kathryn amy - agent)

  (:predicates
    (free ?a - agent ?s - slot)            ; agent is free at slot
    (accepted ?a - agent ?s - slot)        ; agent has accepted this slot
    (meeting-scheduled ?s - slot)          ; meeting has been scheduled at slot
    (finalized)                            ; meeting finalized
  )

  ;; Roy's action to accept a slot (distinct action per agent)
  (:action roy-accept
    :parameters (?s - slot)
    :precondition (and (free roy ?s))
    :effect (and (accepted roy ?s)
                 (not (free roy ?s)))
  )

  ;; Kathryn's action to accept a slot
  (:action kathryn-accept
    :parameters (?s - slot)
    :precondition (and (free kathryn ?s))
    :effect (and (accepted kathryn ?s)
                 (not (free kathryn ?s)))
  )

  ;; Amy's action to accept a slot
  (:action amy-accept
    :parameters (?s - slot)
    :precondition (and (free amy ?s))
    :effect (and (accepted amy ?s)
                 (not (free amy ?s)))
  )

  ;; Finalize only when all three have accepted the same slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (accepted roy ?s) (accepted kathryn ?s) (accepted amy ?s) (not (finalized)))
    :effect (and (meeting-scheduled ?s) (finalized))
  )
)