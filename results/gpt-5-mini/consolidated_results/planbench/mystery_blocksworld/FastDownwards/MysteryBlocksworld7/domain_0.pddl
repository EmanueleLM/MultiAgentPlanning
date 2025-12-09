(define (domain cravings)
  ;; Domain modeling decisions:
  ;; - Types: object and step. Only the named objects (a,b,c,d) and explicit step symbols (s1,s2,s3,send) appear in the problem.
  ;; - The plan must create three craves facts in a fixed order: (craves a c) then (craves b a) then (craves d b).
  ;; - Order is enforced by an explicit step sequencing mechanism: step-current, step-next, required-step, and step-done predicates.
  ;; - Each required (x craves y) pair must first be prepared with the prepare action, then materialized with create-crave.
  ;; - No bookkeeping shortcuts or penalty actions are provided. Violating the order or skipping preparations is impossible due to preconditions.
  ;; - Only standard :strips, :typing, and :negative-preconditions are used so the domain is compatible with FastDownward.
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (step ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (step-current ?s - step)
    (step-done ?s - step)

    ;; required-step binds a particular (craves X Y) to the step in which it must be realized
    (required-step ?x - object ?y - object ?s - step)

    ;; staging and final facts
    (prepared ?x - object ?y - object)
    (craves ?x - object ?y - object)
  )

  ;; Prepare an object-pair for creation of a craving.
  ;; Must be executed while the plan's current step matches the required-step for that pair.
  (:action prepare
    :parameters (?x - object ?y - object ?s - step)
    :precondition (and
                    (step-current ?s)
                    (required-step ?x ?y ?s)
                    (not (prepared ?x ?y))
                    (not (craves ?x ?y))
                  )
    :effect (and
              (prepared ?x ?y)
            )
  )

  ;; Create the craves relation for the pair and advance the current step to the successor step.
  ;; The action requires that the pair was prepared and that the current step is the required step.
  (:action create-crave
    :parameters (?x - object ?y - object ?s - step ?snext - step)
    :precondition (and
                    (prepared ?x ?y)
                    (step-current ?s)
                    (required-step ?x ?y ?s)
                    (step-next ?s ?snext)
                    (not (craves ?x ?y))
                  )
    :effect (and
              (craves ?x ?y)
              (not (prepared ?x ?y))
              (not (step-current ?s))
              (step-current ?snext)
              (step-done ?s)
            )
  )
)