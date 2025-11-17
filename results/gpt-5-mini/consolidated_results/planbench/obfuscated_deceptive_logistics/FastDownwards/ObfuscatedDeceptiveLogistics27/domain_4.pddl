(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hand cat sneeze stupendous texture - obj
  )

  (:predicates
    ;; static / typed membership is expressed via PDDL types; these predicates
    ;; are only the relations that change or relate different types.
    (collect ?t - texture ?s - stupendous)   ;; static relation (keeps as predicate)
    (vase ?h - hand ?c - cat)                ;; dynamic: created/removed by actions
    (next ?x - obj ?y - texture)             ;; dynamic location-like relation (second arg is a texture)
    (spring ?t - texture)                    ;; small set; kept as predicate (overlaps with texture type)
  )

  ;; Actions follow the original semantics but rely on parameter typing to
  ;; avoid listing many static membership facts in the problem init.
  (:action paltry
    :parameters (?h - hand ?a - cat ?b - texture)
    :precondition (and
      (vase ?h ?a)
      (next ?a ?b)
    )
    :effect (and
      (next ?h ?b)
      (not (vase ?h ?a))
    )
  )

  (:action sip
    :parameters (?h - hand ?a - cat ?b - texture)
    :precondition (and
      (next ?h ?b)
      (next ?a ?b)
    )
    :effect (and
      (vase ?h ?a)
      (not (next ?h ?b))
    )
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?u - stupendous)
    :precondition (and
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - cat ?s1 - texture ?s2 - texture)
    :precondition (and
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and
      (vase ?h ?s)
      (next ?s ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)