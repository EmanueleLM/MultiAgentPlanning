(define (domain orchestrator)
  ; Final PDDL domain produced by "orchestrator"
  ; Requirements limited to STRIPS only to maximize FastDownward compatibility
  (:requirements :strips)

  ; Predicates represent normalized property names from analyst output.
  ; We keep predicates as ground unary/binary propositions (no PDDL typing used,
  ; to allow objects to hold multiple type-like predicates where necessary).
  (:predicates
    (hand ?x)
    (cat ?x)
    (texture ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (next ?a ?b)
    (vase ?a ?b)
    (collect ?a ?b)
  )

  ; Actions correspond exactly to the normalized schemas provided by the analyst.
  ; Agent ownership/intent is annotated in comments above each action (informational only).

  ; Action: paltry
  ; Agent-intent: link a hand to a texture when a vase-association to a cat exists;
  ; Preconditions require an existing vase relation and a cat->texture Next link.
  (:action paltry
    :parameters (?p_hand ?p_cat ?p_tex)
    :precondition (and
      (hand ?p_hand)
      (cat ?p_cat)
      (texture ?p_tex)
      (vase ?p_hand ?p_cat)
      (next ?p_cat ?p_tex)
    )
    :effect (and
      (next ?p_hand ?p_tex)
      (not (vase ?p_hand ?p_cat))
    )
  )

  ; Action: sip
  ; Agent-intent: create a vase relation between a hand and a cat if both share the same Next texture;
  ; This consumes the hand->texture Next link.
  (:action sip
    :parameters (?p_hand ?p_cat ?p_tex)
    :precondition (and
      (hand ?p_hand)
      (cat ?p_cat)
      (texture ?p_tex)
      (next ?p_hand ?p_tex)
      (next ?p_cat ?p_tex)
    )
    :effect (and
      (vase ?p_hand ?p_cat)
      (not (next ?p_hand ?p_tex))
    )
  )

  ; Action: clip
  ; Agent-intent: create a vase relation between a hand and a sneeze entity when both
  ; the hand and sneeze point to the same texture; consumes the hand->texture Next link.
  (:action clip
    :parameters (?p_hand ?p_sneeze ?p_tex)
    :precondition (and
      (hand ?p_hand)
      (sneeze ?p_sneeze)
      (texture ?p_tex)
      (next ?p_sneeze ?p_tex)
      (next ?p_hand ?p_tex)
    )
    :effect (and
      (vase ?p_hand ?p_sneeze)
      (not (next ?p_hand ?p_tex))
    )
  )

  ; Action: wretched
  ; Agent-intent: move a sneeze->texture Next link from one texture to another texture,
  ; but only when both textures are collected in the same stupendous object.
  (:action wretched
    :parameters (?p_sneeze ?p_tex1 ?p_tex2 ?p_stup)
    :precondition (and
      (sneeze ?p_sneeze)
      (texture ?p_tex1)
      (texture ?p_tex2)
      (stupendous ?p_stup)
      (next ?p_sneeze ?p_tex1)
      (collect ?p_tex1 ?p_stup)
      (collect ?p_tex2 ?p_stup)
    )
    :effect (and
      (next ?p_sneeze ?p_tex2)
      (not (next ?p_sneeze ?p_tex1))
    )
  )

  ; Action: memory
  ; Agent-intent: move a cat->spring Next link from one spring to another spring.
  (:action memory
    :parameters (?p_cat ?p_spr1 ?p_spr2)
    :precondition (and
      (cat ?p_cat)
      (spring ?p_spr1)
      (spring ?p_spr2)
      (next ?p_cat ?p_spr1)
    )
    :effect (and
      (next ?p_cat ?p_spr2)
      (not (next ?p_cat ?p_spr1))
    )
  )

  ; Action: tightfisted
  ; Agent-intent: convert a vase between a hand and a sneeze into a hand->texture Next
  ; relation, requiring the sneeze->texture Next link; vase consumed.
  (:action tightfisted
    :parameters (?p_hand ?p_sneeze ?p_tex)
    :precondition (and
      (hand ?p_hand)
      (sneeze ?p_sneeze)
      (texture ?p_tex)
      (next ?p_sneeze ?p_tex)
      (vase ?p_hand ?p_sneeze)
    )
    :effect (and
      (next ?p_hand ?p_tex)
      (not (vase ?p_hand ?p_sneeze))
    )
  )

)