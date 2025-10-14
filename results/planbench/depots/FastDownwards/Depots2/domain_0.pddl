(define (domain objects_domain)
  ; Integrated domain derived from player & analyst summaries.
  ; Notes/assumptions:
  ; - Only predicates and actions explicitly listed in the provided analyses are encoded.
  ; - No additional initial facts or goal conditions were provided in the use-case statements;
  ;   therefore the problem file must supply those externally. To avoid inventing availability or goals
  ;   we leave the example problem initial state empty of these predicate facts and the goal as the empty conjunction.
  ; - All actions are classical STRIPS: preconditions are positive conjunctions, effects are adds and deletes.
  ; - We include :negative-preconditions support so delete effects are permitted (Fast Downward compatible).
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (collect ?x ?y)
    (spring ?x)
    (stupendous ?x)
  )

  ; paltry object_0 object_1 object_2:
  ; requires hand ?a, cats ?b, texture ?c, vase ?a ?b, next ?b ?c
  ; effects: add next ?a ?c, del vase ?a ?b
  (:action paltry
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ; sip object_0 object_1 object_2:
  ; requires hand ?a, cats ?b, texture ?c, next ?a ?c, next ?b ?c
  ; effects: add vase ?a ?b, del next ?a ?c
  (:action sip
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ; clip object_0 object_1 object_2:
  ; requires hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c
  ; effects: add vase ?a ?b, del next ?a ?c
  (:action clip
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ; wretched object_0 object_1 object_2 object_3:
  ; requires sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ; effects: add next ?a ?c, del next ?a ?b
  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ; memory object_0 object_1 object_2:
  ; requires cats ?a, spring ?b, spring ?c, next ?a ?b
  ; effects: add next ?a ?c, del next ?a ?b
  (:action memory
    :parameters (?a ?b ?c)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ; tightfisted object_0 object_1 object_2:
  ; requires hand ?a, sneeze ?b, texture ?c, next ?b ?c, vase ?a ?b
  ; effects: add next ?a ?c, del vase ?a ?b
  (:action tightfisted
    :parameters (?a ?b ?c)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

)