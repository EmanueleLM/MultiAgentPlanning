(define (problem meet-stephanie-prob)
  (:domain meet-stephanie)
  (:init
    (at marina)
    (= (now) 0)
    (= (met-stephanie) 0)
    (= (open-stephanie) 90)
    (= (close-stephanie) 270)
    (= (tt marina mission) 20)
    (= (tt mission marina) 19)
  )
  (:goal
    (and
      (>= (met-stephanie) 120)
    )
  )
)