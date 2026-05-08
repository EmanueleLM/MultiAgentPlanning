(define (domain blocks-singlehanded)
  (:requirements :typing :strips :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Unstack a block ?x from on top of ?y. Advances stage from ?s to ?s2.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (clear ?y)           ; removing ?x exposes ?y
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))     ; held block is not clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Pick up a clear block from the table. Advances stage from ?s to ?s2.
  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (handempty))
      (not (clear ?x))     ; held block is not clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table. Advances stage from ?s to ?s2.
  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (current ?s)
      (succ ?s ?s2)
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

  ;; Stack a held block ?x onto a clear block ?y. Advances stage from ?s to ?s2.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)           ; placed block has nothing on it
      (handempty)
      (not (holding ?x))
      (not (clear ?y))     ; destination is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )
)