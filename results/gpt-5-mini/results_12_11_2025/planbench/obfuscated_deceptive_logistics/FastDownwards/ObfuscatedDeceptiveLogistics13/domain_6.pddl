(define (domain ObfuscatedDeceptiveLogistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a ?b - object)
    (next ?a ?b - object)
    (collect ?a ?b - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (current-stage ?s - stage)
    (stage-next ?s1 ?s2 - stage)
  )

  (:action paltry
    :parameters (?subj ?obj1 ?obj2 - object ?s ?s2 - stage)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (vase ?subj ?obj1)
      (next ?obj1 ?obj2)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (next ?subj ?obj2)
      (not (vase ?subj ?obj1))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action sip
    :parameters (?subj ?obj1 ?obj2 - object ?s ?s2 - stage)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (next ?subj ?obj2)
      (next ?obj1 ?obj2)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (vase ?subj ?obj1)
      (not (next ?subj ?obj2))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action clip
    :parameters (?subj ?sneeze_obj ?tex_obj - object ?s ?s2 - stage)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (next ?subj ?tex_obj)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (vase ?subj ?sneeze_obj)
      (not (next ?subj ?tex_obj))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - object ?s ?s2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action memory
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action tightfisted
    :parameters (?subj ?sneeze_obj ?tex_obj - object ?s ?s2 - stage)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (vase ?subj ?sneeze_obj)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (next ?subj ?tex_obj)
      (not (vase ?subj ?sneeze_obj))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)