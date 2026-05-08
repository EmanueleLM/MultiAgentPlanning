(define (domain obfuscated_deceptive_logistics18)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; paltry: requires hand, cats, texture and a vase relation + a next link;
  ;; effect: create next(h,t) and delete vase(h,c)
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

  ;; sip: requires hand, cats, texture and two next links;
  ;; effect: create vase(h,c) and delete next(h,t)
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

  ;; clip: requires hand, sneeze, texture and two next links;
  ;; effect: create vase(h,s) and delete next(h,t)
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

  ;; wretched: requires sneeze on ?x, textures on both targets, a stupendous object ?u,
  ;; and collect relations from both targets to ?u; rewires next(x,from)->next(x,to)
  (:action wretched
    :parameters (?x - object ?from - object ?to - object ?u - object)
    :precondition (and
      (sneeze ?x)
      (texture ?from)
      (texture ?to)
      (stupendous ?u)
      (next ?x ?from)
      (collect ?from ?u)
      (collect ?to ?u)
    )
    :effect (and
      (next ?x ?to)
      (not (next ?x ?from))
    )
  )

  ;; memory: for a cats object, if two springs exist, move next(c,from)->next(c,to)
  (:action memory
    :parameters (?c - object ?from - object ?to - object)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (next ?c ?to)
      (not (next ?c ?from))
    )
  )

  ;; tightfisted: requires hand, sneeze, texture, next(s,t) and vase(h,s);
  ;; effect: create next(h,t) and delete vase(h,s)
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