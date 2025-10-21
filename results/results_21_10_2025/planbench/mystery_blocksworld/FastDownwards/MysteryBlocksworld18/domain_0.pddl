(define (domain objects-domain)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (collect ?x ?y)
    (spring ?x)
    (stupendous ?x)
  )

  ;; paltry(hand X, cats Y, texture Z, vase X Y, next Y Z)
  ;; Pre: hand(X), cats(Y), texture(Z), vase(X,Y), next(Y,Z)
  ;; Eff: add next(X,Z), del vase(X,Y)
  (:action paltry
    :parameters (?h ?c ?t)
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

  ;; sip(hand X, cats Y, texture Z, next X Z, next Y Z)
  ;; Pre: hand(X), cats(Y), texture(Z), next(X,Z), next(Y,Z)
  ;; Eff: add vase(X,Y), del next(X,Z)
  (:action sip
    :parameters (?h ?c ?t)
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

  ;; clip(hand X, sneeze Y, texture Z, next Y Z, next X Z)
  ;; Pre: hand(X), sneeze(Y), texture(Z), next(Y,Z), next(X,Z)
  ;; Eff: add vase(X,Y), del next(X,Z)
  (:action clip
    :parameters (?h ?s ?t)
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

  ;; wretched(sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D)
  ;; Pre: sneeze(A), texture(B), texture(C), stupendous(D), next(A,B), collect(B,D), collect(C,D)
  ;; Eff: add next(A,C), del next(A,B)
  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory(cats X, spring Y, spring Z, next X Y)
  ;; Pre: cats(X), spring(Y), spring(Z), next(X,Y)
  ;; Eff: add next(X,Z), del next(X,Y)
  (:action memory
    :parameters (?c ?y ?z)
    :precondition (and
      (cats ?c)
      (spring ?y)
      (spring ?z)
      (next ?c ?y)
    )
    :effect (and
      (next ?c ?z)
      (not (next ?c ?y))
    )
  )

  ;; tightfisted(hand X, sneeze Y, texture Z, next Y Z, vase X Y)
  ;; Pre: hand(X), sneeze(Y), texture(Z), next(Y,Z), vase(X,Y)
  ;; Eff: add next(X,Z), del vase(X,Y)
  (:action tightfisted
    :parameters (?h ?s ?t)
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