(define (domain orchestrated)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (collect ?x ?y)
  )

  ;; paltry(x,y,z): requires hand x, cats y, texture z, vase x y, next y z.
  ;; Effects: adds next x z, removes vase x y.
  (:action paltry
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ;; sip(x,y,z): requires hand x, cats y, texture z, next x z, next y z.
  ;; Effects: adds vase x y, removes next x z.
  (:action sip
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; clip(x,y,z): requires hand x, sneeze y, texture z, next y z, next x z.
  ;; Effects: adds vase x y, removes next x z.
  (:action clip
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; wretched(a,b,c,d): requires sneeze a, texture b, texture c, stupendous d,
  ;; next a b, collect b d, collect c d. Effects: adds next a c, removes next a b.
  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d)
                       (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ;; memory(u,v,w): requires cats u, spring v, spring w, next u v.
  ;; Effects: adds next u w, removes next u v.
  (:action memory
    :parameters (?u ?v ?w)
    :precondition (and (cats ?u) (spring ?v) (spring ?w) (next ?u ?v))
    :effect (and (next ?u ?w) (not (next ?u ?v)))
  )

  ;; tightfisted(x,y,z): requires hand x, sneeze y, texture z, next y z, vase x y.
  ;; Effects: adds next x z, removes vase x y.
  (:action tightfisted
    :parameters (?x ?y ?z)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)