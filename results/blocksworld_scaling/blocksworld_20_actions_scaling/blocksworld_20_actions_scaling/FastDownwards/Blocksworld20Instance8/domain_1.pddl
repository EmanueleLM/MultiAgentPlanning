(define (domain blocksworld20instance8)
  :requirements :strips :typing :negative-preconditions
  :types block
  :predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  ;; Pickup a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (not (ontable ?x))
              (not (handempty))
              (holding ?x)
            )
  )
  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (handempty)
              (not (holding ?x))
              (clear ?x)
            )
  )
  ;; Unstack a block from another block (take top block)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (handempty))
            )
  )
  ;; Stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (handempty)
              (not (holding ?x))
            )
  )
)