(define (domain ObfuscatedDeceptiveLogistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

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
  )

  ;; paltry(subject, obj1, obj2)
  ;; Preconditions: hand(subject), cats(obj1), texture(obj2), vase(subject,obj1), next(obj1,obj2)
  ;; Effects: add next(subject,obj2), remove vase(subject,obj1)
  (:action paltry
    :parameters (?subj ?obj1 ?obj2 - object)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (vase ?subj ?obj1)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (next ?subj ?obj2)
      (not (vase ?subj ?obj1))
    )
  )

  ;; sip(subject, obj1, obj2)
  ;; Preconditions: hand(subject), cats(obj1), texture(obj2), next(subject,obj2), next(obj1,obj2)
  ;; Effects: add vase(subject,obj1), remove next(subject,obj2)
  (:action sip
    :parameters (?subj ?obj1 ?obj2 - object)
    :precondition (and
      (hand ?subj)
      (cats ?obj1)
      (texture ?obj2)
      (next ?subj ?obj2)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (vase ?subj ?obj1)
      (not (next ?subj ?obj2))
    )
  )

  ;; clip(subject, sneeze_obj, tex_obj)
  ;; Preconditions: hand(subject), sneeze(sneeze_obj), texture(tex_obj), next(sneeze_obj,tex_obj), next(subject,tex_obj)
  ;; Effects: add vase(subject,sneeze_obj), remove next(subject,tex_obj)
  (:action clip
    :parameters (?subj ?sneeze_obj ?tex_obj - object)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (next ?subj ?tex_obj)
    )
    :effect (and
      (vase ?subj ?sneeze_obj)
      (not (next ?subj ?tex_obj))
    )
  )

  ;; wretched(obj0, obj1, obj2, obj3)
  ;; Preconditions: sneeze(obj0), texture(obj1), texture(obj2), stupendous(obj3), next(obj0,obj1), collect(obj1,obj3), collect(obj2,obj3)
  ;; Effects: add next(obj0,obj2), remove next(obj0,obj1)
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

  ;; memory(obj0, obj1, obj2)
  ;; Preconditions: cats(obj0), spring(obj1), spring(obj2), next(obj0,obj1)
  ;; Effects: add next(obj0,obj2), remove next(obj0,obj1)
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

  ;; tightfisted(subject, sneeze_obj, tex_obj)
  ;; Preconditions: hand(subject), sneeze(sneeze_obj), texture(tex_obj), next(sneeze_obj,tex_obj), vase(subject,sneeze_obj)
  ;; Effects: add next(subject,tex_obj), remove vase(subject,sneeze_obj)
  (:action tightfisted
    :parameters (?subj ?sneeze_obj ?tex_obj - object)
    :precondition (and
      (hand ?subj)
      (sneeze ?sneeze_obj)
      (texture ?tex_obj)
      (next ?sneeze_obj ?tex_obj)
      (vase ?subj ?sneeze_obj)
    )
    :effect (and
      (next ?subj ?tex_obj)
      (not (vase ?subj ?sneeze_obj))
    )
  )
)