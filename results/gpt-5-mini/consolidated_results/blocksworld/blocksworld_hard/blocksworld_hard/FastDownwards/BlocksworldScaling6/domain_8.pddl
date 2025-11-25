(define (domain BlocksworldScaling6)
  (:requirements :strips :typing)
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
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?t))
      (current ?t2)
    )
  )

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
      (not (clear ?b))
      (clear ?below)
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action putdown
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )

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
      (not (ontable ?b))
      (not (clear ?target))
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )
)