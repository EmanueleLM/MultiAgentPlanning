(define (domain ObfuscatedDeceptiveLogistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (collect ?a - object ?b - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    ;; explicit stage progression to enforce ordered single-action-per-stage
    (current-stage ?s - stage)
    (stage-next ?s1 - stage ?s2 - stage)
  )

  ; paltry(subject, obj1, obj2)
  (:action paltry
    :parameters (?subj - object ?obj1 - object ?obj2 - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (vase ?subj ?obj1)
      (next ?obj1 ?obj2)
      (stage-next ?st ?st2)
      (current-stage ?st)
    )
    :effect (and
      (next ?subj ?obj2)
      (not (vase ?subj ?obj1))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; sip(subject, obj1, obj2)
  (:action sip
    :parameters (?subj - object ?obj1 - object ?obj2 - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (next ?subj ?obj2)
      (next ?obj1 ?obj2)
      (stage-next ?st ?st2)
      (current-stage ?st)
    )
    :effect (and
      (vase ?subj ?obj1)
      (not (next ?subj ?obj2))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; clip(subject, sneeze_obj, texture_obj)
  (:action clip
    :parameters (?subj - object ?sneeze_obj - object ?tex_obj - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (next ?subj ?tex_obj)
      (stage-next ?st ?st2)
      (current-stage ?st)
    )
    :effect (and
      (vase ?subj ?sneeze_obj)
      (not (next ?subj ?tex_obj))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; wretched(obj0, obj1, obj2, obj3)
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?st - stage ?st2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (stage-next ?st ?st2)
      (current-stage ?st)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; memory(obj0, obj1, obj2)
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?st - stage ?st2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (stage-next ?st ?st2)
      (current-stage ?st)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ; tightfisted(subject, sneeze_obj, texture_obj)
  (:action tightfisted
    :parameters (?subj - object ?sneeze_obj - object ?tex_obj - object ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (vase ?subj ?sneeze_obj)
      (stage-next ?st ?st2)
      (current-stage ?st)
    )
    :effect (and
      (next ?subj ?tex_obj)
      (not (vase ?subj ?sneeze_obj))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

)