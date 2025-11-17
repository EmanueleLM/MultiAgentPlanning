(define (domain obfuscated_deceptive_logistics22)
  (:requirements :strips :typing)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (now ?t - stage)
    (succ ?t1 ?t2 - stage)
  )

  ;; paltry(object_h,object_c,object_t)
  ;; pre: hand object_h, cats object_c, texture object_t, vase object_h object_c, next object_c object_t, now s, succ s s2
  ;; add: next object_h object_t, advance time (now s -> now s2)
  ;; del: vase object_h object_c, advance-time deletion of now s
  (:action paltry
    :parameters (?h ?c ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; sip(object_h,object_c,object_t)
  ;; pre: hand object_h, cats object_c, texture object_t, next object_h object_t, next object_c object_t, now s, succ s s2
  ;; add: vase object_h object_c, advance time
  ;; del: next object_h object_t, advance-time deletion
  (:action sip
    :parameters (?h ?c ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; clip(object_h,object_sn,object_t)
  ;; pre: hand object_h, sneeze object_sn, texture object_t, next object_sn object_t, next object_h object_t, now s, succ s s2
  ;; add: vase object_h object_sn, advance time
  ;; del: next object_h object_t, advance-time deletion
  (:action clip
    :parameters (?h ?sn ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; wretched(object_a,object_b,object_c,object_stupendous)
  ;; pre: sneeze object_a, texture object_b, texture object_c, stupendous object_stupendous,
  ;;      next object_a object_b, collect object_b object_stupendous, collect object_c object_stupendous, now s, succ s s2
  ;; add: next object_a object_c, advance time
  ;; del: next object_a object_b, advance-time deletion
  (:action wretched
    :parameters (?a ?b ?c ?st - obj ?s ?s2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?st)
      (next ?a ?b)
      (collect ?b ?st)
      (collect ?c ?st)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; memory(object_x,object_s1,object_s2)
  ;; pre: cats object_x, spring object_s1, spring object_s2, next object_x object_s1, now s, succ s s2
  ;; add: next object_x object_s2, advance time
  ;; del: next object_x object_s1, advance-time deletion
  (:action memory
    :parameters (?x ?s1 ?s2 - obj ?t ?t2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?s1)
      (spring ?s2)
      (next ?x ?s1)
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?s2)
      (not (next ?x ?s1))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; tightfisted(object_h,object_sn,object_t)
  ;; pre: hand object_h, sneeze object_sn, texture object_t, next object_sn object_t, vase object_h object_sn, now s, succ s s2
  ;; add: next object_h object_t, advance time
  ;; del: vase object_h object_sn, advance-time deletion
  (:action tightfisted
    :parameters (?h ?sn ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (now ?s))
      (now ?s2)
    )
  )
)