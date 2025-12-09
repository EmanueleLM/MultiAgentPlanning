(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    ;; classification predicates (static)
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)

    ;; fluents modified by actions
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)

    ;; explicit discrete time/stage modeling
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Action: paltry
  ;; Preconditions: hand ?h, cats ?cat, texture ?tex, vase ?h ?cat, next ?cat ?tex, current ?st, succ ?st ?st2
  ;; Effects: add next ?h ?tex, delete vase ?h ?cat, advance current stage
  (:action paltry
    :parameters (?h - object ?cat - object ?tex - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?cat)
      (texture ?tex)
      (vase ?h ?cat)
      (next ?cat ?tex)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?cat))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Action: sip
  ;; Preconditions: hand ?h, cats ?cat, texture ?tex, next ?h ?tex, next ?cat ?tex, current ?st, succ ?st ?st2
  ;; Effects: add vase ?h ?cat, delete next ?h ?tex, advance stage
  (:action sip
    :parameters (?h - object ?cat - object ?tex - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?cat)
      (texture ?tex)
      (next ?h ?tex)
      (next ?cat ?tex)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (vase ?h ?cat)
      (not (next ?h ?tex))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Action: clip
  ;; Preconditions: hand ?h, sneeze ?s, texture ?tex, next ?s ?tex, next ?h ?tex, current ?st, succ ?st ?st2
  ;; Effects: add vase ?h ?s, delete next ?h ?tex, advance stage
  (:action clip
    :parameters (?h - object ?s - object ?tex - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tex)
      (next ?s ?tex)
      (next ?h ?tex)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?tex))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Action: wretched
  ;; Preconditions: sneeze ?s, texture ?t1, texture ?t2, stupendous ?p,
  ;;                next ?s ?t1, collect ?t1 ?p, collect ?t2 ?p, current ?st, succ ?st ?st2
  ;; Effects: add next ?s ?t2, delete next ?s ?t1, advance stage
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?p - object ?st - stage ?st2 - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?p)
      (next ?s ?t1)
      (collect ?t1 ?p)
      (collect ?t2 ?p)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Action: memory
  ;; Preconditions: cats ?cat, spring ?s1, spring ?s2, next ?cat ?s1, current ?st, succ ?st ?st2
  ;; Effects: add next ?cat ?s2, delete next ?cat ?s1, advance stage
  (:action memory
    :parameters (?cat - object ?s1 - object ?s2 - object ?st - stage ?st2 - stage)
    :precondition (and
      (cats ?cat)
      (spring ?s1)
      (spring ?s2)
      (next ?cat ?s1)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?cat ?s2)
      (not (next ?cat ?s1))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Action: tightfisted
  ;; Preconditions: hand ?h, sneeze ?s, texture ?tex, next ?s ?tex, vase ?h ?s, current ?st, succ ?st ?st2
  ;; Effects: add next ?h ?tex, delete vase ?h ?s, advance stage
  (:action tightfisted
    :parameters (?h - object ?s - object ?tex - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tex)
      (next ?s ?tex)
      (vase ?h ?s)
      (current ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?s))
      (not (current ?st))
      (current ?st2)
    )
  )
)