(define (domain Logistics23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (at-stage ?x - obj ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: hand(X), cats(Y), texture(Z), vase(X,Y), next(Y,Z)
  ;; -> creates next(X,Z), deletes vase(X,Y), moves X forward one stage (from stage of X to stage of Z)
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?sx - stage ?sz - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (at-stage ?x ?sx)
      (at-stage ?z ?sz)
      (succ ?sx ?sz)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?sx))
      (at-stage ?x ?sz)
    )
  )

  ;; sip: hand(X), cats(Y), texture(Z), next(X,Z), next(Y,Z)
  ;; -> creates vase(X,Y), deletes next(X,Z), moves X forward one stage
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?sx - stage ?sz - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (at-stage ?x ?sx)
      (at-stage ?z ?sz)
      (succ ?sx ?sz)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?sx))
      (at-stage ?x ?sz)
    )
  )

  ;; clip: hand(X), sneeze(Y), texture(Z), next(Y,Z), next(X,Z)
  ;; -> creates vase(X,Y), deletes next(X,Z), moves X forward one stage
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?sx - stage ?sz - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (at-stage ?x ?sx)
      (at-stage ?z ?sz)
      (succ ?sx ?sz)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?sx))
      (at-stage ?x ?sz)
    )
  )

  ;; wretched: sneeze(A), texture(B), texture(C), stupendous(D), next(A,B), collect(B,D), collect(C,D)
  ;; -> replaces next(A,B) with next(A,C) and moves A forward one stage (from A's stage to B's stage)
  ;; Requires contiguous three-stage ordering: A at sa, B at sb, C at sc with succ sa->sb and succ sb->sc.
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?sa - stage ?sb - stage ?sc - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (at-stage ?a ?sa)
      (at-stage ?b ?sb)
      (at-stage ?c ?sc)
      (succ ?sa ?sb)
      (succ ?sb ?sc)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (at-stage ?a ?sa))
      (at-stage ?a ?sb)
    )
  )

  ;; memory: cats(A), spring(B), spring(C), next(A,B)
  ;; -> replaces next(A,B) with next(A,C) and moves A forward one stage (from A's stage to B's stage)
  ;; Requires contiguous three-stage ordering: A at sa, B at sb, C at sc with succ sa->sb and succ sb->sc.
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj ?sa - stage ?sb - stage ?sc - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (at-stage ?a ?sa)
      (at-stage ?b ?sb)
      (at-stage ?c ?sc)
      (succ ?sa ?sb)
      (succ ?sb ?sc)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (at-stage ?a ?sa))
      (at-stage ?a ?sb)
    )
  )

  ;; tightfisted: hand(X), sneeze(Y), texture(Z), next(Y,Z), vase(X,Y)
  ;; -> creates next(X,Z), deletes vase(X,Y), and moves X forward one stage
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?sx - stage ?sz - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (at-stage ?x ?sx)
      (at-stage ?z ?sz)
      (succ ?sx ?sz)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?sx))
      (at-stage ?x ?sz)
    )
  )
)