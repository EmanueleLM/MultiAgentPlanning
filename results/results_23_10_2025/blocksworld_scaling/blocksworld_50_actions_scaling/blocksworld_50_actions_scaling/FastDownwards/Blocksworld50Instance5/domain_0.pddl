(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)     ; ?x is on top of ?y
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing on ?x
    (holding ?x - block)           ; robot is holding ?x
    (handempty)                    ; robot's hand is empty
  )

  ; Pickup a block from the table
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

  ; Put the held block down on the table
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

  ; Unstack a block from another block (pick it up)
  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ; Stack a held block onto another block
  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
    )
  )
)