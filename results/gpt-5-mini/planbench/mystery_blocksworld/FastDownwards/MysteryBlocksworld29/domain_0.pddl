(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types ag)

  (:predicates
    (offered ?from - ag ?to - ag)    ; an offer from one agent to another has occurred and is persistent
    (craves ?who - ag ?whom - ag)    ; who currently craves whom
  )

  ; Actions are kept distinct and prefixed by the originating agent identifier.
  ; Each action name is concrete (no parameters) to preserve agent-specific provenance
  ; and to avoid requiring :equality or other unsupported requirements.

  ;; Agent c offers to agent a
  (:action act_c_offer_a
    :precondition (not (offered c a))
    :effect (and
      (offered c a)
    )
  )

  ;; Agent a offers to agent b
  (:action act_a_offer_b
    :precondition (not (offered a b))
    :effect (and
      (offered a b)
    )
  )

  ;; Agent a adopts a craving for agent c; auditor correction: this is only possible after c offered to a
  (:action act_a_adopt_crave_c
    :precondition (and
      (offered c a)        ; enforced ordering: c must offer to a before a can crave c
      (not (craves a c))   ; cannot re-adopt if already true
    )
    :effect (and
      (craves a c)
    )
  )

  ;; Agent b adopts a craving for agent a; must be preceded by an offer from a to b
  (:action act_b_adopt_crave_a
    :precondition (and
      (offered a b)        ; enforced ordering: a must offer to b before b can crave a
      (not (craves b a))
    )
    :effect (and
      (craves b a)
    )
  )
)