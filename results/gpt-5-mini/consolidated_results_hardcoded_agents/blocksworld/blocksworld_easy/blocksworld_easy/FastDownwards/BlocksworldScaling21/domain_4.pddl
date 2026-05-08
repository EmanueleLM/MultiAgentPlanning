(define (domain blocks-single-handed-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (handempty)
    (clear ?x - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

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

  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
      (not (= ?b ?c))
      (not (ontable ?b))
    )
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

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

  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?s)
      (next ?s ?s2)
      (not (= ?b ?c))
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)