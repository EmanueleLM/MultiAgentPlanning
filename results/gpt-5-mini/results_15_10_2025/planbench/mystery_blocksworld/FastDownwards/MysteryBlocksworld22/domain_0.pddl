(define (domain orchestrated_domain)
  (:requirements :typing)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (spring ?o - object)
    (collect ?a - object ?b - object)
  )

  ; player_paltry: Relink ?o from ?old to ?new. Requires the source to be in hand and the new target to have texture.
  (:action player_paltry
    :parameters (?o - object ?old - object ?new - object)
    :precondition (and
      (next ?o ?old)
      (hand ?o)
      (texture ?new)
    )
    :effect (and
      (not (next ?o ?old))
      (next ?o ?new)
    )
  )

  ; player_sip: Relink ?o from ?old to ?new. Requires source in hand and the new target to have spring.
  (:action player_sip
    :parameters (?o - object ?old - object ?new - object)
    :precondition (and
      (next ?o ?old)
      (hand ?o)
      (spring ?new)
    )
    :effect (and
      (not (next ?o ?old))
      (next ?o ?new)
    )
  )

  ; player_clip: Relink ?o from ?old to ?new. Requires the old target to have sneeze and the new target to have texture.
  (:action player_clip
    :parameters (?o - object ?old - object ?new - object)
    :precondition (and
      (next ?o ?old)
      (sneeze ?old)
      (texture ?new)
    )
    :effect (and
      (not (next ?o ?old))
      (next ?o ?new)
    )
  )

  ; player_wretched: Relink ?o from ?old to ?new and add a vase fact about ?v.
  ; Requires source in hand and the new target to have texture.
  ; NOTE: This action adds (vase ?v) unconditionally (see assumptions about ambiguity above).
  (:action player_wretched
    :parameters (?o - object ?old - object ?new - object ?v - object)
    :precondition (and
      (next ?o ?old)
      (hand ?o)
      (texture ?new)
    )
    :effect (and
      (not (next ?o ?old))
      (next ?o ?new)
      (vase ?v)
    )
  )

  ; player_memory: Relink ?o from ?old to ?new. Requires that new is connected by a collect pair with old (conservative choice).
  (:action player_memory
    :parameters (?o - object ?old - object ?new - object)
    :precondition (and
      (next ?o ?old)
      (collect ?new ?old)
    )
    :effect (and
      (not (next ?o ?old))
      (next ?o ?new)
    )
  )

  ; player_tightfisted: Relink ?o from ?old to ?new. Requires that the new target is stupendous.
  (:action player_tightfisted
    :parameters (?o - object ?old - object ?new - object)
    :precondition (and
      (next ?o ?old)
      (stupendous ?new)
    )
    :effect (and
      (not (next ?o ?old))
      (next ?o ?new)
    )
  )

)