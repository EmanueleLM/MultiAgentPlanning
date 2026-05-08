(define (domain linking-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage agent)

  (:predicates
    ;; directed successor at an explicit stage
    (next-at ?x - obj ?y - obj ?s - stage)

    ;; ordering of stages
    (stage-succ ?s1 - stage ?s2 - stage)

    ;; marks that a stage slot is already occupied
    (used-stage ?s - stage)

    ;; simple agent availability required to perform linking
    (available-agent ?a - agent)
  )

  ;; create a next-at fact at the later stage (occupies that stage)
  (:action link
    :parameters (?a - agent ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (available-agent ?a)
                    (stage-succ ?s ?s2)
                    (not (used-stage ?s2))
                  )
    :effect (and
              (next-at ?x ?y ?s2)
              (used-stage ?s2)
            )
  )
)