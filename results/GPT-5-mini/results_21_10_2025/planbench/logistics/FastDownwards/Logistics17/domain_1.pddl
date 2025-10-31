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

  ; paltry(?h, ?c, ?t)
  ; Pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ; Eff: add next ?h ?t, del vase ?h ?c
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

  ; sip(?h, ?c, ?t)
  ; Pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ; Eff: add vase ?h ?c, del next ?h ?t
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

  ; clip(?h, ?s, ?t)
  ; Pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ; Eff: add vase ?h ?s, del next ?h ?t
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

  ; tightfisted(?h, ?s, ?t)
  ; Pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ; Eff: add next ?h ?t, del vase ?h ?s
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

  ; wretched(?s, ?t1, ?t2, ?st)
  ; Pre: sneeze ?s, texture ?t1, texture ?t2, stupendous ?st, next ?s ?t1, collect ?t1 ?st, collect ?t2 ?st
  ; Eff: add next ?s ?t2, del next ?s ?t1
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

  ; memory(?c, ?s1, ?s2)
  ; Pre: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ; Eff: add next ?c ?s2, del next ?c ?s1
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