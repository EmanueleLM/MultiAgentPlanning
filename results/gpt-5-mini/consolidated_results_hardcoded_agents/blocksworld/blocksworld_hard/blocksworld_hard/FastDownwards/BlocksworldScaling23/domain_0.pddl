(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Pick up a block from the table. Requires hand empty and the block clear.
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
            )
  )

  ;; Put down a held block onto the table. Leaves the block clear and hand empty.
  (:action putdown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; Unstack a block from on top of another block.
  ;; Makes the support block clear, makes the agent hold the unstacked block.
  (:action unstack
    :parameters (?b - block ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (clear ?s)
              (not (on ?b ?s))
              (not (clear ?b))
              (not (handempty))
            )
  )

  ;; Stack a held block onto another clear block.
  ;; Result: the stacked block is on the destination, the destination is no longer clear,
  ;; the stacked block is not held and becomes clear, and the hand is empty.
  (:action stack
    :parameters (?b - block ?s - block)
    :precondition (and (holding ?b) (clear ?s))
    :effect (and
              (on ?b ?s)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (clear ?s))
            )
  )
)