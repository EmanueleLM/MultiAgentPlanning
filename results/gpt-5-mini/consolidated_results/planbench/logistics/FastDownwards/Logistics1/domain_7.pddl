(define (domain Logistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (now ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Paltry: requires hand, cats, texture, vase(h,c), next(c,tex), and consumes current stage to advance.
  ;; Adds next(h,tex) and removes vase(h,c).
  (:action paltry
    :parameters (?h - obj ?c - obj ?tex - obj ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tex)
      (vase ?h ?c)
      (next ?c ?tex)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?c))
      (not (now ?t1))
      (now ?t2)
    )
  )

  ;; Sip: requires hand, cats, texture, next(h,tex), next(c,tex), and consumes current stage to advance.
  ;; Adds vase(h,c) and removes next(h,tex).
  (:action sip
    :parameters (?h - obj ?c - obj ?tex - obj ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tex)
      (next ?h ?tex)
      (next ?c ?tex)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?tex))
      (not (now ?t1))
      (now ?t2)
    )
  )

  ;; Clip: requires hand, sneeze, texture, next(sneeze,tex), next(hand,tex), and consumes current stage to advance.
  ;; Adds vase(hand,sneeze) and removes next(hand,tex).
  (:action clip
    :parameters (?h - obj ?snee - obj ?tex - obj ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?tex)
      (next ?snee ?tex)
      (next ?h ?tex)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (vase ?h ?snee)
      (not (next ?h ?tex))
      (not (now ?t1))
      (now ?t2)
    )
  )

  ;; Wretched: requires sneeze, two textures, stupendous, next(sneeze,tex1), collect(tex1,st), collect(tex2,st),
  ;; and consumes current stage to advance. Adds next(sneeze,tex2) and removes next(sneeze,tex1).
  (:action wretched
    :parameters (?snee - obj ?tex1 - obj ?tex2 - obj ?st - obj ?t1 - stage ?t2 - stage)
    :precondition (and
      (sneeze ?snee)
      (texture ?tex1)
      (texture ?tex2)
      (stupendous ?st)
      (next ?snee ?tex1)
      (collect ?tex1 ?st)
      (collect ?tex2 ?st)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?snee ?tex2)
      (not (next ?snee ?tex1))
      (not (now ?t1))
      (now ?t2)
    )
  )

  ;; Memory: requires cats, two springs, next(c,sfrom), and consumes current stage to advance.
  ;; Adds next(c,sto) and removes next(c,sfrom).
  (:action memory
    :parameters (?c - obj ?sfrom - obj ?sto - obj ?t1 - stage ?t2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?sfrom)
      (spring ?sto)
      (next ?c ?sfrom)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?c ?sto)
      (not (next ?c ?sfrom))
      (not (now ?t1))
      (now ?t2)
    )
  )

  ;; Tightfisted: requires hand, sneeze, texture, next(sneeze,tex), vase(hand,sneeze),
  ;; and consumes current stage to advance. Adds next(hand,tex) and removes vase(hand,sneeze).
  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?tex - obj ?t1 - stage ?t2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?tex)
      (next ?snee ?tex)
      (vase ?h ?snee)
      (now ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?snee))
      (not (now ?t1))
      (now ?t2)
    )
  )
)