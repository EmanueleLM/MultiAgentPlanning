(define (domain obfuscated_deceptive_logistics_6)
  (:requirements :strips)

  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o1 ?o2)
    (next ?o1 ?o2)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?o1 ?o2)
    (spring ?o)
  )

  ;; Paltry moves a 'hand' object from being 'vase' with a 'cats' package
  ;; to being 'next' (at) a 'texture' location, provided the package is there.
  (:action paltry
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; Sip makes a 'hand' object 'vase' with a 'cats' package,
  ;; removing the hand's direct 'next' location.
  (:action sip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; Clip is the 'sneeze' package version of 'sip'.
  (:action clip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; Wretched moves a 'sneeze' package between 'texture' locations
  ;; that belong to the same 'stupendous' region.
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; Memory moves a 'cats' package between 'spring' locations.
  (:action memory
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; Tightfisted is the 'sneeze' package version of 'paltry'.
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)