(define (domain obfuscated_deceptive_logistics_39)
        (:requirements :strips :typing)
        (:types
            package carrier point region - object
            cats_carrier sneeze_carrier - carrier
            texture_point - point
            spring_point - texture_point
        )
        (:predicates
            (hand ?v - package)
            (cats ?c - cats_carrier)
            (sneeze ?c - sneeze_carrier)
            (texture ?p - texture_point)
            (spring ?p - spring_point)
            (stupendous ?r - region)
            (vase ?v - package ?c - carrier)
            (next ?obj - object ?p - point)
            (collect ?p - point ?r - region)
        )

        (:action paltry
            :parameters (?v - package ?c - cats_carrier ?p - texture_point)
            :precondition (and (hand ?v) (cats ?c) (texture ?p) (vase ?v ?c) (next ?c ?p))
            :effect (and (next ?v ?p) (not (vase ?v ?c)))
        )

        (:action sip
            :parameters (?v - package ?c - cats_carrier ?p - texture_point)
            :precondition (and (hand ?v) (cats ?c) (texture ?p) (next ?v ?p) (next ?c ?p))
            :effect (and (vase ?v ?c) (not (next ?v ?p)))
        )

        (:action clip
            :parameters (?v - package ?c - sneeze_carrier ?p - texture_point)
            :precondition (and (hand ?v) (sneeze ?c) (texture ?p) (next ?c ?p) (next ?v ?p))
            :effect (and (vase ?v ?c) (not (next ?v ?p)))
        )

        (:action wretched
            :parameters (?c - sneeze_carrier ?p1 - texture_point ?p2 - texture_point ?r - region)
            :precondition (and (sneeze ?c) (texture ?p1) (texture ?p2) (stupendous ?r) (next ?c ?p1) (collect ?p1 ?r) (collect ?p2 ?r))
            :effect (and (next ?c ?p2) (not (next ?c ?p1)))
        )

        (:action memory
            :parameters (?c - cats_carrier ?p1 - spring_point ?p2 - spring_point)
            :precondition (and (cats ?c) (spring ?p1) (spring ?p2) (next ?c ?p1))
            :effect (and (next ?c ?p2) (not (next ?c ?p1)))
        )

        (:action tightfisted
            :parameters (?v - package ?c - sneeze_carrier ?p - texture_point)
            :precondition (and (hand ?v) (sneeze ?c) (texture ?p) (next ?c ?p) (vase ?v ?c))
            :effect (and (next ?v ?p) (not (vase ?v ?c)))
        )
    )