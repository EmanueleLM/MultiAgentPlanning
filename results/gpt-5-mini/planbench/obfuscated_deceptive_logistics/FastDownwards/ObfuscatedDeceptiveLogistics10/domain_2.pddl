(define (domain orchestrator)
  ;; Domain: orchestrator (revised)
  ;; Conservative modeling of supplied predicates and actions.
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?h ?holder)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (collect ?x ?y)
  )

  ;; Action: paltry
  ;; Preconditions: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; Effects: add next ?h ?t, del vase ?h ?c
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

  ;; Action: sip
  ;; Preconditions: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; Effects: add vase ?h ?c, del next ?h ?t
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

  ;; Action: clip
  ;; Preconditions: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; Effects: add vase ?h ?s, del next ?h ?t
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

  ;; Action: wretched
  ;; Preconditions: sneeze ?s, texture ?t1, texture ?t2, stupendous ?sp,
  ;;                next ?s ?t1, collect ?t1 ?sp, collect ?t2 ?sp
  ;; Effects: add next ?s ?t2, del next ?s ?t1
  (:action wretched
    :parameters (?s ?t1 ?t2 ?sp)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?s ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory
  ;; Preconditions: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; Effects: add next ?c ?s2, del next ?c ?s1
  (:action memory
    :parameters (?c ?s1 ?s2)
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

  ;; Action: tightfisted
  ;; Preconditions: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; Effects: add next ?h ?t, del vase ?h ?s
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