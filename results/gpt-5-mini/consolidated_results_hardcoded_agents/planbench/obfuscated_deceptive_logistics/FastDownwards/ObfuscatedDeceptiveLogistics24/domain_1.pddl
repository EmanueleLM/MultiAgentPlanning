(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry: requires hand H, cats C, texture T, vase(H,C), next(C,T)
  ;; effects: add next(H,T), delete vase(H,C)
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

  ;; sip: requires hand H, cats C, texture T, next(H,T), next(C,T)
  ;; effects: add vase(H,C), delete next(H,T)
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

  ;; clip: requires hand H, sneeze S, texture T, next(S,T), next(H,T)
  ;; effects: add vase(H,S), delete next(H,T)
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

  ;; wretched: requires sneeze S, texture T1, texture T2, stupendous ST,
  ;;            next(S,T1), collect(T1,ST), collect(T2,ST)
  ;; effects: add next(S,T2), delete next(S,T1)
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

  ;; memory: requires cats C, spring S1, spring S2, next(C,S1)
  ;; effects: add next(C,S2), delete next(C,S1)
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

  ;; tightfisted: requires hand H, sneeze S, texture T, next(S,T), vase(H,S)
  ;; effects: add next(H,T), delete vase(H,S)
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
)