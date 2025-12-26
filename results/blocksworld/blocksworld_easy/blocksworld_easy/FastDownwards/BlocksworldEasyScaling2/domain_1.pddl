(define (domain BlocksworldEasyScaling2)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block - object
  )
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Action 1: Pick up a block from the table
  ;; Preconditions: Hand empty, block on table, block is clear (no blocks on top and not currently held)
  (:action pick-up
    :parameters (?b - block)
    :precondition (and 
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (ontable ?b))
      (not (clear ?b)) ; Block is no longer clear when held
    )
  )

  ;; Action 2: Unstack a block from another block
  ;; Preconditions: Hand empty, b1 on b2, b1 is clear
  (:action unstack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and
      (handempty)
      (on ?b1 ?b2)
      (clear ?b1)
    )
    :effect (and
      (holding ?b1)
      (clear ?b2) ; b2 becomes clear
      (not (handempty))
      (not (on ?b1 ?b2))
      (not (clear ?b1)) ; b1 is no longer clear when held
    )
  )

  ;; Action 3: Put down a block onto the table
  ;; Preconditions: Holding the block
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (handempty)
      (ontable ?b)
      (clear ?b) ; Block becomes clear when placed on the table
      (not (holding ?b))
    )
  )

  ;; Action 4: Stack a block onto another block
  ;; Preconditions: Holding b1, target b2 is clear
  (:action stack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and
      (holding ?b1)
      (clear ?b2)
    )
    :effect (and
      (handempty)
      (on ?b1 ?b2)
      (clear ?b1) ; b1 is now the top block and clear
      (not (holding ?b1))
      (not (clear ?b2)) ; b2 is no longer clear
    )
  )
)