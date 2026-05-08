(define (domain obfuscated_deceptive_logistics29)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    (hand ?o - item)
    (cats ?o - item)
    (texture ?o - item)
    (vase ?a - item ?b - item)
    (next ?a - item ?b - item)
    (sneeze ?o - item)
    (spring ?o - item)
    (collect ?a - item ?b - item)
    (stupendous ?o - item)
  )

  ;; paltry: requires hand O0, cats O1, texture O2, vase O0 O1, next O1 O2
  ;; effects: add next O0 O2, del vase O0 O1
  (:action paltry
    :parameters (?o0 - item ?o1 - item ?o2 - item)
    :precondition (and
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (vase ?o0 ?o1)
                    (next ?o1 ?o2)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
            )
  )

  ;; sip: requires hand O0, cats O1, texture O2, next O0 O2, next O1 O2
  ;; effects: add vase O0 O1, del next O0 O2
  (:action sip
    :parameters (?o0 - item ?o1 - item ?o2 - item)
    :precondition (and
                    (hand ?o0)
                    (cats ?o1)
                    (texture ?o2)
                    (next ?o0 ?o2)
                    (next ?o1 ?o2)
                  )
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
            )
  )

  ;; clip: requires hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2
  ;; effects: add vase O0 O1, del next O0 O2
  (:action clip
    :parameters (?o0 - item ?o1 - item ?o2 - item)
    :precondition (and
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (next ?o0 ?o2)
                  )
    :effect (and
              (vase ?o0 ?o1)
              (not (next ?o0 ?o2))
            )
  )

  ;; wretched: requires sneeze O0, texture O1, texture O2, stupendous O3,
  ;;           next O0 O1, collect O1 O3, collect O2 O3
  ;; effects: add next O0 O2, del next O0 O1
  (:action wretched
    :parameters (?o0 - item ?o1 - item ?o2 - item ?o3 - item)
    :precondition (and
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
            )
  )

  ;; memory: requires cats O0, spring O1, spring O2, next O0 O1
  ;; effects: add next O0 O2, del next O0 O1
  (:action memory
    :parameters (?o0 - item ?o1 - item ?o2 - item)
    :precondition (and
                    (cats ?o0)
                    (spring ?o1)
                    (spring ?o2)
                    (next ?o0 ?o1)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (next ?o0 ?o1))
            )
  )

  ;; tightfisted: requires hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1
  ;; effects: add next O0 O2, del vase O0 O1
  (:action tightfisted
    :parameters (?o0 - item ?o1 - item ?o2 - item)
    :precondition (and
                    (hand ?o0)
                    (sneeze ?o1)
                    (texture ?o2)
                    (next ?o1 ?o2)
                    (vase ?o0 ?o1)
                  )
    :effect (and
              (next ?o0 ?o2)
              (not (vase ?o0 ?o1))
            )
  )

)