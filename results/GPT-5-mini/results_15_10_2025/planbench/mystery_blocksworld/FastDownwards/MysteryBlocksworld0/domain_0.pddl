(define (domain multiagent-domain)
  (:requirements :strips)
  (:predicates
    (next ?x ?y)
  )

  ;; Actions derived from expert descriptions.
  ;; Each action requires an existing next relation and produces a new next link.
  ;; Agents are modeled implicitly via action names; actions with the same name but
  ;; different roles would be kept distinct (not applicable here).

  (:action paltry
    :parameters (?a ?b)
    :precondition (next ?a ?b)
    :effect (and
      (next object_2 ?b)
    )
  )

  (:action sip
    :parameters (?a ?b)
    :precondition (next ?a ?b)
    :effect (and
      (next object_3 object_6)
    )
  )

  (:action clip
    :parameters (?a ?b)
    :precondition (next ?a ?b)
    :effect (and
      (next object_4 object_5)
    )
  )

  (:action wretched
    :parameters (?a ?b)
    :precondition (next ?a ?b)
    :effect (and
      (next object_5 object_6)
    )
  )

  (:action memory
    :parameters (?a ?b)
    :precondition (next ?a ?b)
    :effect (and
      (next object_6 object_6)
    )
  )

  ;; tightfisted is the action that can establish the required goal link
  (:action tightfisted
    :parameters (?a ?b)
    :precondition (next ?a ?b)
    :effect (and
      (next object_8 object_6)
    )
  )
)