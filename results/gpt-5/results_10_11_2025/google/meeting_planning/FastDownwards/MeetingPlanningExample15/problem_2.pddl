(define (problem meeting_sf_instance)
  (:domain meeting_sf)
  (:objects
    traveler - person
    russian_hill golden_gate_park - location
    t0900 t1239 t1300 t1430 t1815 t1834 - time
  )
  (:init
    (at traveler russian_hill)
    (time-is t0900)

    ; ordered day timeline
    (succ t0900 t1239)
    (succ t1239 t1300)
    (succ t1300 t1430)
    (succ t1430 t1815)
    (succ t1815 t1834)

    ; waiting allowed on timeline segments
    (can-wait t0900 t1239)
    (can-wait t1239 t1300)
    (can-wait t1300 t1430)
    (can-wait t1430 t1815)
    (can-wait t1815 t1834)

    ; direction-aware travel segments with encoded durations
    (can-travel t1239 t1300 russian_hill golden_gate_park)  ; 21 minutes RH -> GGP
    (can-travel t1815 t1834 golden_gate_park russian_hill)  ; 19 minutes GGP -> RH

    ; John's availability window (13:00 to 18:15)
    (john-available t1300)
    (john-available t1430)
    (john-available t1815)

    ; meeting span marking a 90-minute contiguous block
    (is-meeting-span-90 t1300 t1430)
  )
  (:goal
    (met-john)
  )
)