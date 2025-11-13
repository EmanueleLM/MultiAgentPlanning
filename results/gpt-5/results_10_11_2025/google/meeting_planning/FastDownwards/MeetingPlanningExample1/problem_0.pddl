(define (problem betty_meetup_fd_p)
  (:domain betty_meetup_fd)

  (:init
    (at-richmond_district)
    (= (time) 540)       ; 09:00
    (= (met-betty) 0)
  )

  (:goal (and
    (>= (met-betty) 60)
    (<= (time) 1305)     ; no later than 21:45
  ))

  (:metric maximize (met-betty))
)