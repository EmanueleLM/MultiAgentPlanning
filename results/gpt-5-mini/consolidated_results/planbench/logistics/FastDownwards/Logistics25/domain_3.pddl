(define (domain Logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (cats ?o - object)
    (collect ?o1 - object ?o2 - object)
    (hand ?o - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action clip
    :parameters (?h - object ?sneeze - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (sneeze ?sneeze)
                    (texture ?t)
                    (next ?sneeze ?t)
                    (next ?h ?t)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (vase ?h ?sneeze)
              (not (next ?h ?t))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?s - stage ?s2 - stage)
    :precondition (and
                    (sneeze ?a)
                    (texture ?b)
                    (texture ?c)
                    (stupendous ?d)
                    (next ?a ?b)
                    (collect ?b ?d)
                    (collect ?c ?d)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?a ?c)
              (not (next ?a ?b))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action memory
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
                    (cats ?a)
                    (spring ?b)
                    (spring ?c)
                    (next ?a ?b)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?a ?c)
              (not (next ?a ?b))
              (not (current ?s))
              (current ?s2)
            )
  )

  (:action tightfisted
    :parameters (?h - object ?sneeze - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (sneeze ?sneeze)
                    (texture ?t)
                    (next ?sneeze ?t)
                    (vase ?h ?sneeze)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?sneeze))
              (not (current ?s))
              (current ?s2)
            )
  )

)