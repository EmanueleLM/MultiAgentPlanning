(define (problem sf-day-schedule-prob)
  (:domain sf-day-schedule)

  (:objects
    presidio northbeach - location
    alex chris dana eli farah betty - friend
    t0900 t0915 t1000 t1005 t1030 t1200 t1205 t1300 t1430 t1435 t1500 t1600 t1605 t1615 t1715 t1733 t1845 t2200 t2230 - time
  )

  (:init
    (at presidio)
    (time-is t0900)

    ; Friend locations
    (friend-at alex presidio)
    (friend-at chris presidio)
    (friend-at dana presidio)
    (friend-at eli presidio)
    (friend-at farah presidio)
    (friend-at betty northbeach)

    (is-betty betty)

    ; Meeting windows (non-Betty >=20 min, Betty slot ensures >=75 min within 18:45-22:00)
    (window-slot alex t0915 t1000)
    (window-slot chris t1030 t1200)
    (window-slot dana t1300 t1430)
    (window-slot eli t1500 t1600)
    (window-slot farah t1615 t1715)
    (betty-slot t1845 t2200)

    ; Required 5-minute buffers between consecutive meetings at the same location
    (buffer-slot presidio t1000 t1005)
    (buffer-slot presidio t1200 t1205)
    (buffer-slot presidio t1430 t1435)
    (buffer-slot presidio t1600 t1605)

    ; Waiting slots (idle periods)
    (wait-slot presidio t0900 t0915)
    (wait-slot presidio t1005 t1030)
    (wait-slot presidio t1205 t1300)
    (wait-slot presidio t1435 t1500)
    (wait-slot presidio t1605 t1615)
    (wait-slot northbeach t1733 t1845)
    (wait-slot northbeach t2200 t2230)

    ; Travel slot (Presidio -> North Beach, 18 minutes)
    (travel-slot presidio northbeach t1715 t1733)
  )

  (:goal (and
    ; Meet all friends, with Betty qualifying for >=75 minutes
    (met alex)
    (met chris)
    (met dana)
    (met eli)
    (met farah)
    (met betty)
    (betty-75-met)

    ; Ensure the day advances to end
    (time-is t2230)
  ))
)