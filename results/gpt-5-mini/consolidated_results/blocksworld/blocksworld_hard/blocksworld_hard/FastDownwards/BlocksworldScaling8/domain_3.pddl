(define (domain BlocksworldScaling8)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (at ?s - step)
    (next ?s - step ?s2 - step)
  )

  (:action picker_pick_up
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and (handempty) (ontable ?b) (clear ?b) (at ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (handempty))
      (not (clear ?b))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action picker_put_down
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and (holding ?b) (at ?s) (next ?s ?s2))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action stacker_unstack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and (handempty) (on ?b ?c) (clear ?b) (at ?s) (next ?s ?s2))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action stacker_stack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and (holding ?b) (clear ?c) (at ?s) (next ?s ?s2))
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )
)