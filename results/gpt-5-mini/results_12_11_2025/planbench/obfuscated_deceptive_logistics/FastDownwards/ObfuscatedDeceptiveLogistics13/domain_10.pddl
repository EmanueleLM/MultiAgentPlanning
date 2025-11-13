(define (domain ObfuscatedDeceptiveLogistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hand cat texture sneeze stupendous - object
    spring_texture - texture
  )

  (:predicates
    (vase ?a - hand ?b - cat)
    (next ?a - object ?b - texture)
    (collect ?a - texture ?b - stupendous)
  )

  ;; paltry(subject:hand, obj1:cat, obj2:texture)
  ;; Preconditions: vase(subject,obj1), next(obj1,obj2)
  ;; Effects: add next(subject,obj2), remove vase(subject,obj1)
  (:action paltry
    :parameters (?subj - hand ?obj1 - cat ?obj2 - texture)
    :precondition (and
      (vase ?subj ?obj1)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (next ?subj ?obj2)
      (not (vase ?subj ?obj1))
    )
  )

  ;; sip(subject:hand, obj1:cat, obj2:texture)
  ;; Preconditions: next(subject,obj2), next(obj1,obj2)
  ;; Effects: add vase(subject,obj1), remove next(subject,obj2)
  (:action sip
    :parameters (?subj - hand ?obj1 - cat ?obj2 - texture)
    :precondition (and
      (next ?subj ?obj2)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (vase ?subj ?obj1)
      (not (next ?subj ?obj2))
    )
  )

  ;; clip(subject:hand, sneeze_obj:sneeze, tex_obj:texture)
  ;; Preconditions: next(sneeze_obj,tex_obj), next(subject,tex_obj)
  ;; Effects: add vase(subject,sneeze_obj), remove next(subject,tex_obj)
  (:action clip
    :parameters (?subj - hand ?sneeze_obj - sneeze ?tex_obj - texture)
    :precondition (and
      (next ?sneeze_obj ?tex_obj)
      (next ?subj ?tex_obj)
    )
    :effect (and
      (vase ?subj ?sneeze_obj)
      (not (next ?subj ?tex_obj))
    )
  )

  ;; wretched(obj0:sneeze, obj1:texture, obj2:texture, obj3:stupendous)
  ;; Preconditions: next(obj0,obj1), collect(obj1,obj3), collect(obj2,obj3)
  ;; Effects: add next(obj0,obj2), remove next(obj0,obj1)
  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous)
    :precondition (and
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory(obj0:cat, obj1:spring_texture, obj2:spring_texture)
  ;; Preconditions: next(obj0,obj1)
  ;; Effects: add next(obj0,obj2), remove next(obj0,obj1)
  (:action memory
    :parameters (?o0 - cat ?o1 - spring_texture ?o2 - spring_texture)
    :precondition (and
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted(subject:hand, sneeze_obj:sneeze, tex_obj:texture)
  ;; Preconditions: next(sneeze_obj,tex_obj), vase(subject,sneeze_obj)
  ;; Effects: add next(subject,tex_obj), remove vase(subject,sneeze_obj)
  (:action tightfisted
    :parameters (?subj - hand ?sneeze_obj - sneeze ?tex_obj - texture)
    :precondition (and
      (next ?sneeze_obj ?tex_obj)
      (vase ?subj ?sneeze_obj)
    )
    :effect (and
      (next ?subj ?tex_obj)
      (not (vase ?subj ?sneeze_obj))
    )
  )
)