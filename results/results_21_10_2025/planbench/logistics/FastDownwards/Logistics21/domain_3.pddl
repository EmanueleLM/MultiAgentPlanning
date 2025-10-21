(define (domain Logistics21)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (sneeze ?o - object)
    (collect ?x ?y - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
                    (hand ?x)
                    (cats ?y)
                    (texture ?z)
                    (vase ?x ?y)
                    (next ?y ?z)
                  )
    :effect (and
              (next ?x ?z)
              (not (vase ?x ?y))
            )
  )

  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
                    (hand ?x)
                    (cats ?y)
                    (texture ?z)
                    (next ?x ?z)
                    (next ?y ?z)
                  )
    :effect (and
              (vase ?x ?y)
              (not (next ?x ?z))
            )
  )

  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
                    (hand ?x)
                    (sneeze ?y)
                    (texture ?z)
                    (next ?y ?z)
                    (next ?x ?z)
                  )
    :effect (and
              (vase ?x ?y)
              (not (next ?x ?z))
            )
  )

  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and
                    (sneeze ?x)
                    (texture ?y)
                    (texture ?z)
                    (stupendous ?w)
                    (next ?x ?y)
                    (collect ?y ?w)
                    (collect ?z ?w)
                  )
    :effect (and
              (next ?x ?z)
              (not (next ?x ?y))
            )
  )

  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
                    (cats ?x)
                    (spring ?y)
                    (spring ?z)
                    (next ?x ?y)
                  )
    :effect (and
              (next ?x ?z)
              (not (next ?x ?y))
            )
  )

  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
                    (hand ?x)
                    (sneeze ?y)
                    (texture ?z)
                    (next ?y ?z)
                    (vase ?x ?y)
                  )
    :effect (and
              (next ?x ?z)
              (not (vase ?x ?y))
            )
  )
)