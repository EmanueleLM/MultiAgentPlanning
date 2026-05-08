(define (problem craving-problem)
  (:domain craving-domain)
  ; Modeling notes:
  ; - Initial state contains four named objects: a, b, c, d.
  ; - No craving relations hold initially. The only way to achieve the goal
  ;   is to apply the three domain actions in the enforced order:
  ;     1) establish-a-craves-c
  ;     2) establish-b-craves-a
  ;     3) establish-d-craves-b
  ;   The domain actions' preconditions prevent any other ordering.
  ; - All natural-language preferences have been enforced as hard ordering
  ;   constraints via action preconditions; there are no soft constraints.
  :objects a b c d - obj

  :init
    (object a)
    (object b)
    (object c)
    (object d)
    ; No (craves ...) facts initially.

  :goal (and
    (craves a c)
    (craves b a)
    (craves d b)
  )
)