(define (domain Logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (cats ?o - object)
    (collect ?o1 - object ?o2 - object)
    (hand ?o - object)
    (next ?o1 - object ?o2 - object) ; object relation as in specification
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage) ; stage successor relation
    (current ?s - stage)           ; which stage is currently active
  )

  ;; Paltry: requires hand, cats, texture, vase(h,c), next(c,t). Produces next(h,t) and removes vase(h,c).
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Sip: requires hand, cats, texture, next(h,t), next(c,t). Produces vase(h,c) and removes next(h,t).
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Clip: requires hand, sneeze, texture, next(sneeze,t), next(hand,t). Produces vase(hand,sneeze) and removes next(hand,t).
  (:action clip
    :parameters (?h - object ?sneeze - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (sneeze ?sneeze)
                    (texture ?t)
                    (next ?sneeze ?t)
                    (next ?h ?t)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (vase ?h ?sneeze)
              (not (next ?h ?t))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Wretched: requires sneeze(a), texture(b), texture(c), stupendous(d), next(a,b), collect(b,d), collect(c,d).
  ;; Produces next(a,c) and removes next(a,b).
  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?s - stage ?s2 - stage)
    :precondition (and
                    (sneeze ?a)
                    (texture ?b)
                    (texture ?c)
                    (stupendous ?d)
                    (next ?a ?b)
                    (collect ?b ?d)
                    (collect ?c ?d)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?a ?c)
              (not (next ?a ?b))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Memory: requires cats(a), spring(b), spring(c), next(a,b). Produces next(a,c) and removes next(a,b).
  (:action memory
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
                    (cats ?a)
                    (spring ?b)
                    (spring ?c)
                    (next ?a ?b)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?a ?c)
              (not (next ?a ?b))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Tightfisted: requires hand(h), sneeze(s), texture(t), next(s,t), vase(h,s). Produces next(h,t) and removes vase(h,s).
  (:action tightfisted
    :parameters (?h - object ?sneeze - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (hand ?h)
                    (sneeze ?sneeze)
                    (texture ?t)
                    (next ?sneeze ?t)
                    (vase ?h ?sneeze)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?sneeze))
              (not (current ?s))
              (current ?s2)
            )
  )

)