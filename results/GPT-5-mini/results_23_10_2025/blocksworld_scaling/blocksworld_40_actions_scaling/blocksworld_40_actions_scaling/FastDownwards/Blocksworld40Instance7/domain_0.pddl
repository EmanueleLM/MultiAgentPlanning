(define (domain blocksworld-multiagent)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding-r1 ?x - block)
    (holding-r2 ?x - block)
    (handempty-r1)
    (handempty-r2)
  )

  ;; Robot 1 actions
  (:action unstack-r1
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-r1))
    :effect (and
      (holding-r1 ?x)
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-r1))
    )
  )

  (:action stack-r1
    :parameters (?x - block ?y - block)
    :precondition (and (holding-r1 ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-r1 ?x))
      (handempty-r1)
    )
  )

  (:action pickup-r1
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-r1))
    :effect (and
      (holding-r1 ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-r1))
    )
  )

  (:action putdown-r1
    :parameters (?x - block)
    :precondition (and (holding-r1 ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-r1 ?x))
      (handempty-r1)
    )
  )

  ;; Robot 2 actions
  (:action unstack-r2
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty-r2))
    :effect (and
      (holding-r2 ?x)
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-r2))
    )
  )

  (:action stack-r2
    :parameters (?x - block ?y - block)
    :precondition (and (holding-r2 ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-r2 ?x))
      (handempty-r2)
    )
  )

  (:action pickup-r2
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty-r2))
    :effect (and
      (holding-r2 ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-r2))
    )
  )

  (:action putdown-r2
    :parameters (?x - block)
    :precondition (and (holding-r2 ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-r2 ?x))
      (handempty-r2)
    )
  )
)