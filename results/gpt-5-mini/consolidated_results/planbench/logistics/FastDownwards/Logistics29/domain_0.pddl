(define (domain orchestrated)
  (:requirements :typing :negative-preconditions)
  (:types Obj)

  (:predicates
    (hand ?o - Obj)
    (cats ?o - Obj)
    (texture ?o - Obj)
    (vase ?o - Obj)
    (next ?x - Obj ?y - Obj)
    (collect ?o - Obj)
    (sneeze ?o - Obj)
    (spring ?o - Obj)
    (stupendous ?o - Obj)
  )

  ;; paltry: consumes a vase object and creates next(vase, p)
  (:action paltry
    :parameters (?h - Obj ?c - Obj ?t - Obj ?v - Obj ?p - Obj ?q - Obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?v)
      (next ?p ?q)
    )
    :effect (and
      (not (vase ?v))
      (next ?v ?p)
    )
  )

  ;; sip: requires two distinct next relations, makes q1 a vase and removes its next link
  (:action sip
    :parameters (?h - Obj ?c - Obj ?t - Obj
                 ?p1 - Obj ?p2 - Obj ?q1 - Obj ?q2 - Obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?p1 ?p2)
      (next ?q1 ?q2)
      ;; enforce the two next relations are not the identical pair
      (not (= ?p1 ?q1))
      (not (= ?p2 ?q2))
    )
    :effect (and
      (vase ?q1)
      (not (next ?q1 ?q2))
    )
  )

  ;; clip: like sip but requires sneeze instead of cats
  (:action clip
    :parameters (?h - Obj ?s - Obj ?t - Obj
                 ?p1 - Obj ?p2 - Obj ?q1 - Obj ?q2 - Obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?p1 ?p2)
      (next ?q1 ?q2)
      (not (= ?p1 ?q1))
      (not (= ?p2 ?q2))
    )
    :effect (and
      (vase ?q1)
      (not (next ?q1 ?q2))
    )
  )

  ;; wretched: replaces an existing next(?a,?b) with next(?c1,?c2) where c1 and c2 are collect objects
  (:action wretched
    :parameters (?s - Obj ?t - Obj ?st - Obj
                 ?a - Obj ?b - Obj ?c1 - Obj ?c2 - Obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t)
      (stupendous ?st)
      (next ?a ?b)
      (collect ?c1)
      (collect ?c2)
      (not (= ?c1 ?c2))
    )
    :effect (and
      (next ?c1 ?c2)
      (not (next ?a ?b))
    )
  )

  ;; memory: replaces next(a,b) by next(b,c) using a cats object and requires two springs (kept as guards)
  (:action memory
    :parameters (?c - Obj ?s1 - Obj ?s2 - Obj ?a - Obj ?b - Obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?a ?b)
      (not (= ?s1 ?s2))
    )
    :effect (and
      (not (next ?a ?b))
      (next ?b ?c)
    )
  )

  ;; tightfisted: reroutes next(a,b) to next(a,v) consuming vase v
  (:action tightfisted
    :parameters (?h - Obj ?s - Obj ?t - Obj ?a - Obj ?b - Obj ?v - Obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?a ?b)
      (vase ?v)
    )
    :effect (and
      (next ?a ?v)
      (not (next ?a ?b))
      (not (vase ?v))
    )
  )
)