(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (craves ?from - obj ?to - obj)
    (phase0)
    (phase1)
    (phase2)
  )

  ;; Establish that object d craves object a.
  ;; This action may only run in the initial phase0 and only if the relation does not already hold.
  (:action establish-crave-d-to-a
    :parameters ()
    :precondition (and (phase0) (not (craves d a)))
    :effect (and (craves d a) (not (phase0)) (phase1))
  )

  ;; Establish that object b craves object d.
  ;; This action is strictly ordered after d->a; it requires phase1 (set only after establish-crave-d-to-a).
  (:action establish-crave-b-to-d
    :parameters ()
    :precondition (and (phase1) (not (craves b d)))
    :effect (and (craves b d) (not (phase1)) (phase2))
  )
)