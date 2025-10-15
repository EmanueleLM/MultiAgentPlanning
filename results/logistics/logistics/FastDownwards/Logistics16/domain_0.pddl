(define (domain objects_domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (collect ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; Action: Paltry(x,y,z)
  ;; Informal summary (encoded as STRIPS action):
  ;; Preconditions: next(x,y) and hand(z)
  ;; Effects: add next(x,z)
  ;; Note: does not delete existing next facts (adds a new next relation).
  (:action Paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (next ?x ?y) (hand ?z))
    :effect (and (next ?x ?z))
  )

  ;; Action: Sip(x,y,z)
  ;; Informal summary:
  ;; Preconditions: sneeze(x) and next(y,z)
  ;; Effects: add next(y,x)
  (:action Sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (sneeze ?x) (next ?y ?z))
    :effect (and (next ?y ?x))
  )

  ;; Action: Clip(x,y,z)
  ;; Informal summary:
  ;; Preconditions: collect(x,y), stupendous(y), texture(x)
  ;; Effects: add next(x,z)
  ;; If additional preconditions/effects existed in the (informal) spec they are unknown;
  ;; this action encodes the core known pattern (produce next relations from collect/stupendous/texture).
  (:action Clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (collect ?x ?y) (stupendous ?y) (texture ?x))
    :effect (and (next ?x ?z))
  )

  ;; Action: Wretched(x,y,z,w)
  ;; Informal summary:
  ;; Preconditions: collect(x,y), next(z,w), spring(z), texture(z)
  ;; Effects: delete next(z,w); add vase(x,y); add next(x,w)
  ;; This encodes a multi-parameter action that both modifies next relations and creates a vase relation.
  (:action Wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and (collect ?x ?y) (next ?z ?w) (spring ?z) (texture ?z))
    :effect (and (not (next ?z ?w)) (vase ?x ?y) (next ?x ?w))
  )

  ;; Action: Memory(x,y,z)
  ;; Informal summary:
  ;; Preconditions: stupendous(y), texture(z)
  ;; Effects: add next(x,z)
  ;; The minimal known pattern (produce next using stupendous and texture) is encoded.
  (:action Memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (stupendous ?y) (texture ?z))
    :effect (and (next ?x ?z))
  )

  ;; Action: Tightfisted(x,y,z)
  ;; Informal summary:
  ;; Preconditions: hand(x), collect(y,z)
  ;; Effects: add vase(y,z)
  ;; Encodes the common pattern of producing a vase relation when a hand and collect are present.
  (:action Tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (collect ?y ?z))
    :effect (and (vase ?y ?z))
  )
)