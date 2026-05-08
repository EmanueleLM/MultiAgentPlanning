(define (domain orchestrator)
  ; Revised PDDL domain for ObfuscatedDeceptiveLogistics23
  ; Requirements: STRIPS + negative preconditions (used for has_next checks)
  (:requirements :strips :negative-preconditions)

  ;; Predicates (canonicalized)
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
    (has_next ?x)  ; unary flag: subject currently has some next relation
  )

  ; Action: paltry
  ; Preconditions: hand, cat, texture, vase(hand,cat), next(cat,tex), hand must not already have a next
  ; Effects: add next(hand,tex) and mark has_next(hand); remove vase(hand,cat)
  (:action paltry
    :parameters (?p_hand ?p_cat ?p_tex)
    :precondition (and
      (hand ?p_hand)
      (cat ?p_cat)
      (texture ?p_tex)
      (vase ?p_hand ?p_cat)
      (next ?p_cat ?p_tex)
      (not (has_next ?p_hand))
    )
    :effect (and
      (next ?p_hand ?p_tex)
      (has_next ?p_hand)
      (not (vase ?p_hand ?p_cat))
    )
  )

  ; Action: sip
  ; Preconditions: hand, cat, texture, both hand and cat point to the same texture
  ; Effects: create vase(hand,cat) and remove the hand->texture next (so unset has_next(hand))
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
      (not (has_next ?p_hand))
    )
  )

  ; Action: clip
  ; Preconditions: hand, sneeze, texture, both hand and sneeze point to the same texture
  ; Effects: create vase(hand,sneeze) and remove the hand->texture next (unset has_next(hand))
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
      (not (has_next ?p_hand))
    )
  )

  ; Action: wretched
  ; Preconditions: sneeze, two textures, a stupendous object, sneeze->tex1 next,
  ;                and both textures collected in the stupendous object.
  ; Effects: move next(sneeze,tex1) -> next(sneeze,tex2). has_next for sneeze remains true.
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
      ;; has_next remains true for ?p_sneeze (swap), so no change to has_next
    )
  )

  ; Action: memory
  ; Preconditions: cat, two springs, cat->spr1 next
  ; Effects: move next(cat,spr1) -> next(cat,spr2). has_next for cat remains true.
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
      ;; has_next remains true for ?p_cat (swap)
    )
  )

  ; Action: tightfisted
  ; Preconditions: hand, sneeze, texture, sneeze->texture next, vase(hand,sneeze), and hand must not already have a next
  ; Effects: add next(hand,texture) and mark has_next(hand); remove vase(hand,sneeze)
  (:action tightfisted
    :parameters (?p_hand ?p_sneeze ?p_tex)
    :precondition (and
      (hand ?p_hand)
      (sneeze ?p_sneeze)
      (texture ?p_tex)
      (next ?p_sneeze ?p_tex)
      (vase ?p_hand ?p_sneeze)
      (not (has_next ?p_hand))
    )
    :effect (and
      (next ?p_hand ?p_tex)
      (has_next ?p_hand)
      (not (vase ?p_hand ?p_sneeze))
    )
  )

)