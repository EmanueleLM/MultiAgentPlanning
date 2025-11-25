(define (domain blocksworld-orchestrated)
  :requirements :strips :typing :negative-preconditions
  :types block place - object

  :predicates
    ;; on ?b ?x  : block ?b is directly on object ?x (object = block or place)
    (on ?b - block ?x - object)
    ;; clear ?b : top of block ?b has no block on it
    (clear ?b - block)
    ;; handempty : the single manipulator is free
    (handempty)
    ;; holding ?b : the single manipulator is holding block ?b
    (holding ?b - block)

  ;; Pick a block up from a place (table). Only allowed if the block is clear and the hand is empty.
  (:action pick-up
    :parameters (?b - block ?p - place)
    :precondition (and
      (on ?b ?p)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
    )
  )

  ;; Unstack a block from another block. The block being unstacked must be clear and the hand empty.
  (:action unstack
    :parameters (?b - block ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?under))
      ;; the block previously under becomes clear
      (clear ?under)
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
    )
  )

  ;; Put the held block down onto a place (table). After putting down, the hand becomes empty.
  (:action put-down
    :parameters (?b - block ?p - place)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  ;; Stack the held block onto another block. The target block must be clear.
  (:action stack
    :parameters (?b - block ?under - block)
    :precondition (and
      (holding ?b)
      (clear ?under)
    )
    :effect (and
      (on ?b ?under)
      ;; target block is no longer clear after stacking
      (not (clear ?under))
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )
)