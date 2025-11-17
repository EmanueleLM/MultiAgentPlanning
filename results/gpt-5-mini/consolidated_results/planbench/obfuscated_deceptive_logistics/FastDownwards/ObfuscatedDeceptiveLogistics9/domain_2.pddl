(define (domain obfuscated-deceptive-logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

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

    ;; Explicit discrete-stage control to enforce contiguous, ordered execution
    (cur-step ?s - step)
    (step-succ ?s - step ?s2 - step)
  )

  ;; paltry: requires hand O0, cats O1, texture O2, vase O0 O1, next O1 O2
  ;; adds next O0 O2, deletes vase O0 O1
  ;; also advances the global step from ?s to ?s_next (contiguous stage progression)
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?s_next - step)
    :precondition (and
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (vase ?o0 ?o1)
                    (next ?o1 ?o2)
                    (cur-step ?s)
                    (step-succ ?s ?s_next)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
              (not (cur-step ?s))
              (cur-step ?s_next)
            )
  )

  ;; sip: requires hand O0, cats O1, texture O2, next O0 O2, next O1 O2
  ;; adds vase O0 O1, deletes next O0 O2
  ;; advances the global step
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?s_next - step)
    :precondition (and
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (next ?o0 ?o2)
                    (next ?o1 ?o2)
                    (cur-step ?s)
                    (step-succ ?s ?s_next)
                  )
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
              (not (cur-step ?s))
              (cur-step ?s_next)
            )
  )

  ;; clip: requires hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2
  ;; adds vase O0 O1, deletes next O0 O2
  ;; advances the global step
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?s_next - step)
    :precondition (and
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (next ?o0 ?o2)
                    (cur-step ?s)
                    (step-succ ?s ?s_next)
                  )
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
              (not (cur-step ?s))
              (cur-step ?s_next)
            )
  )

  ;; wretched: requires sneeze O0, texture O1, texture O2, stupendous O3, next O0 O1, collect O1 O3, collect O2 O3
  ;; adds next O0 O2, deletes next O0 O1
  ;; advances the global step
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?s - step ?s_next - step)
    :precondition (and
                    (sneeze ?o0)
                    (texture ?o1)
                    (texture ?o2)
                    (stupendous ?o3)
                    (next ?o0 ?o1)
                    (collect ?o1 ?o3)
                    (collect ?o2 ?o3)
                    (cur-step ?s)
                    (step-succ ?s ?s_next)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
              (not (cur-step ?s))
              (cur-step ?s_next)
            )
  )

  ;; memory: requires cats O0, spring O1, spring O2, next O0 O1
  ;; adds next O0 O2, deletes next O0 O1
  ;; advances the global step
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?s_next - step)
    :precondition (and
                    (cats ?o0)
                    (spring ?o1)
                    (spring ?o2)
                    (next ?o0 ?o1)
                    (cur-step ?s)
                    (step-succ ?s ?s_next)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
              (not (cur-step ?s))
              (cur-step ?s_next)
            )
  )

  ;; tightfisted: requires hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1
  ;; adds next O0 O2, deletes vase O0 O1
  ;; advances the global step
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?s_next - step)
    :precondition (and
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (vase ?o0 ?o1)
                    (cur-step ?s)
                    (step-succ ?s ?s_next)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
              (not (cur-step ?s))
              (cur-step ?s_next)
            )
  )

)