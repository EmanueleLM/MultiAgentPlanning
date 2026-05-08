(define (problem predator-problem)
  (:domain predator-domain)
  ;; Objects: four creatures named a, b, c, d as required.
  (:objects a b c d - creature)

  ;; Initial facts:
  ;; Conservative resolution: all creatures start alive and with no dominance, succumbed, overcame, or craves facts.
  ;; If other initial dominance/succumb facts were intended by the original inputs, they should be added here;
  ;; omitted facts are treated as false.
  (:init
    (alive a)
    (alive b)
    (alive c)
    (alive d)
    ;; Intentionally no (dominating ...) facts are asserted here so that any dominance must be
    ;; established during the plan via attack or overcome.
    ;; Intentionally no (succumbed ...) facts are asserted here so that succumb must occur after a dominator exists.
    ;; Intentionally no (craves ...) facts are asserted here so that craves must be produced by feast actions.
  )

  ;; Goal: require that c craves b AND d craves a (both must hold in the final state).
  ;; This also enforces that the necessary feast actions must have occurred (because craves is only added by feast).
  (:goal (and
    (craves c b)
    (craves d a)
  ))

  ;; Notes:
  ;; - The enforced sequence for any predator-prey pair is attack -> succumb -> feast because:
  ;;   * attack is required to create (dominating predator prey)
  ;;   * succumb requires (dominating predator prey) and produces (succumbed prey)
  ;;   * feast requires both (dominating predator prey) and (succumbed prey) and produces (craves predator prey)
  ;; - No penalty or bookkeeping actions exist; violating the sequence or trying to feast without prior steps is impossible.