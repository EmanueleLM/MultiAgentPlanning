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

    ;; explicit discrete stages and occupancy
    (at-stage ?o - obj ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry:
  ;; pre: hand(X), cats(Y), texture(Z), vase(X,Y), next(Y,Z), contiguous stages: X at sa, Z at sb, succ sa sb
  ;; effect: add next(X,Z), remove vase(X,Y), move X to Z's stage
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?sa - stage ?sb - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (at-stage ?x ?sa)
      (at-stage ?z ?sb)
      (succ ?sa ?sb)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?sa))
      (at-stage ?x ?sb)
    )
  )

  ;; sip:
  ;; pre: hand(X), cats(Y), texture(Z), next(X,Z), next(Y,Z), contiguous: X at sa, Z at sb, succ sa sb
  ;; effect: add vase(X,Y), remove next(X,Z), move X to Z's stage
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?sa - stage ?sb - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (at-stage ?x ?sa)
      (at-stage ?z ?sb)
      (succ ?sa ?sb)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?sa))
      (at-stage ?x ?sb)
    )
  )

  ;; clip:
  ;; pre: hand(X), sneeze(Y), texture(Z), next(Y,Z), next(X,Z), contiguous: X at sa, Z at sb, succ sa sb
  ;; effect: add vase(X,Y), remove next(X,Z), move X to Z's stage
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?sa - stage ?sb - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (at-stage ?x ?sa)
      (at-stage ?z ?sb)
      (succ ?sa ?sb)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?sa))
      (at-stage ?x ?sb)
    )
  )

  ;; wretched:
  ;; pre: sneeze(A), texture(B), texture(C), stupendous(D), next(A,B), collect(B,D), collect(C,D),
  ;;      contiguous stages: A at sa, B at sb, C at sc, succ sa sb, succ sb sc
  ;; effect: add next(A,C), remove next(A,B), move A from sa to sb (one step forward)
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

  ;; memory:
  ;; pre: cats(A), spring(B), spring(C), next(A,B), contiguous stages sa->sb->sc
  ;; effect: add next(A,C), remove next(A,B), move A one stage forward
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

  ;; tightfisted:
  ;; pre: hand(X), sneeze(Y), texture(Z), next(Y,Z), vase(X,Y), contiguous: X at sa, Z at sb, succ sa sb
  ;; effect: add next(X,Z), remove vase(X,Y), move X to Z's stage
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?sa - stage ?sb - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (at-stage ?x ?sa)
      (at-stage ?z ?sb)
      (succ ?sa ?sb)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?sa))
      (at-stage ?x ?sb)
    )
  )
)