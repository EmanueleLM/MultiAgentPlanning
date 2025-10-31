(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)     ; ?x is directly on block ?y
    (ontable ?x - block)           ; ?x is directly on the table
    (clear ?x - block)             ; nothing on ?x
    (holding ?x - block)           ; the agent is holding ?x
    (handempty)                    ; the agent's hand is empty
  )

  ;; Pick up a block from the table
  (:action pick-up
    :parameters (?b - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty)
                  )
    :effect (and
              (holding ?b)
              (not (ontable ?b))
              (not (handempty))
            )
  )

  ;; Unstack a block from another block
  (:action unstack
    :parameters (?b - block ?s - block)
    :precondition (and
                    (on ?b ?s)
                    (clear ?b)
                    (handempty)
                  )
    :effect (and
              (holding ?b)
              (not (on ?b ?s))
              (clear ?s)
              (not (handempty))
            )
  )

  ;; Put a held block down on the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and
                    (holding ?b)
                  )
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?b - block ?s - block)
    :precondition (and
                    (holding ?b)
                    (clear ?s)
                  )
    :effect (and
              (on ?b ?s)
              (clear ?b)
              (not (clear ?s))
              (handempty)
              (not (holding ?b))
            )
  )
)