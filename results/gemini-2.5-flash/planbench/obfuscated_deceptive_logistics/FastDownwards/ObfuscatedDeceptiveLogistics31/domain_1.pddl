(define (domain obfuscated_deceptive_logistics_31)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        obj
    )
    (:predicates
        (is_hand ?o - obj)
        (is_cats ?o - obj)
        (is_sneeze ?o - obj)
        (is_texture ?o - obj)
        (is_spring ?o - obj)
        (is_stupendous ?o - obj)
        (has_vase ?h - obj ?c - obj)
        (is_next ?carrier - obj ?destination - obj)
        (is_collected ?texture_item - obj ?stupendous_target - obj)
        (unlocated ?carrier - obj)
    )

    (:action paltry
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
        :precondition (and
            (is_hand ?o0)
            (is_cats ?o1)
            (is_texture ?o2)
            (has_vase ?o0 ?o1)
            (is_next ?o1 ?o2)
            (unlocated ?o0)
        )
        :effect (and
            (is_next ?o0 ?o2)
            (not (has_vase ?o0 ?o1))
            (not (unlocated ?o0))
        )
    )

    (:action sip
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
        :precondition (and
            (is_hand ?o0)
            (is_cats ?o1)
            (is_texture ?o2)
            (is_next ?o0 ?o2)
            (is_next ?o1 ?o2)
        )
        :effect (and
            (has_vase ?o0 ?o1)
            (not (is_next ?o0 ?o2))
            (unlocated ?o0)
        )
    )

    (:action clip
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
        :precondition (and
            (is_hand ?o0)
            (is_sneeze ?o1)
            (is_texture ?o2)
            (is_next ?o1 ?o2)
            (is_next ?o0 ?o2)
        )
        :effect (and
            (has_vase ?o0 ?o1)
            (not (is_next ?o0 ?o2))
            (unlocated ?o0)
        )
    )

    (:action wretched
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
        :precondition (and
            (is_sneeze ?o0)
            (is_texture ?o1)
            (is_texture ?o2)
            (is_stupendous ?o3)
            (is_next ?o0 ?o1)
            (is_collected ?o1 ?o3)
            (is_collected ?o2 ?o3)
        )
        :effect (and
            (is_next ?o0 ?o2)
            (not (is_next ?o0 ?o1))
        )
    )

    (:action memory
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
        :precondition (and
            (is_cats ?o0)
            (is_spring ?o1)
            (is_spring ?o2)
            (is_next ?o0 ?o1)
        )
        :effect (and
            (is_next ?o0 ?o2)
            (not (is_next ?o0 ?o1))
        )
    )

    (:action tightfisted
        :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
        :precondition (and
            (is_hand ?o0)
            (is_sneeze ?o1)
            (is_texture ?o2)
            (is_next ?o1 ?o2)
            (has_vase ?o0 ?o1)
            (unlocated ?o0)
        )
        :effect (and
            (is_next ?o0 ?o2)
            (not (has_vase ?o0 ?o1))
            (not (unlocated ?o0))
        )
    )
)