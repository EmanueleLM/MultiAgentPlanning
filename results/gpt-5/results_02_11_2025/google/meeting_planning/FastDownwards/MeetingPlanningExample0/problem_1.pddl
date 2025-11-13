(define (problem meet-stephanie-prob)
  (:domain meet-stephanie)
  (:init
    (at marina)
    (= (now) 0)
    (= (met-stephanie) 0)
    (= (open-stephanie) 90)    ; 10:30 AM relative to 09:00 start
    (= (close-stephanie) 270)  ; 1:30 PM relative to 09:00 start
    (= (tt marina mission) 20)
    (= (tt mission marina) 19)
  )
  (:goal
    (and
      (>= (met-stephanie) 120)
    )
  )
)