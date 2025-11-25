(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (block ?x - object)
    (stage ?s - object)
    (next ?s1 - object ?s2 - object)
    (current ?s - object)
    (on ?x - object ?y - object)    ; ?y can be a block or the table object
    (clear ?x - object)
    (holding ?x - object)
    (handempty)
  )

  ;; Pick up a clear block from the table, advancing the current stage.
  (:action pickup
    :parameters (?x - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (on ?x table)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (on ?x table))
      (not (clear ?x))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put a held block down onto the table, advancing the current stage.
  (:action putdown
    :parameters (?x - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (holding ?x)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?x table)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block ?x from on top of block ?y, advancing the current stage.
  (:action unstack
    :parameters (?x - object ?y - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (block ?y)
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

  ;; Stack a held block ?x onto a clear block ?y, advancing the current stage.
  (:action stack
    :parameters (?x - object ?y - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (block ?y)
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