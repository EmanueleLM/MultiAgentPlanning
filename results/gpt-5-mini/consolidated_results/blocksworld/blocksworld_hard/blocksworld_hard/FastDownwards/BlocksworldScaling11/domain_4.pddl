(define (domain blocksworld-sequenced)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (on ?b ?p)            ; block ?b is on ?p (p may be a block or the table)
    (clear ?b)            ; block ?b has nothing on top of it
    (handempty)           ; the hand is empty
    (holding ?b)          ; the hand holds block ?b
    (allowed ?s)          ; stage ?s is the active stage
    (next ?s ?t)          ; stage ordering: ?t follows ?s
  )

  ;; Pick up a block from the table (must be clear and hand empty), advances stage
  (:action pickup-from-table
    :parameters (?b ?s ?s2)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on ?b table))
      (not (clear ?b))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Unstack a block from another block (must be clear and hand empty), advances stage
  (:action unstack
    :parameters (?b ?under ?s ?s2)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Put the held block down on the table, advances stage
  (:action putdown
    :parameters (?b ?s ?s2)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Stack the held block onto another clear block, advances stage
  (:action stack
    :parameters (?b ?target ?s ?s2)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )
)