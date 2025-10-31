(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
  )

  ;; Action: clip
  ;; From agent summary:
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; effects: add vase ?h ?s, remove next ?h ?t
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; Action: wretched
  ;; From agent summary:
  ;; pre: sneeze ?s, texture ?t1, texture ?t2, stupendous ?st,
  ;;      next ?s ?t1, collect ?t1 ?st, collect ?t2 ?st
  ;; effects: add next ?s ?t2, remove next ?s ?t1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: tightfisted
  ;; From agent summary:
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; effects: add next ?h ?t, remove vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

  ;; Action: paltry
  ;; Mentioned by agent2 as an available action. Agent2 gave no explicit effects.
  ;; Provide a distinct, conservative capability that can move a 'next' relation
  ;; from a source (sneeze->texture) to a hand->texture relation (add only).
  ;; This models the agent's intent to change next relations without deleting sources.
  (:action paltry
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
    )
    :effect (and
      (next ?h ?t)
    )
  )

  ;; Action: sip
  ;; Mentioned by agent2. Provide an alternative transformation that transfers
  ;; the next-link from a source to a hand, removing the original link.
  (:action sip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (next ?s ?t))
    )
  )

  ;; Action: memory
  ;; Mentioned by agent2. Provide a capability that allows a hand to acquire a next
  ;; relation to a texture when that texture is associated (collected) with a stupendous object.
  (:action memory
    :parameters (?h - obj ?s - obj ?t - obj ?st - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (stupendous ?st)
      (collect ?t ?st)
    )
    :effect (and
      (next ?h ?t)
    )
  )

)