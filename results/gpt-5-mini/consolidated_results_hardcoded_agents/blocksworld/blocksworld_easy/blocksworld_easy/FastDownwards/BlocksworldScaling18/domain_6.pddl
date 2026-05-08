(define (domain blocks-world-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)       ; ?x is on top of ?y
    (ontable ?x - block)             ; ?x is on the table
    (clear ?x - block)               ; nothing on top of ?x and it is not held
    (holding ?x - block)             ; agent is holding ?x
    (handempty)                      ; agent's hand is empty
    (current ?s - stage)             ; current discrete stage/timepoint
    (next ?s1 - stage ?s2 - stage)   ; successor relation between stages (static)
  )

  ;; Pick up a clear block from the table into the hand; advance to the immediate successor stage.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put a held block down onto the table; advance to the immediate successor stage.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block into the hand; advance to the immediate successor stage.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)            ; removing ?b exposes ?c
      (not (on ?b ?c))
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block onto a clear block; advance to the immediate successor stage.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))     ; target is no longer clear after stacking
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)