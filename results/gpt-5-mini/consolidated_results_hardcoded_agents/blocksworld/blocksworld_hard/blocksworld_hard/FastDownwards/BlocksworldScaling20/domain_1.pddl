(define (domain blocks-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (hand-empty)
    (holding ?b - block)
    (clear ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (at ?s - step)
    (next ?s - step ?s2 - step)
  )

  ;; Pick up a clear block from the table at a given stage, advancing to the successor stage.
  (:action pick-up
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (hand-empty)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b))
      (not (hand-empty))
      (not (clear ?b))    ;; while held a block is not considered clear per the specification
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Unstack a clear block from atop another block at a given stage, advancing to the successor stage.
  (:action unstack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (hand-empty)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)           ;; removing ?b from ?c makes ?c clear (and ?c is not held)
      (not (on ?b ?c))
      (not (hand-empty))
      (not (clear ?b))     ;; held blocks are not clear
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Put a held block down onto the table at a given stage, advancing to the successor stage.
  (:action put-down
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)           ;; on the table and not held -> clear (no block on top)
      (hand-empty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Stack a held block onto a clear block at a given stage, advancing to the successor stage.
  (:action stack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)           ;; newly placed top block has no block above and is not held
      (not (clear ?c))     ;; the support block is no longer clear
      (hand-empty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )
)