(define (domain BlocksworldScaling6)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (current ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))         ; holding means not clear (clear defined as "no block on top and not picked up")
      (not (handempty))
      (holding ?b)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a block from on top of another block
  (:action unstack
    :parameters (?b - block ?below - block ?t - stage ?t2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?b ?below))
      (holding ?b)
      (not (clear ?b))       ; now picked up, so not clear
      (clear ?below)         ; the block below becomes clear once top removed
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)             ; when put down nothing on top and not held -> clear
      (not (holding ?b))
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack a held block on top of another clear block
  (:action stack
    :parameters (?b - block ?target - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?b ?target)
      (not (clear ?target))  ; the block receiving b is no longer clear
      (clear ?b)             ; the placed block has nothing on top and is not held -> clear
      (not (holding ?b))
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )
)