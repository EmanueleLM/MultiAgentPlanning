(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    entity hand cat sneeze - object
    texture stupendous - object
    spring - texture
  )

  ; Predicates (typed arguments)
  (:predicates
    (next ?e - entity ?t - texture)         ; directed adjacency/position from an entity to a texture
    (collect ?t - texture ?p - stupendous)  ; texture collected by a stupendous object
    (vase ?h - hand ?e - entity)            ; vase relation between a hand and an entity (cat or sneeze)
  )

  ; Actions.
  ; All actions are kept distinct and follow the normalized schemas from the analyst output.
  ; Agent ownership is annotated in comments next to each action name.

  ; Action: paltry  (agent intent: create a hand->texture link by consuming a hand->cat vase)
  (:action paltry
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ; Action: sip  (agent intent: create vase between hand and cat when both point to same texture)
  (:action sip
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ; Action: clip  (agent intent: create vase between hand and sneeze when both point to same texture)
  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ; Action: wretched  (agent intent: move a sneeze's next link from one texture to another collected by same stupendous)
  (:action wretched
    :parameters (?s0 - sneeze ?t1 - texture ?t2 - texture ?p - stupendous)
    :precondition (and
      (next ?s0 ?t1)
      (collect ?t1 ?p)
      (collect ?t2 ?p)
    )
    :effect (and
      (next ?s0 ?t2)
      (not (next ?s0 ?t1))
    )
  )

  ; Action: memory  (agent intent: move a cat's next link between springs)
  (:action memory
    :parameters (?c - cat ?s1 - spring ?s2 - spring)
    :precondition (and
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ; Action: tightfisted  (agent intent: convert a vase(hand,sneeze) into a hand->texture link if sneeze points to that texture)
  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and
      (vase ?h ?s)
      (next ?s ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)