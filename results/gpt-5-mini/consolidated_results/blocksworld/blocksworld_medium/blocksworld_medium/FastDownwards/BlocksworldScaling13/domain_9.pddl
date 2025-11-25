(define (domain blocks-world-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block step)

  (:predicates
    (on ?b - block ?c - block)       ; block ?b is directly on block ?c
    (on-table ?b - block)            ; block ?b is directly on the table
    (clear ?b - block)               ; nothing on top of ?b and ?b is not being held
    (holding ?ag - agent ?b - block) ; agent is holding block
    (handempty ?ag - agent)          ; agent's hand is empty
    (current ?t - step)              ; the current (active) stage/timepoint
    (next ?t - step ?t2 - step)      ; ordering relation between stages
  )

  ;; Pick up a clear block from the table into the agent's hand,
  ;; advancing the discrete stage from ?t to its successor ?t2.
  (:action pick-up-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
      (handempty ?ag)
      (on-table ?b)
      (clear ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-table ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a clear block ?b from directly on block ?c into the agent's hand,
  ;; making the lower block ?c clear, advancing the stage.
  (:action unstack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (handempty ?ag)
      (on ?b ?c)
      (clear ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?b ?c))
      (not (on-table ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
      (not (clear ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put down the block the agent is holding onto the table,
  ;; advancing the stage.
  (:action put-down-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
      (holding ?ag ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on-table ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (clear ?b)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack the block the agent is holding (?b) on top of a clear block ?c,
  ;; advancing the stage. After stacking, ?c is not clear and ?b becomes clear.
  (:action stack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (holding ?ag ?b)
      (clear ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?c)
      (not (on-table ?b))
      (not (clear ?c))
      (clear ?b)
      (not (current ?t))
      (current ?t2)
    )
  )
)