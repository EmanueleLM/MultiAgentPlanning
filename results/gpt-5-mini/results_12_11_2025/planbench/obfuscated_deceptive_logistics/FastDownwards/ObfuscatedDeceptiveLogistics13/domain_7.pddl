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

  ;; paltry(subject, obj1, obj2)
  ;; Requires: hand subject, cats obj1, texture obj2, vase subject obj1, next obj1 obj2, and that the subject currently has a next relation (contiguous occupancy).
  ;; Effects: remove the subject's previous next relation, add next subject obj2, remove vase subject obj1.
  (:action paltry
    :parameters (?subj ?obj1 ?obj2 ?old - object ?s ?s2 - stage)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (vase ?subj ?obj1)
      (next ?obj1 ?obj2)
      (next ?subj ?old)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (next ?subj ?obj2)
      (not (next ?subj ?old))
      (not (vase ?subj ?obj1))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; sip(subject, obj1, obj2)
  ;; Requires: hand subject, cats obj1, texture obj2, next subject obj2, next obj1 obj2.
  ;; Effects: add vase subject obj1, remove next subject obj2.
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

  ;; clip(subject, sneeze_obj, tex_obj)
  ;; Requires: hand subject, sneeze sneeze_obj, texture tex_obj, next sneeze_obj tex_obj, next subject tex_obj.
  ;; Effects: add vase subject sneeze_obj, remove next subject tex_obj.
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

  ;; wretched(obj0, obj1, obj2, obj3)
  ;; Requires: sneeze obj0, texture obj1, texture obj2, stupendous obj3, next obj0 obj1, collect obj1 obj3, collect obj2 obj3.
  ;; Effects: replace next obj0 obj1 with next obj0 obj2.
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

  ;; memory(obj0, obj1, obj2)
  ;; Requires: cats obj0, spring obj1, spring obj2, next obj0 obj1.
  ;; Effects: replace next obj0 obj1 with next obj0 obj2.
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

  ;; tightfisted(subject, sneeze_obj, tex_obj)
  ;; Requires: hand subject, sneeze sneeze_obj, texture tex_obj, next sneeze_obj tex_obj, vase subject sneeze_obj, and that the subject currently has a next relation (contiguous occupancy).
  ;; Effects: remove the subject's previous next relation, add next subject tex_obj, remove vase subject sneeze_obj.
  (:action tightfisted
    :parameters (?subj ?sneeze_obj ?tex_obj ?old - object ?s ?s2 - stage)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (vase ?subj ?sneeze_obj)
      (next ?subj ?old)
      (current-stage ?s)
      (stage-next ?s ?s2)
    )
    :effect (and
      (next ?subj ?tex_obj)
      (not (next ?subj ?old))
      (not (vase ?subj ?sneeze_obj))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)