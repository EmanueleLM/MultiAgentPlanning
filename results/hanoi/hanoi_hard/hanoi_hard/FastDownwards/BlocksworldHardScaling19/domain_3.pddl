(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types
    block
  )
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )

  ; Action: Pick up block X from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty)) (holding ?x))
  )

  ; Action: Put down block X onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (not (holding ?x)) (ontable ?x) (clear ?x) (handempty))
  )

  ; Action: Stack block X (held) onto block Y (clear)
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (handempty) (on ?x ?y))
  )

  ; Action: Unstack block X (clear) from block Y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)) (clear ?y))
  )
)