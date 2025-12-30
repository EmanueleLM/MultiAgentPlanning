(define (domain obfuscateddeceptivelogistics14)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)

    (:predicates
        (hand ?o - object)
        (cats ?o - object)
        (texture ?o - object)
        (sneeze ?o - object)
        (stupendous ?o - object)
        (spring ?o - object)
        (vase ?o1 - object ?o2 - object)
        (next ?o1 - object ?o2 - object)
        (collect ?o1 - object ?o2 - object)
    )

    ;; Action 1: Paltry ?o0 ?o1 ?o2
    ;; Changes ?o0's next link, uses vase, where ?o1 is cats.
    (:action paltry
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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

    ;; Action 2: Sip ?o0 ?o1 ?o2
    ;; Creates vase, deletes ?o0's next link, where ?o1 is cats.
    (:action sip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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

    ;; Action 3: Clip ?o0 ?o1 ?o2
    ;; Creates vase, deletes ?o0's next link, where ?o1 is sneeze.
    (:action clip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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

    ;; Action 4: Wretched ?o0 ?o1 ?o2 ?o3
    ;; Changes ?o0's next link from ?o1 to ?o2, provided ?o0 is sneeze and ?o1 and ?o2 share stupendous ?o3.
    (:action wretched
        :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
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

    ;; Action 5: Memory ?o0 ?o1 ?o2
    ;; Changes ?o0's next link from ?o1 to ?o2, provided ?o0 is cats and ?o1 and ?o2 are spring.
    (:action memory
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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

    ;; Action 6: Tightfisted ?o0 ?o1 ?o2
    ;; Changes ?o0's next link, uses vase, where ?o1 is sneeze.
    (:action tightfisted
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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