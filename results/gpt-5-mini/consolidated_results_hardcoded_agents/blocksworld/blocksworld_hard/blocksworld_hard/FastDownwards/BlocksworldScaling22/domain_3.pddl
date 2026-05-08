(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (ontable ?x - block)               ; block is directly on the table
    (on ?x - block ?y - block)         ; block ?x on block ?y
    (clear ?x - block)                 ; nothing on ?x and ?x is not held
    (holding ?x - block)               ; agent is holding ?x
    (handempty)                        ; agent's hand is empty
    (stage ?s - stage)                 ; stage/time object
    (next ?s1 - stage ?s2 - stage)     ; successor relation on stages
    (current ?s - stage)               ; which stage is active
  )

  ;; Pick up a clear block from the table (advance stage).
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
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put a held block down on the table (advance stage).
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

  ;; Unstack a clear block ?x from on top of block ?y (advance stage).
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
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block ?x onto a clear block ?y (advance stage).
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (current ?s))
      (current ?s2)
    )
  )
)