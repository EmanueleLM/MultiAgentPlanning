(define (problem meeting-itinerary-problem)
  (:domain meeting-itinerary)

  (:objects
    presidio northbeach - location
    alice carlos farah eli dana grace betty - friend

    ;; timepoints used by planned/feasible actions (only those needed)
    s0 s30 s90 s105 s240 s255 s492 s510 s540 s585 s660 s690 s750 - timeslot

    ;; durations used for the concrete offsets between those timepoints
    dur15 dur18 dur30 dur45 dur60 dur75 dur135 dur237 - duration
  )

  (:init
    ;; start location/time
    (at presidio)
    (time-at s0)

    ;; friend locations
    (located alice presidio)
    (located carlos presidio)
    (located farah presidio)
    (located eli northbeach)
    (located dana northbeach)
    (located grace northbeach)
    (located betty northbeach)

    ;; mark Betty for the special constraint
    (is-betty betty)

    ;; next relations encoding only the concrete intervals the domain/actions will use
    ;; s0 (09:00) + 30min -> s30 (09:30)
    (next s0 dur30 s30)
    ;; s30 + 60min -> s90 (09:30 -> 10:30 idle)
    (next s30 dur60 s90)
    ;; s90 + 15min -> s105 (10:30 -> 10:45)
    (next s90 dur15 s105)
    ;; s105 + 135min -> s240 (10:45 -> 13:00 idle)
    (next s105 dur135 s240)
    ;; s240 + 15min -> s255 (13:00 -> 13:15)
    (next s240 dur15 s255)
    ;; s255 + 237min -> s492 (13:15 -> 17:12 idle until travel depart)
    (next s255 dur237 s492)
    ;; travel Presidio -> NorthBeach: s492 + 18min -> s510 (17:12 -> 17:30)
    (next s492 dur18 s510)
    ;; Eli meeting: s510 + 30min -> s540 (17:30 -> 18:00)
    (next s510 dur30 s540)
    ;; Dana meeting: s540 + 45min -> s585 (18:00 -> 18:45)
    (next s540 dur45 s585)
    ;; Betty required meeting: s585 + 75min -> s660 (18:45 -> 20:00)
    (next s585 dur75 s660)
    ;; wait after Betty: s660 + 30min -> s690 (20:00 -> 20:30)
    (next s660 dur30 s690)
    ;; Grace meeting: s690 + 60min -> s750 (20:30 -> 21:30)
    (next s690 dur60 s750)

    ;; availability encoded at the level of contiguous meeting intervals (one atom per feasible meeting interval)
    ;; Each available-for indicates the friend can be met for that entire contiguous [start,end) interval.
    ;; These reflect the publicly given availability windows and the scheduled meeting intervals used by the domain's actions.

    ;; Alice 09:00-11:00 -> allow meeting 09:00-09:30 (s0..s30)
    (available-for alice s0 s30)

    ;; Carlos 10:30-12:00 -> allow meeting 10:30-10:45 (s90..s105)
    (available-for carlos s90 s105)

    ;; Farah 13:00-14:00 -> allow meeting 13:00-13:15 (s240..s255)
    (available-for farah s240 s255)

    ;; Eli 17:30-18:30 -> allow meeting 17:30-18:00 (s510..s540)
    (available-for eli s510 s540)

    ;; Dana 18:00-19:30 -> allow meeting 18:00-18:45 (s540..s585)
    (available-for dana s540 s585)

    ;; Betty 18:45-22:00 -> required contiguous 75-minute meeting 18:45-20:00 (s585..s660)
    (available-for betty s585 s660)

    ;; Grace 20:30-21:30 -> allow meeting 20:30-21:30 (s690..s750)
    (available-for grace s690 s750)
  )

  ;; Hard goal: meet all friends and ensure the Betty 75-minute meeting flag is set
  (:goal (and
    (met alice)
    (met carlos)
    (met farah)
    (met eli)
    (met dana)
    (met grace)
    (met betty)
    (satisfied-betty)
  ))
)