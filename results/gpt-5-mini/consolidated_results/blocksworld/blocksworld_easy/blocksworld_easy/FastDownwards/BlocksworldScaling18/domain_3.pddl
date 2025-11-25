(define (domain blocks-world-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (on ?x - block ?y - block)     ; ?x is on top of ?y
    (ontable ?x - block)           ; ?x is on the table
    (clear ?x - block)             ; nothing on top of ?x and it is not held
    (holding ?x - block)           ; the agent is holding ?x
    (handempty)                    ; the agent's hand is empty
    (current ?s - stage)           ; the current discrete stage/timepoint
    (next ?s1 - stage ?s2 - stage) ; successor relation between stages
  )

  ;; Pick up a block from the table and hold it; advance the current stage.
  (:action pick-up
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put down a held block onto the table; advance the current stage.
  (:action put-down
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a block from on top of another block and hold it; advance the current stage.
  (:action unstack
    :parameters (?b - block ?c - block ?t - stage ?t2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)            ; removing ?b exposes ?c
      (not (on ?b ?c))
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack a held block onto another clear block; advance the current stage.
  (:action stack
    :parameters (?b - block ?c - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))   ; target is no longer clear after stacking
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?t))
      (current ?t2)
    )
  )
)