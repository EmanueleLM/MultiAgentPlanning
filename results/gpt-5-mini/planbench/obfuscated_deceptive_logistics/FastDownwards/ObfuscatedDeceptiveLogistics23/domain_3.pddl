(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (cats ?o - object)
    (hand ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)

    (next ?a - object ?b - object)
    (collect ?x - object ?y - object)
    (vase ?h - object ?o - object)
  )

  ;; paltry: needs hand, cat, texture, vase(h,c), next(c,t)
  ;; effect: set next(h,t), remove vase(h,c)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t))
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c)))
  )

  ;; sip: needs hand, cat, texture, next(h,t), next(c,t)
  ;; effect: set vase(h,c), remove next(h,t)
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t))
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t)))
  )

  ;; clip: needs hand, sneeze, texture, next(s,t), next(h,t)
  ;; effect: set vase(h,s), remove next(h,t)
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
                    (hand ?h)
                    (sneeze ?s)
                    (texture ?t)
                    (next ?s ?t)
                    (next ?h ?t))
    :effect (and
              (vase ?h ?s)
              (not (next ?h ?t)))
  )

  ;; wretched: needs sneeze s0, textures t1 t2, stupendous p,
  ;; next(s0,t1), collect(t1,p), collect(t2,p)
  ;; effect: set next(s0,t2), remove next(s0,t1)
  (:action wretched
    :parameters (?s0 - object ?t1 - object ?t2 - object ?p - object)
    :precondition (and
                    (sneeze ?s0)
                    (texture ?t1)
                    (texture ?t2)
                    (stupendous ?p)
                    (next ?s0 ?t1)
                    (collect ?t1 ?p)
                    (collect ?t2 ?p))
    :effect (and
              (next ?s0 ?t2)
              (not (next ?s0 ?t1)))
  )

  ;; memory: needs cat c, springs s1 s2, next(c,s1)
  ;; effect: set next(c,s2), remove next(c,s1)
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
                    (cats ?c)
                    (spring ?s1)
                    (spring ?s2)
                    (next ?c ?s1))
    :effect (and
              (next ?c ?s2)
              (not (next ?c ?s1)))
  )

  ;; tightfisted: needs hand h, sneeze s, texture t, next(s,t), vase(h,s)
  ;; effect: set next(h,t), remove vase(h,s)
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
                    (hand ?h)
                    (sneeze ?s)
                    (texture ?t)
                    (next ?s ?t)
                    (vase ?h ?s))
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?s)))
  )
)