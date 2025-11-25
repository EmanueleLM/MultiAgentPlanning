(define (domain BlocksworldScaling25)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)
    (at ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (at ?s)
      (succ ?s ?s2)
    )
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

  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (at ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )
)