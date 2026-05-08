(define (problem craving-goal)
  (:domain craving-economy)
  (:objects
    a b c d - object
  )

  ;; Initial state translated from the human specification:
  ;; - b craves d
  ;; - c craves b
  ;; - harmony true
  ;; - planet a true
  ;; - planet d true
  ;; - province a true
  ;; - province c true
  (:init
    (craves b d)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province a)
    (province c)
  )

  ;; Goal: a craves c  AND  b craves a
  (:goal (and
    (craves a c)
    (craves b a)
  ))
)