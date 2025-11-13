(define (problem sf-day-schedule-prob)
  (:domain sf-day-schedule)

  (:objects
    presidio northbeach - location
    alex chris dana eli farah betty - friend
    t0900 t0915 t1000 t1005 t1030 t1200 t1205 t1300 t1430 t1435 t1500 t1600 t1605 t1615 t1715 t1733 t1845 t2200 t2230 - time
  )

  (:init
    ; Start state
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

    ; Meeting windows used (all satisfy >=20 min for non-Betty, and Betty >=75 within her window)
    (window-slot alex t0915 t1000)
    (window-slot chris t1030 t1200)
    (window-slot dana t1300 t1430)
    (window-slot eli t1500 t1600)
    (window-slot farah t1615 t1715)
    (betty-slot t1845 t2200)

    ; Required 5-minute buffers between consecutive meetings at same location
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

    ; Travel slot (inter-location, no extra buffer required)
    (travel-slot presidio northbeach t1715 t1733)
  )

  (:goal (and
    ; Maximize distinct friends met by requiring all of them (6)
    (met alex)
    (met chris)
    (met dana)
    (met eli)
    (met farah)
    (betty-75-met)

    ; End-of-day time reached
    (time-is t2230)
  ))
)