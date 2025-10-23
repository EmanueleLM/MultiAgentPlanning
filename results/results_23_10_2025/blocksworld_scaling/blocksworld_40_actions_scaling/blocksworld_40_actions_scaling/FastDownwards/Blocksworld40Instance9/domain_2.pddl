(define (domain blocks)
  (:requirements :typing :strips :negative-preconditions)
  :types block
  :predicates
    (on ?x - block ?y - block)    ; ?x is on block ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing is on ?x
    (holding ?x - block)          ; the agent is holding ?x
    (handempty)                   ; the agent's hand is empty

  ;; pickup a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
             (not (ontable ?x))
             (not (handempty))
             (holding ?x)
            )
  )

  ;; put a held block down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
             (ontable ?x)
             (clear ?x)
             (handempty)
             (not (holding ?x))
            )
  )

  ;; unstack ?x from ?y (pick the top block ?x that is on ?y)
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

  ;; stack a held block ?x onto block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
             (on ?x ?y)
             (clear ?x)
             (handempty)
             (not (holding ?x))
             (not (clear ?y))
            )
  )
)