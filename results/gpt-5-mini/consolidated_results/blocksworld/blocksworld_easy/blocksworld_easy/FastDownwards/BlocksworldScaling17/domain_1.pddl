(define (domain blocks-order-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?under - block)   ; ?b is directly on ?under
    (ontable ?b - block)             ; ?b is on the table
    (clear ?b - block)               ; nothing on top of ?b and ?b is not held
    (holding ?b - block)             ; the hand is holding ?b
    (handempty)                      ; the hand is empty
    (current ?s - stage)             ; the current discrete time/stage
    (next ?s1 - stage ?s2 - stage)   ; successor relation between stages
  )

  ;; Pick up a clear block from the table; consumes one stage (advances current)
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (current ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block; consumes one stage
  (:action unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and (on ?b ?below) (clear ?b) (handempty) (current ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table; consumes one stage
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?b) (current ?s) (next ?s ?s2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block onto another clear block; consumes one stage
  (:action stack
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?b) (clear ?target) (current ?s) (next ?s ?s2))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?target))
      (not (current ?s))
      (current ?s2)
    )
  )
)