(define (domain ObfuscatedDeceptiveLogistics19)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; object properties / relations
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)

    ;; explicit sequential stage bookkeeping (enforces contiguous occupancy)
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  ;; paltry(H, C, T):
  ;; pre: hand H, cats C, texture T, vase H C, next C T, current-stage s and succ s snext
  ;; add: next H T, advance stage
  ;; del: vase H C
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; sip(H, C, T):
  ;; pre: hand H, cats C, texture T, next H T, next C T, current-stage s and succ s snext
  ;; add: vase H C, advance stage
  ;; del: next H T
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; clip(H, SneezeObj, TextureObj):
  ;; pre: hand H, sneeze SneezeObj, texture TextureObj, next SneezeObj TextureObj, next H TextureObj, current-stage s and succ s snext
  ;; add: vase H SneezeObj, advance stage
  ;; del: next H TextureObj
  (:action clip
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (vase ?h ?sneeze)
      (not (next ?h ?t))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; wretched(A, B, C, D):
  ;; pre: sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D, current-stage s and succ s snext
  ;; add: next A C, advance stage
  ;; del: next A B
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?s - stage ?snext - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; memory(C, S1, S2):
  ;; pre: cats C, spring S1, spring S2, next C S1, current-stage s and succ s snext
  ;; add: next C S2, advance stage
  ;; del: next C S1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?s - stage ?snext - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; tightfisted(H, SneezeObj, TextureObj):
  ;; pre: hand H, sneeze SneezeObj, texture TextureObj, next SneezeObj TextureObj, vase H SneezeObj, current-stage s and succ s snext
  ;; add: next H TextureObj, advance stage
  ;; del: vase H SneezeObj
  (:action tightfisted
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sneeze))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)