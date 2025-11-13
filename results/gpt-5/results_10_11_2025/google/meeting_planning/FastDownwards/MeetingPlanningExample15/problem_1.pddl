(define (problem meeting_sf_instance)
  (:domain meeting_sf)
  (:objects
    traveler - person
    russian_hill golden_gate_park - location
    t0900 t1239 t1300 t1430 t1815 t1834 - time
  )
  (:init
    ; initial position and time
    (at traveler russian_hill)
    (time-is t0900)

    ; John's availability within the window 13:00–18:15
    (john-available-time t1300)
    (john-available-time t1430)
    (john-available-time t1815)

    ; allowed time transitions encoding durations
    (edge-wait t0900 t1239)                                    ; wait at Russian Hill from 09:00 to 12:39
    (edge-travel t1239 t1300 russian_hill golden_gate_park)    ; 21 minutes RH -> GGP
    (meeting-span-min90 t1300 t1430)                           ; 90-minute meeting span
    (meeting-span-extend t1430 t1815)                          ; extend meeting to end of window
    (edge-travel t1815 t1834 golden_gate_park russian_hill)    ; 19 minutes GGP -> RH
  )
  (:goal
    (met-john)
  )
)