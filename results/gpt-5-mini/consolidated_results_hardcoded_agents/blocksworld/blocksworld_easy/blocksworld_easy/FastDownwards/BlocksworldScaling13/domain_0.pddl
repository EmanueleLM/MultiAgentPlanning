(define (domain stacker)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (ontable ?x - block)
    (on ?x - block ?y - block)
    (holding ?x - block)
    (clear ?x - block)
    (handempty)
  )

  ;; Pick up a clear block from the table.
  (:action pick_up
    :parameters (?x - block)
    :precondition (and
      (handempty)
      (ontable ?x)
      (clear ?x)
    )
    :effect (and
      (holding ?x)
      ;; location exclusivity: remove table location when held
      (not (ontable ?x))
      ;; the hand is no longer empty
      (not (handempty))
      ;; NOTE: clear(?x) is left unchanged here. clear means "no block on top";
      ;; a block that was clear when picked remains clear while held.
    )
  )

  ;; Unstack a clear block ?x from block ?y (makes ?y clear).
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (handempty)
      (on ?x ?y)
      (clear ?x)
    )
    :effect (and
      (holding ?x)
      (clear ?y)            ;; removing ?x makes ?y clear
      ;; remove the on relation for the moved block
      (not (on ?x ?y))
      ;; ensure location exclusivity for ?x
      (not (ontable ?x))
      ;; the hand is no longer empty
      (not (handempty))
    )
  )

  ;; Put the held block down onto the table.
  (:action put_down
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Stack the held block ?x onto a clear block ?y.
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      ;; placing ?x on ?y makes ?y not clear
      (not (clear ?y))
      ;; ensure location exclusivity for ?x
      (not (ontable ?x))
      ;; stop holding and free the hand
      (handempty)
      (not (holding ?x))
      ;; clear(?x) remains as-is: placing a block that has no block on it keeps it clear.
    )
  )
)