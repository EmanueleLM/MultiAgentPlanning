(define (problem alamo-schedule-A)
  (:domain alamo-scheduling)

  ; Objects specific to this instance
  (:objects
    traveler - agent
    matthew - friend

    alamo-square sunset-district - location

    ; Discrete timepoints used in this instance (all times are local minute-aligned timepoints).
    t0900 t1314 t1330 t1345 - time
  )

  ; Initial state
  (:init
    ; Traveler arrives at Alamo Square at 09:00
    (at traveler alamo-square)
    (time-now t0900)

    ; Matthew's declared location and availability window:
    (friend-loc matthew sunset-district)

    ; Travel durations encoded as explicit allowed travel slots:
    ; Alamo Square -> Sunset District: 16 minutes (depart 13:14 -> arrive 13:30)
    (travel-slot alamo-square sunset-district t1314 t1330)
    ; Sunset District -> Alamo Square: 17 minutes (if needed, depart 13:45 -> arrive 14:02)
    ; Note: we do not need a return slot to reach the goal; included only if a return is desired.
    (travel-slot sunset-district alamo-square t1345 t1402)

    ; Matthew's meeting slots must fall inside his availability window (1:30PM to 2:30PM).
    ; Minimum required meeting duration is 15 minutes. We provide one feasible slot:
    ; 13:30 -> 13:45 (t1330 to t1345), which is 15 minutes and within Matthew's 13:30-14:30 presence.
    (slot-meeting matthew t1330 t1345)
  )

  ; Goal:
  ; - Meet Matthew (for at least 15 minutes within his availability).
  ; Optionally we also require the global clock to reflect the meeting end (t1345) to ensure temporal consistency.
  (:goal (and
    (met matthew)
    (time-now t1345)
    (at traveler sunset-district)
  ))
)