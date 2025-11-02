(define (domain blocksworld)
  (:requirements :strips :negative-preconditions :typing)
  (:predicates
    (on ?x ?y)        ; block ?x is on block ?y
    (ontable ?x)      ; block ?x is on the table
    (clear ?x)        ; nothing is on block ?x
    (holding ?x)      ; the agent is holding block ?x
    (handempty)       ; the agent's hand is empty
  )

  ;; pickup: pick a block from the table
  (:action pickup
    :parameters (?b)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; putdown: put a held block down on the table
  (:action putdown
    :parameters (?b)
    :precondition (holding ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; stack: put a held block ?b onto clear block ?x
  (:action stack
    :parameters (?b ?x)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (handempty)
      (not (holding ?b))
    )
  )

  ;; unstack: take a clear top block ?b from block ?x
  (:action unstack
    :parameters (?b ?x)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
    )
  )
)