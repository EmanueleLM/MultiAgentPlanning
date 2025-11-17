(define (domain obfuscated-deceptive-logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
    ;; explicit discrete-stage control to enforce strict sequential progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Every action requires being executed at the current stage ?s and advances to a successor stage ?s2.
  ;; This enforces a strict, contiguous stage progression (no oscillation or reuse of a stage).
  ;; paltry: requires hand O0, cats O1, texture O2, vase O0 O1, next O1 O2
  ;; effects: add next O0 O2, del vase O0 O1, advance stage
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (vase ?o0 ?o1)
                    (next ?o1 ?o2)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; sip: requires hand O0, cats O1, texture O2, next O0 O2, next O1 O2
  ;; effects: add vase O0 O1, del next O0 O2, advance stage
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (next ?o0 ?o2)
                    (next ?o1 ?o2)
                  )
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; clip: requires hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2
  ;; effects: add vase O0 O1, del next O0 O2, advance stage
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (next ?o0 ?o2)
                  )
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; wretched: requires sneeze O0, texture O1, texture O2, stupendous O3,
  ;;           next O0 O1, collect O1 O3, collect O2 O3
  ;; effects: add next O0 O2, del next O0 O1, advance stage
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (sneeze ?o0)
                    (texture ?o1)
                    (texture ?o2)
                    (stupendous ?o3)
                    (next ?o0 ?o1)
                    (collect ?o1 ?o3)
                    (collect ?o2 ?o3)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; memory: requires cats O0, spring O1, spring O2, next O0 O1
  ;; effects: add next O0 O2, del next O0 O1, advance stage
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (cats ?o0)
                    (spring ?o1)
                    (spring ?o2)
                    (next ?o0 ?o1)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; tightfisted: requires hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1
  ;; effects: add next O0 O2, del vase O0 O1, advance stage
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (vase ?o0 ?o1)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
              (not (current ?s))
              (current ?s2)
            )
  )

)