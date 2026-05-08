(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action pick-up
    :parameters (?b - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (at ?s))
      (at ?s')
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (at ?s))
      (at ?s')
    )
  )

  (:action put-down
    :parameters (?b - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (at ?s))
      (at ?s')
    )
  )

  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (holding ?b)
      (clear ?c)
      (not (on ?c ?b))
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?c)
      (not (ontable ?b))
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (at ?s))
      (at ?s')
    )
  )
)