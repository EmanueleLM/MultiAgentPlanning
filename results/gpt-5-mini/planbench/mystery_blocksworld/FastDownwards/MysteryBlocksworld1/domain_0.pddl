(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent entity)

  ;; Predicates
  ;; craves ?x ?y  - entity ?x currently craves entity ?y
  ;; target-agent1 ?x ?y - agent1 is authorized/required to make ?x crave ?y
  ;; target-agent2 ?x ?y - agent2 is authorized/required to make ?x crave ?y
  (:predicates
    (craves ?x - entity ?y - entity)
    (target-agent1 ?x - entity ?y - entity)
    (target-agent2 ?x - entity ?y - entity)
  )

  ;; Action by agent1: can only create the specific crave pair(s) it is assigned to.
  (:action agent1_create-crave
    :parameters (?x - entity ?y - entity)
    :precondition (and
                    (target-agent1 ?x ?y)
                    (not (craves ?x ?y))
                  )
    :effect (and
              (craves ?x ?y)
            )
  )

  ;; Action by agent2: can only create the specific crave pair(s) it is assigned to.
  (:action agent2_create-crave
    :parameters (?x - entity ?y - entity)
    :precondition (and
                    (target-agent2 ?x ?y)
                    (not (craves ?x ?y))
                  )
    :effect (and
              (craves ?x ?y)
            )
  )
)