(define (problem trip-9days)
  (:domain trip-planning)
  (:objects
    Oslo Valencia Dublin - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; all days initially free
    (free d1) (free d2) (free d3) (free d4) (free d5) (free d6) (free d7) (free d8) (free d9)
    ;; direct flight connections (only direct flights allowed)
    (flight Oslo Dublin)
    (flight Dublin Oslo)
    (flight Dublin Valencia)
    (flight Valencia Dublin)
  )

  ;; Goals: schedule the required stays for each city (Oslo 3 days, Valencia days 5..9, Dublin 3 days)
  (:goal
    (and
      (oslo-scheduled)
      (valencia-scheduled)
      (dublin-scheduled)
    )
  )
)