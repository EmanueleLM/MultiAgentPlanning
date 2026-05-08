(define (domain orchestrator)
  ;; Domain produced by "orchestrator"
  ;; Conservative modeling: unary predicates (hand, cats, texture, sneeze, spring, stupendous)
  ;; are treated as static type-like tags (no actions add/remove them).
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)                ; object is a hand
    (cats ?x)                ; object is a cat
    (texture ?x)             ; object is a texture
    (vase ?h ?holder)        ; a vase relation: hand ?h holds vase with holder ?holder
    (next ?x ?y)             ; connectivity / location relation
    (sneeze ?x)              ; object is sneeze-type
    (spring ?x)              ; object is spring-type
    (stupendous ?x)         ; object is stupendous-type
    (collect ?x ?y)         ; collect relation (static, used by wretched)
  )

  ;; Action: paltry (namespaced as paltry_hand)
  ;; Transfers a vase-held holder into a next link from hand to a texture; removes the vase.
  (:action paltry_hand
    :parameters (?h ?c ?t)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      ;; distinctness constraints (conservative)
      (not (= ?h ?c))
      (not (= ?c ?t))
      (not (= ?h ?t))
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; Action: sip (namespaced as sip_hand)
  ;; Creates a vase relation for a hand with a cat-holder when both share the same texture link; removes the hand->texture next link.
  (:action sip_hand
    :parameters (?h ?c ?t)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      ;; distinctness
      (not (= ?h ?c))
      (not (= ?c ?t))
      (not (= ?h ?t))
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Action: clip (namespaced as clip_hand)
  ;; Creates a vase where the holder is a sneeze-object, when both hand and sneeze share the same texture link; removes the hand->texture next link.
  (:action clip_hand
    :parameters (?h ?s ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      ;; distinctness
      (not (= ?h ?s))
      (not (= ?s ?t))
      (not (= ?h ?t))
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; Action: wretched (namespaced as wretched_sneeze)
  ;; For a sneeze object, change its next connection from one texture to another when both textures collect the same stupendous object.
  (:action wretched_sneeze
    :parameters (?s ?t1 ?t2 ?sp)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?s ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
      ;; distinctness (conservative)
      (not (= ?t1 ?t2))
      (not (= ?s ?t1))
      (not (= ?s ?t2))
      (not (= ?sp ?s))
      (not (= ?sp ?t1))
      (not (= ?sp ?t2))
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory (namespaced as memory_cats)
  ;; For a cat, move its next link from one spring to another spring.
  (:action memory_cats
    :parameters (?c ?s1 ?s2)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      ;; distinctness
      (not (= ?s1 ?s2))
      (not (= ?c ?s1))
      (not (= ?c ?s2))
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; Action: tightfisted (namespaced as tightfisted_hand)
  ;; Converts a vase with a sneeze-holder into a next link from the hand to the texture that the sneeze-holder points to.
  (:action tightfisted_hand
    :parameters (?h ?s ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
      ;; distinctness
      (not (= ?h ?s))
      (not (= ?s ?t))
      (not (= ?h ?t))
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)