(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects a b c d - object)
  (:init
    ;; initial craves relations
    (craves b d)
    (craves c a)
    ;; global harmony
    (harmony)
    ;; planet facts
    (planet a)
    (planet d)
    ;; province facts
    (province b)
    (province c)
    ;; explicit different facts for all distinct ordered pairs
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )
  (:goal (and
    (craves b c)
  ))
)