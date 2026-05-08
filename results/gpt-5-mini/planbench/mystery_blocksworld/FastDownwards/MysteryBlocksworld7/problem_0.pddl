(define (problem craving-problem)
  (:domain craving-domain)

  ; Modeling decisions:
  ; - Objects are the four named items {a,b,c,d}.
  ; - Initially no (craves ...) facts hold (the absence of a predicate
  ;   in :init encodes false).
  ; - A single action form-crave(?from,?to) can create any craving relation
  ;   between two objects, but only if that relation does not already hold.
  ; - The goal explicitly requires the three mandated cravings:
  ;     a craves c, b craves a, and d craves b.
  ; - No additional actions, resources, or phases were introduced.
  ; - All natural-language preferences were interpreted as hard constraints;
  ;   there are none beyond the stated final cravings.
  ; - Because no ordering was implied among the three required cravings,
  ;   the planner may achieve them in any order.

  :objects a b c d - obj

  :init
    ; No initial craves: nothing listed here (absence means false).
  :goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
    )
)