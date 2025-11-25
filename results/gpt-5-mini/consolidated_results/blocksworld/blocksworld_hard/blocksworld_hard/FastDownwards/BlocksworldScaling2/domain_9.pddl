(define (domain blocksworld-scaling2)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (phase ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  (:action pickup
    :parameters (?b - block ?s - stage ?s1 - stage)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty)
                    (phase ?s)
                    (next ?s ?s1))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
              (not (phase ?s))
              (phase ?s1))
  )

  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s1 - stage)
    :precondition (and
                    (on ?b ?c)
                    (clear ?b)
                    (handempty)
                    (phase ?s)
                    (next ?s ?s1))
    :effect (and
              (not (on ?b ?c))
              (holding ?b)
              (not (handempty))
              (clear ?c)
              (not (clear ?b))
              (not (phase ?s))
              (phase ?s1))
  )

  (:action putdown
    :parameters (?b - block ?s - stage ?s1 - stage)
    :precondition (and
                    (holding ?b)
                    (phase ?s)
                    (next ?s ?s1))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (phase ?s))
              (phase ?s1))
  )

  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s1 - stage)
    :precondition (and
                    (holding ?b)
                    (clear ?c)
                    (phase ?s)
                    (next ?s ?s1)
                    (not (on ?c ?b)))
    :effect (and
              (on ?b ?c)
              (not (holding ?b))
              (handempty)
              (not (clear ?c))
              (clear ?b)
              (not (phase ?s))
              (phase ?s1))
  )
)