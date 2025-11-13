(define (problem meeting_sf_instance)
  (:domain meeting_sf)
  (:objects
    traveler - person
    russian_hill golden_gate_park - location
    t0900 t1239 t1300 t1430 t1445 t1500 t1515 t1530 t1545 t1600 t1615 t1630 t1645 t1700 t1715 t1730 t1745 t1800 t1815 t1834 - time
  )
  (:init
    (at traveler russian_hill)
    (time-is t0900)
    (meeting-location golden_gate_park)

    ; ordered time progression
    (succ t0900 t1239)
    (succ t1239 t1300)
    (succ t1300 t1430)
    (succ t1430 t1445)
    (succ t1445 t1500)
    (succ t1500 t1515)
    (succ t1515 t1530)
    (succ t1530 t1545)
    (succ t1545 t1600)
    (succ t1600 t1615)
    (succ t1615 t1630)
    (succ t1630 t1645)
    (succ t1645 t1700)
    (succ t1700 t1715)
    (succ t1715 t1730)
    (succ t1730 t1745)
    (succ t1745 t1800)
    (succ t1800 t1815)
    (succ t1815 t1834)

    ; permitted waits
    (can-wait t0900 t1239)

    ; direction-aware travel windows (durations encoded by endpoints)
    (can-travel t1239 t1300 russian_hill golden_gate_park)
    (can-travel t1815 t1834 golden_gate_park russian_hill)

    ; John's availability across the entire meeting window
    (john-available t1300)
    (john-available t1430)
    (john-available t1445)
    (john-available t1500)
    (john-available t1515)
    (john-available t1530)
    (john-available t1545)
    (john-available t1600)
    (john-available t1615)
    (john-available t1630)
    (john-available t1645)
    (john-available t1700)
    (john-available t1715)
    (john-available t1730)
    (john-available t1745)
    (john-available t1800)
    (john-available t1815)

    ; enforce minimum contiguous 90-minute start block
    (is-meeting-span-90 t1300 t1430)
  )
  (:goal
    (and
      (met-john)
      (time-is t1815)
      (at traveler golden_gate_park)
    )
  )
)