(define (domain manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x ?y - obj)
    (next ?x ?y - obj)
    (vase ?x ?y - obj)
  )

  ; paltry(?o0, ?o1, ?o2)
  ; Pre: hand(?o0), cats(?o1), texture(?o2), vase(?o0,?o1), next(?o1,?o2)
  ; Effect: add next(?o0,?o2), del vase(?o0,?o1)
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ; sip(?o0, ?o1, ?o2)
  ; Pre: hand(?o0), cats(?o1), texture(?o2), next(?o0,?o2), next(?o1,?o2)
  ; Effect: add vase(?o0,?o1), del next(?o0,?o2)
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ; clip(?o0, ?o1, ?o2)
  ; Pre: hand(?o0), sneeze(?o1), texture(?o2), next(?o1,?o2), next(?o0,?o2)
  ; Effect: add vase(?o0,?o1), del next(?o0,?o2)
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ; tightfisted(?o0, ?o1, ?o2)
  ; Pre: hand(?o0), sneeze(?o1), texture(?o2), next(?o1,?o2), vase(?o0,?o1)
  ; Effect: add next(?o0,?o2), del vase(?o0,?o1)
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

  ; wretched(?o0,?o1,?o2,?o3)
  ; Preconditions: sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3, next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ; Effects: add next ?o0 ?o2, del next ?o0 ?o1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ; memory(?o0,?o1,?o2)
  ; Preconditions: cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ; Effects: add next ?o0 ?o2, del next ?o0 ?o1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

)