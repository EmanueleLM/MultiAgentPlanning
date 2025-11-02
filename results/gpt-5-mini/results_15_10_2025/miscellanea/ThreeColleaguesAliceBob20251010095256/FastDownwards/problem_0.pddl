(define (problem schedule-2025-10-21)
  (:domain meeting-scheduling)

  ;; agents and 30-minute slots (09:00..16:30)
  (:objects
    alice bob carol - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Alice availability: 09:00-11:00 and 13:00-16:00
    (available alice s0900)
    (available alice s0930)
    (available alice s1000)
    (available alice s1030)
    (available alice s1300)
    (available alice s1330)
    (available alice s1400)
    (available alice s1430)
    (available alice s1500)
    (available alice s1530)

    ;; Bob availability: 10:30-12:00 and 14:00-15:30
    (available bob s1030)
    (available bob s1100)
    (available bob s1130)
    (available bob s1400)
    (available bob s1430)
    (available bob s1500)

    ;; Carol availability: 09:30-10:30, 11:00-12:30, 15:00-17:00
    (available carol s0930)
    (available carol s1000)
    (available carol s1100)
    (available carol s1130)
    (available carol s1200)
    (available carol s1500)
    (available carol s1530)
    (available carol s1600)
    (available carol s1630)

    ;; Encoded Bob morning preference as a hard temporal constraint:
    ;; mark morning slots that should be avoided when possible (10:30-12:00)
    (bob-morning s1030)
    (bob-morning s1100)
    (bob-morning s1130)
  )

  ;; Goal: a single 30-minute meeting scheduled (one slot)
  (:goal (scheduled))
)