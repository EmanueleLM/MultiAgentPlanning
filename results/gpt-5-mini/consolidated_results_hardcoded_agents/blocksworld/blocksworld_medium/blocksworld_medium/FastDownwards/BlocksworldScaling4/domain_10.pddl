(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)       ; x is on y
    (ontable ?x - block)             ; x is on the table
    (clear ?x - block)               ; nothing on top of x and x is not held
    (holding ?x - block)             ; x is in the hand
    (handempty)                      ; the hand is empty
    (at-stage ?s - stage)            ; current global stage/timepoint
    (succ ?s1 - stage ?s2 - stage)   ; immediate successor relation on stages
    (diff ?x - block ?y - block)     ; explicitly state inequality between blocks
  )

  ;; Pick up a clear block from the table into the hand, advancing the stage.
  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (handempty)
      (ontable ?x)
      (clear ?x)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (ontable ?x))
      (not (clear ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a clear block x from on top of y into the hand, freeing y, advancing the stage.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (handempty)
      (on ?x ?y)
      (clear ?x)
      (diff ?x ?y)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (ontable ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put the held block down onto the table, making it clear and emptying the hand, advancing the stage.
  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack the held block x on top of a clear block y, making y not clear, x clear (top), emptying the hand, advance stage.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (diff ?x ?y)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (ontable ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)