(define (domain multi_agent_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (cats ?o - object)
    (collect ?o1 ?o2 - object)
    (hand ?o - object)
    (next ?o1 ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?o1 ?o2 - object)
  )

  ;; Action: paltry
  ;; Requires: hand O0, cats O1, texture O2, vase O0 O1, next O1 O2.
  ;; Effects: adds next O0 O2, removes vase O0 O1.
  (:action paltry
    :parameters (?o0 ?o1 ?o2 - object)
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

  ;; Action: sip
  ;; Requires: hand O0, cats O1, texture O2, next O0 O2, next O1 O2.
  ;; Effects: adds vase O0 O1, removes next O0 O2.
  (:action sip
    :parameters (?o0 ?o1 ?o2 - object)
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

  ;; Action: clip
  ;; Requires: hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2.
  ;; Effects: adds vase O0 O1, removes next O0 O2.
  (:action clip
    :parameters (?o0 ?o1 ?o2 - object)
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

  ;; Action: wretched
  ;; Requires: sneeze O0, texture O1, texture O2, stupendous O3, next O0 O1, collect O1 O3, collect O2 O3.
  ;; Effects: adds next O0 O2, removes next O0 O1.
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - object)
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

  ;; Action: memory
  ;; Requires: cats O0, spring O1, spring O2, next O0 O1.
  ;; Effects: adds next O0 O2, removes next O0 O1.
  (:action memory
    :parameters (?o0 ?o1 ?o2 - object)
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

  ;; Action: tightfisted
  ;; Requires: hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1.
  ;; Effects: adds next O0 O2, removes vase O0 O1.
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 - object)
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