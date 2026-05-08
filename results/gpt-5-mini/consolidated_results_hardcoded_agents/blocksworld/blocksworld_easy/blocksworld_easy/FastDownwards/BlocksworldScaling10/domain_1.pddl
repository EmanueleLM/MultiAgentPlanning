(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (ontable ?b - block)
    (on ?x - block ?y - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table into the single hand, advancing to the successor stage.
  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (ontable ?x) (clear ?x) (handempty) (at ?s) (succ ?s ?s2))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))        ;; held blocks are not clear
      (not (handempty))
      (holding ?x)
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block into the single hand, advancing stage.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (at ?s) (succ ?s ?s2))
    :effect (and
      (not (on ?x ?y))
      (holding ?x)
      (not (handempty))
      (clear ?y)              ;; the lower block becomes clear after unstack
      (not (clear ?x))        ;; held blocks are not clear
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Put a held block down onto the table, advancing stage.
  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (at ?s) (succ ?s ?s2))
    :effect (and
      (ontable ?x)
      (clear ?x)              ;; on the table and not held -> clear (no block on top)
      (handempty)
      (not (holding ?x))
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Stack a held block onto another clear block, advancing stage.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (at ?s) (succ ?s ?s2))
    :effect (and
      (on ?x ?y)
      (clear ?x)              ;; stacked block has no block on top immediately after stacking
      (handempty)
      (not (holding ?x))
      (not (clear ?y))        ;; the support block is no longer clear
      (not (ontable ?x))      ;; ensure x is not simultaneously on the table
      (not (at ?s))
      (at ?s2)
    )
  )
)