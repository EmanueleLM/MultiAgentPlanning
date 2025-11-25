(define (domain blocksworld-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; nothing is on ?x and it is not held
    (holding ?x - block)          ; the single hand is holding ?x
    (handempty)                   ; the single hand is empty
    (current ?s - stage)          ; current stage token
    (next ?s - stage ?s2 - stage) ; stage ordering relation
  )

  ;; Pick up a clear block from the table into the hand, advance stage
  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Unstack a clear block from on top of another block into the hand, making the support clear, advance stage
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (clear ?y)
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Put down a held block onto the table, advance stage
  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Stack a held block onto a clear block, advance stage
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (clear ?y))
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (current ?s))
              (current ?s2)
            )
  )
)