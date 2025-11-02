(define (domain blocksworld7)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ; pick up a block from the table (hand must be empty, block must be clear and on the table)
  (:action pickup
    :parameters (?b - block)
    :precondition (and (handempty) (clear ?b) (ontable ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ; unstack a block from on top of another block (hand must be empty, block clear and on the other block)
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (handempty) (clear ?b) (on ?b ?c))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )

  ; put down a held block onto the table (must be holding it)
  (:action putdown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (not (holding ?b))
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
  )

  ; stack a held block onto another block (must hold block and target must be clear)
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (not (holding ?b))
      (handempty)
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
    )
  )
)