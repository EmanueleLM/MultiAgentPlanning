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
    ;; explicit discrete stages and object occupancy
    (at-stage ?x - obj ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires X at a stage immediately before Z (succ ?sx ?sz).
  ;; Preconditions: hand(X), cats(Y), texture(Z), vase(X,Y), next(Y,Z), X at ?sx, Z at ?sz, succ ?sx ?sz
  ;; Effects: create next(X,Z), delete vase(X,Y), move X from ?sx to ?sz.
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

  ;; sip: requires X at stage immediately before Z, and Y also immediately before Z.
  ;; Preconditions: hand(X), cats(Y), texture(Z), next(X,Z), next(Y,Z), at-stage X and Z with succ ?sx ?sz
  ;; Effects: create vase(X,Y), delete next(X,Z), move X to Z's stage.
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

  ;; clip: requires X at stage immediately before Z and Y also immediately before Z.
  ;; Preconditions: hand(X), sneeze(Y), texture(Z), next(Y,Z), next(X,Z), at-stage X and Z with succ ?sx ?sz
  ;; Effects: create vase(X,Y), delete next(X,Z), move X to Z's stage.
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

  ;; wretched: transforms next(A,B) into next(A,C) provided contiguous stages sa->sb->sc
  ;; Preconditions: sneeze(A), texture(B), texture(C), stupendous(D), next(A,B), collect(B,D), collect(C,D),
  ;;               A at sa, B at sb, C at sc, succ sa sb, succ sb sc
  ;; Effects: create next(A,C), delete next(A,B), move A from sa to sb (one stage forward).
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

  ;; memory: similar to wretched but triggered by cats and spring predicates
  ;; Preconditions: cats(A), spring(B), spring(C), next(A,B), A at sa, B at sb, C at sc, succ sa sb, succ sb sc
  ;; Effects: create next(A,C), delete next(A,B), move A from sa to sb.
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

  ;; tightfisted: requires X at stage immediately before Z, and Y immediately before Z, with vase(X,Y)
  ;; Preconditions: hand(X), sneeze(Y), texture(Z), next(Y,Z), vase(X,Y), at-stage X and Z with succ ?sx ?sz
  ;; Effects: create next(X,Z), delete vase(X,Y), move X to Z's stage.
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