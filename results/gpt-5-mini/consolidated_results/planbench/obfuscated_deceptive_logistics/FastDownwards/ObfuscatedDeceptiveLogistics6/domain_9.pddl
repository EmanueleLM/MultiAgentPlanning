(define (domain ObfuscatedDeceptiveLogistics6)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (stage-open ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  ;; paltry: requires hand H, cats C, texture T, vase H C, next C T
  ;; effects: add next H T, delete vase H C; enforces stage progression
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (stage-open ?s))
      (stage-open ?snext)
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip: requires hand H, cats C, texture T, next H T, next C T
  ;; effects: add vase H C, delete next H T; enforces stage progression
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (stage-open ?s))
      (stage-open ?snext)
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip: requires hand H, sneeze SOBJ, texture T, next SOBJ T, next H T
  ;; effects: add vase H SOBJ, delete next H T; enforces stage progression
  (:action clip
    :parameters (?h - object ?sobj - object ?t - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)
      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next ?sobj ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (stage-open ?s))
      (stage-open ?snext)
      (vase ?h ?sobj)
      (not (next ?h ?t))
    )
  )

  ;; wretched: requires sneeze SOBJ, texture T1, texture T2, stupendous SP,
  ;;           next SOBJ T1, collect T1 SP, collect T2 SP
  ;; effects: add next SOBJ T2, delete next SOBJ T1; enforces stage progression
  (:action wretched
    :parameters (?sobj - object ?t1 - object ?t2 - object ?sp - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)
      (sneeze ?sobj)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?sobj ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
    )
    :effect (and
      (not (stage-open ?s))
      (stage-open ?snext)
      (next ?sobj ?t2)
      (not (next ?sobj ?t1))
    )
  )

  ;; memory: requires cats C, spring S1, spring S2, next C S1
  ;; effects: add next C S2, delete next C S1; enforces stage progression
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (not (stage-open ?s))
      (stage-open ?snext)
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted: requires hand H, sneeze SOBJ, texture T, next SOBJ T, vase H SOBJ
  ;; effects: add next H T, delete vase H SOBJ; enforces stage progression
  (:action tightfisted
    :parameters (?h - object ?sobj - object ?t - object ?s - stage ?snext - stage)
    :precondition (and
      (stage-open ?s)
      (succ ?s ?snext)
      (hand ?h)
      (sneeze ?sobj)
      (texture ?t)
      (next ?sobj ?t)
      (vase ?h ?sobj)
    )
    :effect (and
      (not (stage-open ?s))
      (stage-open ?snext)
      (next ?h ?t)
      (not (vase ?h ?sobj))
    )
  )
)