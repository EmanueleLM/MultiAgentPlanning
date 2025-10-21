(define (domain ObfuscatedDeceptiveLogistics18)
  ; Domain derived directly from the user's action schema descriptions.
  ; Modeling assumptions (conservative and explicit):
  ; - Predicates use arities as in the user's statements (e.g., vase is binary: vase ?x ?y).
  ; - All objects are of type obj.
  ; - No conditional effects are used; each action encodes the exact adds/deletes stated.
  ; Requirements are chosen for Fast Downward compatibility.
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)                 ; unary: holder/object in hand
    (cats ?x - obj)                 ; unary
    (texture ?x - obj)              ; unary
    (vase ?x - obj ?y - obj)        ; binary as used in the spec (vase object_0 object_1)
    (next ?x - obj ?y - obj)        ; binary
    (sneeze ?x - obj)               ; unary
    (stupendous ?x - obj)          ; unary
    (collect ?x - obj ?y - obj)     ; binary
    (spring ?x - obj)               ; unary
  )

  ; Action: paltry object_0 object_1 object_2
  ; Preconditions: hand(object_0), cats(object_1), texture(object_2), vase(object_0,object_1), next(object_1,object_2)
  ; Effects: add next(object_0,object_2); delete vase(object_0,object_1)
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ; Action: sip object_0 object_1 object_2
  ; Preconditions: hand(object_0), cats(object_1), texture(object_2), next(object_0,object_2), next(object_1,object_2)
  ; Effects: add vase(object_0,object_1); delete next(object_0,object_2)
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ; Action: clip object_0 object_1 object_2
  ; Preconditions: hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), next(object_0,object_2)
  ; Effects: add vase(object_0,object_1); delete next(object_0,object_2)
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ; Action: wretched object_0 object_1 object_2 object_3
  ; Preconditions: sneeze(object_0), texture(object_1), texture(object_2), stupendous(object_3),
  ;                next(object_0,object_1), collect(object_1,object_3), collect(object_2,object_3)
  ; Effects: add next(object_0,object_2); delete next(object_0,object_1)
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ; Action: memory object_0 object_1 object_2
  ; Preconditions: cats(object_0), spring(object_1), spring(object_2), next(object_0,object_1)
  ; Effects: add next(object_0,object_2); delete next(object_0,object_1)
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ; Action: tightfisted object_0 object_1 object_2
  ; Preconditions: hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), vase(object_0,object_1)
  ; Effects: add next(object_0,object_2); delete vase(object_0,object_1)
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)