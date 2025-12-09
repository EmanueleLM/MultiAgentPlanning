(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; state/order predicates
    (next ?x - object ?y - object)
    (vase ?h - object ?c - object)
    (collect ?x - object ?y - object)

    ;; object properties
    (texture ?x - object)
    (spring ?x - object)
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (stupendous ?x - object)

    ;; explicit discrete time / stage progression
    (current ?s - stage)
    (stage-successor ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires hand, cats, texture, vase(h,c), next(c,t), and current stage with successor
  ;; effects: advance stage, add next(h,t), delete vase(h,c)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (stage-successor ?s ?s2)
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t)
                  )
    :effect (and
              (not (current ?s))
              (current ?s2)
              (next ?h ?t)
              (not (vase ?h ?c))
            )
  )

  ;; sip: requires hand, cats, texture, next(h,t) and next(c,t)
  ;; effects: advance stage, add vase(h,c), delete next(h,t)
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (stage-successor ?s ?s2)
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t)
                  )
    :effect (and
              (not (current ?s))
              (current ?s2)
              (vase ?h ?c)
              (not (next ?h ?t))
            )
  )

  ;; clip: requires hand, sneeze-source, texture, next(s,t) and next(h,t)
  ;; effects: advance stage, add vase(h,s), delete next(h,t)
  (:action clip
    :parameters (?h - object ?sneeze - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (stage-successor ?s ?s2)
                    (hand ?h)
                    (sneeze ?sneeze)
                    (texture ?t)
                    (next ?sneeze ?t)
                    (next ?h ?t)
                  )
    :effect (and
              (not (current ?s))
              (current ?s2)
              (vase ?h ?sneeze)
              (not (next ?h ?t))
            )
  )

  ;; wretched: requires sneeze s, two textures t1,t2, stupendous st, next(s,t1), collect(t1,st), collect(t2,st)
  ;; effects: advance stage, add next(s,t2), delete next(s,t1)
  (:action wretched
    :parameters (?sneeze - object ?t1 - object ?t2 - object ?st - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (stage-successor ?s ?s2)
                    (sneeze ?sneeze)
                    (texture ?t1)
                    (texture ?t2)
                    (stupendous ?st)
                    (next ?sneeze ?t1)
                    (collect ?t1 ?st)
                    (collect ?t2 ?st)
                  )
    :effect (and
              (not (current ?s))
              (current ?s2)
              (next ?sneeze ?t2)
              (not (next ?sneeze ?t1))
            )
  )

  ;; memory: requires cats c, two springs s1,s2, and next(c,s1)
  ;; effects: advance stage, add next(c,s2), delete next(c,s1)
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?s - stage ?s2st - stage)
    :precondition (and
                    (current ?s)
                    (stage-successor ?s ?s2st)
                    (cats ?c)
                    (spring ?s1)
                    (spring ?s2)
                    (next ?c ?s1)
                  )
    :effect (and
              (not (current ?s))
              (current ?s2st)
              (next ?c ?s2)
              (not (next ?c ?s1))
            )
  )

  ;; tightfisted: requires hand h, sneeze s, texture t, next(s,t), vase(h,s)
  ;; effects: advance stage, add next(h,t), delete vase(h,s)
  (:action tightfisted
    :parameters (?h - object ?sneeze - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (stage-successor ?s ?s2)
                    (hand ?h)
                    (sneeze ?sneeze)
                    (texture ?t)
                    (next ?sneeze ?t)
                    (vase ?h ?sneeze)
                  )
    :effect (and
              (not (current ?s))
              (current ?s2)
              (next ?h ?t)
              (not (vase ?h ?sneeze))
            )
  )
)