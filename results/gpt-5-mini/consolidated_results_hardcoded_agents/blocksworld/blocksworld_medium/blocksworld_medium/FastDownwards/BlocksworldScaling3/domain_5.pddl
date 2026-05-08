(define (domain blocks-world-with-time)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (now ?t - step)
    (succ ?t - step ?t2 - step)
  )

  ;; Pick up a clear block from the table at the current step and move time forward.
  (:action pickup
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (now ?t) (succ ?t ?t2))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))         ;; a held block is not clear by definition
      (not (handempty))
      (holding ?b)
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Put down a held block onto the table at the current step and move time forward.
  (:action putdown
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and (holding ?b) (now ?t) (succ ?t ?t2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      ;; ensure the block is not concurrently marked on another block
      ;; (no explicit removal of all possible (on ?b ?x) pairs is expressible here,
      ;; but actions that create (on ...) remove ontable and actions that pick/unstack
      ;; remove (on ...) as appropriate)
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Unstack a clear block from on top of another block at the current step and move time forward.
  (:action unstack
    :parameters (?b - block ?under - block ?t - step ?t2 - step)
    :precondition (and (on ?b ?under) (clear ?b) (handempty) (now ?t) (succ ?t ?t2))
    :effect (and
      (holding ?b)
      (clear ?under)           ;; removing top makes the under block clear
      (not (on ?b ?under))
      (not (clear ?b))
      (not (handempty))
      ;; held block is not on the table
      (not (ontable ?b))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Stack a held block on a clear target block at the current step and move time forward.
  (:action stack
    :parameters (?b - block ?under - block ?t - step ?t2 - step)
    :precondition (and (holding ?b) (clear ?under) (now ?t) (succ ?t ?t2))
    :effect (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?under))
      ;; the block placed cannot be on the table at the same time
      (not (ontable ?b))
      (not (now ?t))
      (now ?t2)
    )
  )
)