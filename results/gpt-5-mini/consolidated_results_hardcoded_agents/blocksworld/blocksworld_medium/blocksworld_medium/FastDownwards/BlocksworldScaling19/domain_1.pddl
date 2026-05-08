(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (stage-active ?t - stage)        ; current active stage token (enforces linear progression)
    (next ?t1 - stage ?t2 - stage)   ; successor relation between stages (static)
  )

  ;; pick-up: pick a clear block from the table into the hand, advancing the stage token
  (:action pick-up
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )

  ;; unstack: remove a clear block from atop another block into the hand, advancing the stage token
  (:action unstack
    :parameters (?b - block ?c - block ?t - stage ?t2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )

  ;; put-down: put a held block onto the table, advancing the stage token
  (:action put-down
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )

  ;; stack: place a held block onto a clear block, advancing the stage token
  (:action stack
    :parameters (?b - block ?c - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (stage-active ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (stage-active ?t))
      (stage-active ?t2)
    )
  )
)