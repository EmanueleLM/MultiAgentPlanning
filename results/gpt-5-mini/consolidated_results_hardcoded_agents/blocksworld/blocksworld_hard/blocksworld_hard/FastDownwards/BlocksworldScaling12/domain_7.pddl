(define (domain blocks-multi)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)
  (:predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action pick_up
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty ?ag)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?b ?c)
                    (clear ?b)
                    (handempty ?ag)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?c)
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action put_down
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?ag ?b)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (ontable ?b)
              (clear ?b)
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action stack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?c)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (on ?b ?c)
              (not (clear ?c))
              (clear ?b)
              (not (current ?s))
              (current ?s2)
            )
  )
)