(define (domain obfuscated_deceptive_logistics_31)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (is_hand ?o - object)
        (is_cats ?o - object)
        (is_sneeze ?o - object)
        (is_texture ?o - object)
        (is_spring ?o - object)
        (is_stupendous ?o - object)
        (has_vase ?o1 - object ?o2 - object)
        (next ?o1 - object ?o2 - object)
        (is_collected ?o1 - object ?o2 - object)
    )

    (:action paltry
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (is_hand ?o0)
            (is_cats ?o1)
            (is_texture ?o2)
            (has_vase ?o0 ?o1)
            (next ?o1 ?o2)
            (not (next ?o0 ?o2))
        )
        :effect (and
            (add (next ?o0 ?o2))
            (del (has_vase ?o0 ?o1))
        )
    )

    (:action sip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (is_hand ?o0)
            (is_cats ?o1)
            (is_texture ?o2)
            (next ?o0 ?o2)
            (next ?o1 ?o2)
            (not (has_vase ?o0 ?o1))
        )
        :effect (and
            (add (has_vase ?o0 ?o1))
            (del (next ?o0 ?o2))
        )
    )

    (:action clip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (is_hand ?o0)
            (is_sneeze ?o1)
            (is_texture ?o2)
            (next ?o1 ?o2)
            (next ?o0 ?o2)
            (not (has_vase ?o0 ?o1))
        )
        :effect (and
            (add (has_vase ?o0 ?o1))
            (del (next ?o0 ?o2))
        )
    )

    (:action wretched
        :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
        :precondition (and
            (is_sneeze ?o0)
            (is_texture ?o1)
            (is_texture ?o2)
            (is_stupendous ?o3)
            (next ?o0 ?o1)
            (is_collected ?o1 ?o3)
            (is_collected ?o2 ?o3)
            (not (= ?o1 ?o2))
        )
        :effect (and
            (add (next ?o0 ?o2))
            (del (next ?o0 ?o1))
        )
    )

    (:action memory
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (is_cats ?o0)
            (is_spring ?o1)
            (is_spring ?o2)
            (next ?o0 ?o1)
            (not (= ?o1 ?o2))
        )
        :effect (and
            (add (next ?o0 ?o2))
            (del (next ?o0 ?o1))
        )
    )

    (:action tightfisted
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and
            (is_hand ?o0)
            (is_sneeze ?o1)
            (is_texture ?o2)
            (next ?o1 ?o2)
            (has_vase ?o0 ?o1)
            (not (next ?o0 ?o2))
        )
        :effect (and
            (add (next ?o0 ?o2))
            (del (has_vase ?o0 ?o1))
        )
    )
)