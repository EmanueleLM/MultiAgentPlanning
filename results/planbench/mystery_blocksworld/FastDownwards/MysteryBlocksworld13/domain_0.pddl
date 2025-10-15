(define (domain multiagent_domain)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (cats ?x - object)
    (hand ?x - object)
    (texture ?x - object)
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (collect ?x ?y - object)
  )

  ;; paltry(obj0,obj1,obj2)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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

  ;; sip(obj0,obj1,obj2)
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
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

  ;; clip(obj0,obj1,obj2)
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
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

  ;; wretched(obj0,obj1,obj2,obj3)
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?st - object)
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

  ;; memory(obj0,obj1,obj2)
  (:action memory
    :parameters (?c - object ?spr1 - object ?spr2 - object)
    :precondition (and
      (cats ?c)
      (spring ?spr1)
      (spring ?spr2)
      (next ?c ?spr1)
    )
    :effect (and
      (next ?c ?spr2)
      (not (next ?c ?spr1))
    )
  )

  ;; tightfisted(obj0,obj1,obj2)
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
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
)