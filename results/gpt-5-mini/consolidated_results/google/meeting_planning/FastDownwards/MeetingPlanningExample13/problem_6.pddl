(define (problem meeting-itinerary-problem)
  (:domain meeting-itinerary)

  (:objects
    ; locations
    presidio northbeach - location

    ; friends
    alice carlos farah eli dana grace betty - friend

    ; timeslots (discrete ordered timepoints used by next relations)
    s0 s30 s90 s105 s240 s255 s492 s510 s540 s585 s660 s690 s750 - timeslot

    ; durations corresponding to concrete minute offsets
    dur15 dur18 dur30 dur45 dur60 dur75 dur135 dur237 - duration
  )

  (:init
    ;; start location and time (09:00 at presidio)
    (at presidio)
    (time-at s0)

    ;; mark North Beach location for domain checks
    (is-northbeach northbeach)

    ;; friend locations
    (located alice presidio)
    (located carlos presidio)
    (located farah presidio)
    (located eli northbeach)
    (located dana northbeach)
    (located grace northbeach)
    (located betty northbeach)

    ;; identify Betty
    (is-betty betty)

    ;; successor (next) relations encoding contiguous intervals used by actions
    ;; s0 (09:00) + 30 -> s30 (09:30)
    (next s0 dur30 s30)
    ;; s30 + 60 -> s90 (09:30 -> 10:30)
    (next s30 dur60 s90)
    ;; s90 + 15 -> s105 (10:30 -> 10:45)
    (next s90 dur15 s105)
    ;; s105 + 135 -> s240 (10:45 -> 13:00)
    (next s105 dur135 s240)
    ;; s240 + 15 -> s255 (13:00 -> 13:15)
    (next s240 dur15 s255)
    ;; s255 + 237 -> s492 (13:15 -> 17:12)
    (next s255 dur237 s492)
    ;; s492 + 18 -> s510 (17:12 -> 17:30)  Presidio->NorthBeach travel duration 18
    (next s492 dur18 s510)
    ;; s510 + 30 -> s540 (17:30 -> 18:00)
    (next s510 dur30 s540)
    ;; s540 + 45 -> s585 (18:00 -> 18:45)
    (next s540 dur45 s585)
    ;; s585 + 75 -> s660 (18:45 -> 20:00)  Betty required contiguous 75-minute meeting
    (next s585 dur75 s660)
    ;; s660 + 30 -> s690 (20:00 -> 20:30)
    (next s660 dur30 s690)
    ;; s690 + 60 -> s750 (20:30 -> 21:30)
    (next s690 dur60 s750)

    ;; availability atoms encode contiguous meeting intervals that respect friends' public windows.
    ;; Each available-for corresponds exactly to a contiguous [start,end) atom the planner can use.

    ;; Alice available 09:00-11:00 -> allow meeting 09:00-09:30 (s0..s30)
    (available-for alice s0 s30)

    ;; Carlos available 10:30-12:00 -> allow meeting 10:30-10:45 (s90..s105)
    (available-for carlos s90 s105)

    ;; Farah available 13:00-14:00 -> allow meeting 13:00-13:15 (s240..s255)
    (available-for farah s240 s255)

    ;; Eli available 17:30-18:30 -> allow meeting 17:30-18:00 (s510..s540)
    (available-for eli s510 s540)

    ;; Dana available 18:00-19:30 -> allow meeting 18:00-18:45 (s540..s585)
    (available-for dana s540 s585)

    ;; Betty available 18:45-22:00 -> required contiguous 75-minute meeting 18:45-20:00 (s585..s660)
    (available-for betty s585 s660)

    ;; Grace available 20:30-21:30 -> allow meeting 20:30-21:30 (s690..s750)
    (available-for grace s690 s750)
  )

  ;; Hard goal: meet all listed friends and satisfy the Betty meeting requirement exactly as encoded.
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