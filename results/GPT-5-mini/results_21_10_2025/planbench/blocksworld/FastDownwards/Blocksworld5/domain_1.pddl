(define (domain blocksworld5)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (handempty)
    (holding ?x - block)
    (ontable ?x - block)
    (on ?x - block ?y - block)
    (clear ?x - block)
  )

  ; Pick up a clear block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
             (not (ontable ?b))
             (not (clear ?b))
             (not (handempty))
             (holding ?b)
            )
  )

  ; Unstack a clear block from on top of another block
  (:action unstack
    :parameters (?b - block ?under - block)
    :precondition (and (on ?b ?under) (clear ?b) (handempty))
    :effect (and
             (not (on ?b ?under))
             (clear ?under)
             (not (clear ?b))
             (not (handempty))
             (holding ?b)
            )
  )

  ; Put down a block being held onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
             (ontable ?b)
             (clear ?b)
             (handempty)
             (not (holding ?b))
            )
  )

  ; Stack a held block on top of a clear block
  (:action stack
    :parameters (?b - block ?target - block)
    :precondition (and (holding ?b) (clear ?target))
    :effect (and
             (on ?b ?target)
             (not (clear ?target))
             (clear ?b)
             (handempty)
             (not (holding ?b))
            )
  )
)