(define (problem trip-9days)
  (:domain trip-planning)
  (:objects
    Oslo Valencia Dublin - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; All days initially free
    (free d1) (free d2) (free d3) (free d4) (free d5) (free d6) (free d7) (free d8) (free d9)

    ;; Direct flights available (only the declared direct connections)
    (flight Oslo Dublin)
    (flight Dublin Oslo)
    (flight Dublin Valencia)
    (flight Valencia Dublin)
  )

  (:goal
    (and
      (oslo-scheduled)
      (valencia-scheduled)
      (dublin-scheduled)
    )
  )
)