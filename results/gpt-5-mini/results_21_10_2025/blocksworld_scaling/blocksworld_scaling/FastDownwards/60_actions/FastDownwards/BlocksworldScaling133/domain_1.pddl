(define (domain blocks-world-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (can-move ?a - agent ?b - block)
  )

  ;; Pick up a block from the table by an agent that is allowed to move it.
  (:action pickup-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?ag) (can-move ?ag ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ;; Pick up a block that is on another block.
  (:action pickup-from-block
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and (on ?b ?under) (clear ?b) (handempty ?ag) (can-move ?ag ?b))
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ;; Put a held block down onto the table.
  (:action putdown-to-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  ;; Put a held block onto another clear block.
  (:action put-on-block
    :parameters (?ag - agent ?b - block ?target - block)
    :precondition (and (holding ?ag ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )
)