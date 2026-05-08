(define (domain obfuscated_deceptive_logistics_47)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        agent
        location
        resource
    )
    (:predicates
        (is_hand ?a - agent)
        (is_cats ?a - agent)
        (is_sneeze ?a - agent)
        (is_texture ?l - location)
        (is_spring ?l - location)
        (is_stupendous ?r - resource)
        (next ?a - agent ?l - location)
        (vase ?a1 - agent ?a2 - agent)
        (collect ?l - location ?r - resource)
    )

    (:action paltry
        :parameters (?a0 - agent ?a1 - agent ?l2 - location)
        :precondition (and
            (is_hand ?a0)
            (is_cats ?a1)
            (is_texture ?l2)
            (vase ?a0 ?a1)
            (next ?a1 ?l2)
        )
        :effect (and
            (next ?a0 ?l2)
            (not (vase ?a0 ?a1))
        )
    )

    (:action sip
        :parameters (?a0 - agent ?a1 - agent ?l2 - location)
        :precondition (and
            (is_hand ?a0)
            (is_cats ?a1)
            (is_texture ?l2)
            (next ?a0 ?l2)
            (next ?a1 ?l2)
        )
        :effect (and
            (vase ?a0 ?a1)
            (not (next ?a0 ?l2))
        )
    )

    (:action clip
        :parameters (?a0 - agent ?a1 - agent ?l2 - location)
        :precondition (and
            (is_hand ?a0)
            (is_sneeze ?a1)
            (is_texture ?l2)
            (next ?a1 ?l2)
            (next ?a0 ?l2)
        )
        :effect (and
            (vase ?a0 ?a1)
            (not (next ?a0 ?l2))
        )
    )

    (:action wretched
        :parameters (?a0 - agent ?l1 - location ?l2 - location ?r3 - resource)
        :precondition (and
            (is_sneeze ?a0)
            (is_texture ?l1)
            (is_texture ?l2)
            (is_stupendous ?r3)
            (next ?a0 ?l1)
            (collect ?l1 ?r3)
            (collect ?l2 ?r3)
        )
        :effect (and
            (next ?a0 ?l2)
            (not (next ?a0 ?l1))
        )
    )

    (:action memory
        :parameters (?a0 - agent ?l1 - location ?l2 - location)
        :precondition (and
            (is_cats ?a0)
            (is_spring ?l1)
            (is_spring ?l2)
            (next ?a0 ?l1)
        )
        :effect (and
            (next ?a0 ?l2)
            (not (next ?a0 ?l1))
        )
    )

    (:action tightfisted
        :parameters (?a0 - agent ?a1 - agent ?l2 - location)
        :precondition (and
            (is_hand ?a0)
            (is_sneeze ?a1)
            (is_texture ?l2)
            (next ?a1 ?l2)
            (vase ?a0 ?a1)
        )
        :effect (and
            (next ?a0 ?l2)
            (not (vase ?a0 ?a1))
        )
    )
)