(define (domain Logistics21)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (collect ?x ?y - obj)
    (stupendous ?x - obj)
  )

  ;; Paltry: requires hand H, cats C, texture T, vase H C, next C T
  ;; Adds next H T, deletes vase H C
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

  ;; Sip: requires hand H, cats C, texture T, next H T, next C T
  ;; Adds vase H C, deletes next H T
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

  ;; Clip: requires hand H, sneeze S, texture T, next S T, next H T
  ;; Adds vase H S, deletes next H T
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

  ;; Wretched: requires sneeze X, texture Y, texture Z, stupendous W,
  ;;           next X Y, collect Y W, collect Z W
  ;; Adds next X Z, deletes next X Y
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; Memory: requires cats C, spring S1, spring S2, next C S1
  ;; Adds next C S2, deletes next C S1
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

  ;; Tightfisted: requires hand H, sneeze S, texture T, next S T, vase H S
  ;; Adds next H T, deletes vase H S
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