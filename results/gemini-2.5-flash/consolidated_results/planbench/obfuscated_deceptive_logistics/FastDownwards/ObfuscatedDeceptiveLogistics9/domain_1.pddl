(define (domain ObfuscatedDeceptiveLogistics9)
    (:requirements :strips :typing :negative-preconditions)
    (:types obj)

    (:predicates
        (hand ?o - obj)
        (cats ?o - obj)
        (sneeze ?o - obj)
        (spring ?o - obj)
        (texture ?o - obj)
        (stupendous ?o - obj)
        
        (next ?o1 - obj ?o2 - obj)
        (vase ?o1 - obj ?o2 - obj)
        (collect ?o1 - obj ?o2 - obj)
    )

    ;; Action Paltry(o0, o1, o2): PRECONDITIONS (hand o0, cats o1, texture o2, vase o0 o1, next o1 o2); EFFECTS (ADD next o0 o2; DEL vase o0 o1).
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

    ;; Action Sip(o0, o1, o2): PRECONDITIONS (hand o0, cats o1, texture o2, next o0 o2, next o1 o2); EFFECTS (ADD vase o0 o1; DEL next o0 o2).
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

    ;; Action Clip(o0, o1, o2): PRECONDITIONS (hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2); EFFECTS (ADD vase o0 o1; DEL next o0 o2).
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

    ;; Action Wretched(o0, o1, o2, o3): PRECONDITIONS (sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3); EFFECTS (ADD next o0 o2; DEL next o0 o1).
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

    ;; Action Memory(o0, o1, o2): PRECONDITIONS (cats o0, spring o1, spring o2, next o0 o1); EFFECTS (ADD next o0 o2; DEL next o0 o1).
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

    ;; Action Tightfisted(o0, o1, o2): PRECONDITIONS (hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1); EFFECTS (ADD next o0 o2; DEL vase o0 o1).
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