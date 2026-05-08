(define (problem alamo-schedule-A)
  (:domain alamo-scheduling)

  ;; Objects specific to this instance
  (:objects
    traveler - agent
    matthew - friend

    alamo-square sunset-district - location

    ;; Discrete timepoints (minute-aligned symbolic time objects)
    t0900 t1314 t1330 t1345 - time
  )

  ;; Initial state
  (:init
    ;; Traveler arrives at Alamo Square at 09:00
    (at traveler alamo-square)
    (time-now t0900)

    ;; Temporal ordering of relevant timepoints
    (next-time t0900 t1314)
    (next-time t1314 t1330)
    (next-time t1330 t1345)

    ;; Matthew's declared location and availability:
    (friend-loc matthew sunset-district)

    ;; Travel durations encoded as explicit allowed travel slots:
    ;; Alamo Square -> Sunset District: 16 minutes (depart 13:14 -> arrive 13:30)
    (travel-slot alamo-square sunset-district t1314 t1330)

    ;; Meeting slot: 13:30 -> 13:45 (15 minutes), within Matthew's 13:30-14:30 presence.
    (slot-meeting matthew t1330 t1345)
  )

  ;; Goal: meet Matthew and end at the meeting end time at his location.
  (:goal (and
    (met matthew)
    (time-now t1345)
    (at traveler sunset-district)
  ))
)