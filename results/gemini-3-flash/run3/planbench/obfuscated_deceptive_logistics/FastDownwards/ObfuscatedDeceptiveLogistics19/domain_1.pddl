(define (domain obfuscated_deceptive_logistics_19)
    (:requirements :strips :typing)
    (:types obj)
    (:predicates
      (hand ?o)
      (cats ?o)
      (sneeze ?o)
      (texture ?o)
      (stupendous ?o)
      (spring ?o)
      (next ?agent_or_hand ?loc)
      (vase ?hand ?agent)
      (collect ?loc ?region)
    )

    ;; paltry(hand, cats, texture) - Unload cats
    (:action paltry
      :parameters (?v0 - obj ?v1 - obj ?v2 - obj)
      :precondition (and (hand ?v0) (cats ?v1) (texture ?v2) (vase ?v0 ?v1) (next ?v1 ?v2))
      :effect (and (next ?v0 ?v2) (not (vase ?v0 ?v1)))
    )

    ;; sip(hand, cats, texture) - Load cats
    (:action sip
      :parameters (?v0 - obj ?v1 - obj ?v2 - obj)
      :precondition (and (hand ?v0) (cats ?v1) (texture ?v2) (next ?v0 ?v2) (next ?v1 ?v2))
      :effect (and (vase ?v0 ?v1) (not (next ?v0 ?v2)))
    )

    ;; clip(hand, sneeze, texture) - Load sneeze
    (:action clip
      :parameters (?v0 - obj ?v1 - obj ?v2 - obj)
      :precondition (and (hand ?v0) (sneeze ?v1) (texture ?v2) (next ?v1 ?v2) (next ?v0 ?v2))
      :effect (and (vase ?v0 ?v1) (not (next ?v0 ?v2)))
    )

    ;; wretched(sneeze, from, to, stupendous) - Move sneeze
    (:action wretched
      :parameters (?v0 - obj ?v1 - obj ?v2 - obj ?v3 - obj)
      :precondition (and (sneeze ?v0) (texture ?v1) (texture ?v2) (stupendous ?v3) (next ?v0 ?v1) (collect ?v1 ?v3) (collect ?v2 ?v3))
      :effect (and (next ?v0 ?v2) (not (next ?v0 ?v1)))
    )

    ;; memory(cats, from, to) - Move cats between springs
    (:action memory
      :parameters (?v0 - obj ?v1 - obj ?v2 - obj)
      :precondition (and (cats ?v0) (spring ?v1) (spring ?v2) (next ?v0 ?v1))
      :effect (and (next ?v0 ?v2) (not (next ?v0 ?v1)))
    )

    ;; tightfisted(hand, sneeze, texture) - Unload sneeze
    (:action tightfisted
      :parameters (?v0 - obj ?v1 - obj ?v2 - obj)
      :precondition (and (hand ?v0) (sneeze ?v1) (texture ?v2) (next ?v1 ?v2) (vase ?v0 ?v1))
      :effect (and (next ?v0 ?v2) (not (vase ?v0 ?v1)))
    )
  )