(define (domain ObfuscatedDeceptiveLogistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage
          cat hand textured sneeze stupendous)

  (:predicates
    (vase ?o - obj ?p - obj)
    (collect ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (spring ?o - obj)
    (stage-available ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - textured ?s - stage ?s2 - stage)
    :precondition (and
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - textured ?s - stage ?s2 - stage)
    :precondition (and
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - textured ?s - stage ?s2 - stage)
    :precondition (and
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  (:action wretched
    :parameters (?o0 - sneeze ?o1 - textured ?o2 - textured ?o3 - stupendous ?s - stage ?s2 - stage)
    :precondition (and
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  (:action memory
    :parameters (?o0 - cat ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - textured ?s - stage ?s2 - stage)
    :precondition (and
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )
)