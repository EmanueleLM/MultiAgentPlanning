(define (domain obfuscated_deceptive_logistics16)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    entity time
    spring - texture
    texture hand cat sneeze stupendous - entity
  )

  (:predicates
    (vase ?x - entity ?y - entity)
    (next ?x - entity ?y - entity)
    (collect ?x - entity ?y - entity)
    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - texture ?tcur - time ?tnext - time)
    :precondition (and
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (now ?tcur)
      (succ ?tcur ?tnext)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (now ?tcur))
      (now ?tnext)
    )
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - texture ?tcur - time ?tnext - time)
    :precondition (and
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (now ?tcur)
      (succ ?tcur ?tnext)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (now ?tcur))
      (now ?tnext)
    )
  )

  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture ?tcur - time ?tnext - time)
    :precondition (and
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (now ?tcur)
      (succ ?tcur ?tnext)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (now ?tcur))
      (now ?tnext)
    )
  )

  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous ?tcur - time ?tnext - time)
    :precondition (and
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (now ?tcur)
      (succ ?tcur ?tnext)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (now ?tcur))
      (now ?tnext)
    )
  )

  (:action memory
    :parameters (?o0 - cat ?o1 - spring ?o2 - spring ?tcur - time ?tnext - time)
    :precondition (and
      (next ?o0 ?o1)
      (now ?tcur)
      (succ ?tcur ?tnext)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (now ?tcur))
      (now ?tnext)
    )
  )

  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture ?tcur - time ?tnext - time)
    :precondition (and
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (now ?tcur)
      (succ ?tcur ?tnext)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (now ?tcur))
      (now ?tnext)
    )
  )
)