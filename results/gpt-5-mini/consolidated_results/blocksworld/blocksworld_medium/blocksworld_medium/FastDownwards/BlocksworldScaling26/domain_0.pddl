(define (domain blocks_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  ;; Predicates:
  ;; (on x y) : block x is on block y
  ;; (ontable x) : block x is on the table
  ;; (clear x) : nothing on top of block x
  ;; (holding x) : the (single) hand is holding block x
  ;; (handempty) : the (single) hand is empty
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Actions originating from the "planner" agent
  ;; Planner picks up a block from the table.
  (:action planner-pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Planner puts a held block down onto the table.
  (:action planner-put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Actions originating from the "stacker" agent
  ;; Stacker stacks a held block onto another clear block.
  (:action stacker-stack
    :parameters (?b - block ?t - block)
    :precondition (and (holding ?b) (clear ?t))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (clear ?t))
    )
  )

  ;; Stacker un-stacks a block from another block (picking it up).
  (:action stacker-unstack
    :parameters (?b - block ?t - block)
    :precondition (and (on ?b ?t) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?t)
      (not (on ?b ?t))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Actions originating from the "auditor" agent are not allowed to alter world state;
  ;; auditor constraints are enforced as hard constraints in the model (single-hand enforced,
  ;; no penalties or post-hoc fixes). No auditor state-changing actions are provided.
)