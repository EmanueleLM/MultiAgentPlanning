(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity stage)

  (:predicates
    (province ?x - entity)
    (planet   ?x - entity)
    (pain     ?x - entity)
    (craves   ?x - entity ?y - entity)
    (harmony)
    (current  ?s - stage)
    (succ     ?s - stage ?s2 - stage)
  )

  (:action attacker-attack
    :parameters (?p - entity ?t - entity ?s - stage ?s2 - stage)
    :precondition (and
                    (province ?p)
                    (planet ?t)
                    (harmony)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (pain ?p)
              (not (province ?p))
              (not (planet ?t))
              (not (harmony))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action feaster-feast
    :parameters (?x - entity ?y - entity ?s - stage ?s2 - stage)
    :precondition (and
                    (craves ?x ?y)
                    (province ?x)
                    (harmony)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (pain ?x)
              (province ?y)
              (not (craves ?x ?y))
              (not (province ?x))
              (not (harmony))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action succumber-succumb
    :parameters (?x - entity ?s - stage ?s2 - stage)
    :precondition (and
                    (pain ?x)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action overcomer-overcome
    :parameters (?u - entity ?v - entity ?s - stage ?s2 - stage)
    :precondition (and
                    (pain ?u)
                    (province ?v)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (harmony)
              (province ?u)
              (craves ?u ?v)
              (not (province ?v))
              (not (pain ?u))
              (not (current ?s))
              (current ?s2)
            )
  )
)