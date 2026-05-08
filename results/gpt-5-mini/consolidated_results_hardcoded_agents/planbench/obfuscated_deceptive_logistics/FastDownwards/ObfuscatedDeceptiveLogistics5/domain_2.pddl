(define (domain obfuscated-deceptive-logistics5)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    hand_obj - obj
    cats_obj - obj
    sneeze_obj - obj
    stupendous_obj - obj
  )

  (:predicates
    (next ?a - obj ?b - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (spring ?o - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; Action: paltry
  ;; Preconditions: (hand ?o0) and (cats ?o1) are enforced by types
  ;; Other preconditions: texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; Effects: add next ?o0 ?o2, delete vase ?o0 ?o1
  (:action paltry
    :parameters (?o0 - hand_obj ?o1 - cats_obj ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; Action: sip
  ;; Preconditions: hand ?o0, cats ?o1 by types; texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; Effects: add vase ?o0 ?o1, delete next ?o0 ?o2
  (:action sip
    :parameters (?o0 - hand_obj ?o1 - cats_obj ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; Action: clip
  ;; Preconditions: hand ?o0 by type, sneeze ?o1 by type; texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; Effects: add vase ?o0 ?o1, delete next ?o0 ?o2
  (:action clip
    :parameters (?o0 - hand_obj ?o1 - sneeze_obj ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; Action: wretched
  ;; Preconditions: sneeze ?o0 by type; texture ?o1, texture ?o2, stupendous ?o3 by type,
  ;;                next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; Effects: add next ?o0 ?o2, delete next ?o0 ?o1
  (:action wretched
    :parameters (?o0 - sneeze_obj ?o1 - obj ?o2 - obj ?o3 - stupendous_obj)
    :precondition (and
      (texture ?o1)
      (texture ?o2)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; Action: memory
  ;; Preconditions: cats ?o0 by type; spring ?o1, spring ?o2, next ?o0 ?o1
  ;; Effects: add next ?o0 ?o2, delete next ?o0 ?o1
  (:action memory
    :parameters (?o0 - cats_obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; Action: tightfisted
  ;; Preconditions: hand ?o0 by type, sneeze ?o1 by type; texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; Effects: add next ?o0 ?o2, delete vase ?o0 ?o1
  (:action tightfisted
    :parameters (?o0 - hand_obj ?o1 - sneeze_obj ?o2 - obj)
    :precondition (and
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