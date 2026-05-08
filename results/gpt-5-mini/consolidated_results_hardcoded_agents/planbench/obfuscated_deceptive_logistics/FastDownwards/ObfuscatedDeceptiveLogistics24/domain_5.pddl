(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; ordering and structural predicates
    (next ?x - object ?y - object)
    (vase ?h - object ?c - object)
    (collect ?x - object ?y - object)

    ;; unary properties
    (texture ?x - object)
    (spring ?x - object)
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (stupendous ?x - object)

    ;; explicit stage/time progression
    (current ?s - stage)
    (stage-successor ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires hand h, cats c, texture t, vase(h,c), next(c,t)
  ;; effects: advance stage, add next(h,t), delete vase(h,c)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?from - stage ?to - stage)
    :precondition (and
                    (current ?from)
                    (stage-successor ?from ?to)
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t)
                  )
    :effect (and
              (not (current ?from))
              (current ?to)
              (next ?h ?t)
              (not (vase ?h ?c))
            )
  )

  ;; sip: requires hand h, cats c, texture t, next(h,t), next(c,t)
  ;; effects: advance stage, add vase(h,c), delete next(h,t)
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?from - stage ?to - stage)
    :precondition (and
                    (current ?from)
                    (stage-successor ?from ?to)
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t)
                  )
    :effect (and
              (not (current ?from))
              (current ?to)
              (vase ?h ?c)
              (not (next ?h ?t))
            )
  )

  ;; clip: requires hand h, sneeze s, texture t, next(s,t), next(h,t)
  ;; effects: advance stage, add vase(h,s), delete next(h,t)
  (:action clip
    :parameters (?h - object ?s - object ?t - object ?from - stage ?to - stage)
    :precondition (and
                    (current ?from)
                    (stage-successor ?from ?to)
                    (hand ?h)
                    (sneeze ?s)
                    (texture ?t)
                    (next ?s ?t)
                    (next ?h ?t)
                  )
    :effect (and
              (not (current ?from))
              (current ?to)
              (vase ?h ?s)
              (not (next ?h ?t))
            )
  )

  ;; wretched: requires sneeze s, textures t1,t2, stupendous st, next(s,t1), collect(t1,st), collect(t2,st)
  ;; effects: advance stage, add next(s,t2), delete next(s,t1)
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?st - object ?from - stage ?to - stage)
    :precondition (and
                    (current ?from)
                    (stage-successor ?from ?to)
                    (sneeze ?s)
                    (texture ?t1)
                    (texture ?t2)
                    (stupendous ?st)
                    (next ?s ?t1)
                    (collect ?t1 ?st)
                    (collect ?t2 ?st)
                  )
    :effect (and
              (not (current ?from))
              (current ?to)
              (next ?s ?t2)
              (not (next ?s ?t1))
            )
  )

  ;; memory: requires cats c, springs s1,s2, next(c,s1)
  ;; effects: advance stage, add next(c,s2), delete next(c,s1)
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?from - stage ?to - stage)
    :precondition (and
                    (current ?from)
                    (stage-successor ?from ?to)
                    (cats ?c)
                    (spring ?s1)
                    (spring ?s2)
                    (next ?c ?s1)
                  )
    :effect (and
              (not (current ?from))
              (current ?to)
              (next ?c ?s2)
              (not (next ?c ?s1))
            )
  )

  ;; tightfisted: requires hand h, sneeze s, texture t, next(s,t), vase(h,s)
  ;; effects: advance stage, add next(h,t), delete vase(h,s)
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object ?from - stage ?to - stage)
    :precondition (and
                    (current ?from)
                    (stage-successor ?from ?to)
                    (hand ?h)
                    (sneeze ?s)
                    (texture ?t)
                    (next ?s ?t)
                    (vase ?h ?s)
                  )
    :effect (and
              (not (current ?from))
              (current ?to)
              (next ?h ?t)
              (not (vase ?h ?s))
            )
  )
)