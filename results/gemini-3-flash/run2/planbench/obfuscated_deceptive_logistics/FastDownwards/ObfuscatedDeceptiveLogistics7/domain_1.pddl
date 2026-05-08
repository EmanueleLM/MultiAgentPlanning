(define (domain wretched_logistics)
  (:requirements :strips)
  (:predicates
    (hand ?obj)
    (cats ?obj)
    (sneeze ?obj)
    (texture ?obj)
    (spring ?obj)
    (stupendous ?obj)
    (vase ?obj1 ?obj2)
    (next ?obj1 ?obj2)
    (collect ?obj1 ?obj2)
  )

  (:action paltry
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action sip
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action clip
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c ?s1 ?s2)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  (:action tightfisted
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)