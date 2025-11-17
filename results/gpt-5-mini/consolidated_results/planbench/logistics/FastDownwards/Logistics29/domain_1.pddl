(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types Obj Stage)

  (:predicates
    ;; object properties / tokens
    (hand ?o - Obj)
    (cats ?o - Obj)
    (texture ?o - Obj)
    (sneeze ?o - Obj)
    (spring ?o - Obj)
    (stupendous ?o - Obj)

    ;; binary relations among objects (as specified by the human)
    (vase ?a - Obj ?b - Obj)
    (next ?a - Obj ?b - Obj)
    (collect ?a - Obj ?b - Obj)

    ;; explicit discrete-time / stage progression
    (stage ?s - Stage)
    (succ ?s1 - Stage ?s2 - Stage)    ;; successor relation over stages
    (current ?s - Stage)             ;; exactly one stage is current; actions advance it
  )

  ;; Each action consumes/completes the current stage and advances to its successor.
  ;; Preconditions include (current ?s) and (succ ?s ?s2). Effects flip current to ?s2.
  ;; This enforces an explicit ordered stage progression and prevents oscillation.

  ;; paltry: requires hand, cats, texture, a vase relation and a next link;
  ;; effect: create next between the vase's first argument and the third arg, remove that vase relation.
  (:action paltry
    :parameters (?s - Stage ?s2 - Stage
                 ?h - Obj ?c - Obj ?t - Obj
                 ?v1 - Obj ?v2 - Obj
                 ?n2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?v1 ?v2)
      (next ?v2 ?n2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?v1 ?n2)
      (not (vase ?v1 ?v2))
    )
  )

  ;; sip: requires hand, cats, texture and two next relations (one from p1->p2 and one from q1->q2);
  ;; effect: create vase(q1,q2) and remove next(q1,q2).
  (:action sip
    :parameters (?s - Stage ?s2 - Stage
                 ?h - Obj ?c - Obj ?t - Obj
                 ?p1 - Obj ?p2 - Obj
                 ?q1 - Obj ?q2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?p1 ?p2)
      (next ?q1 ?q2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (vase ?q1 ?q2)
      (not (next ?q1 ?q2))
    )
  )

  ;; clip: like sip but requires sneeze instead of cats; effects same as sip
  (:action clip
    :parameters (?s - Stage ?s2 - Stage
                 ?h - Obj ?sn - Obj ?t - Obj
                 ?p1 - Obj ?p2 - Obj
                 ?q1 - Obj ?q2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?p1 ?p2)
      (next ?q1 ?q2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (vase ?q1 ?q2)
      (not (next ?q1 ?q2))
    )
  )

  ;; wretched: requires sneeze, two textures, a stupendous token, an existing next(a,b),
  ;; and two collect relations collect(b,st) and collect(c,st).
  ;; Effect: replace next(a,b) by next(a,c).
  (:action wretched
    :parameters (?s - Stage ?s2 - Stage
                 ?sn - Obj ?t1 - Obj ?t2 - Obj ?st - Obj
                 ?a - Obj ?b - Obj ?c - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?a ?b)
      (collect ?b ?st)
      (collect ?c ?st)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory: requires cats and two springs and an existing next(a,b).
  ;; Effect: replace next(a,b) by next(a,c) where c is a provided object.
  (:action memory
    :parameters (?s - Stage ?s2 - Stage
                 ?cato - Obj ?sp1 - Obj ?sp2 - Obj
                 ?a - Obj ?b - Obj ?c - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (cats ?cato)
      (spring ?sp1)
      (spring ?sp2)
      (next ?a ?b)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; tightfisted: requires hand, sneeze, texture, a next relation and a vase relation (binary).
  ;; Effect: create next(a,v2) and remove both the previous next and the vase relation.
  (:action tightfisted
    :parameters (?s - Stage ?s2 - Stage
                 ?h - Obj ?sn - Obj ?t - Obj
                 ?a - Obj ?b - Obj
                 ?v1 - Obj ?v2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?b ?v2)
      (vase ?v1 ?b)
      ;; The human spec uses vase object_0 object_1; we model vase(v1,b).
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?v1 ?v2)
      (not (next ?b ?v2))
      (not (vase ?v1 ?b))
    )
  )
)