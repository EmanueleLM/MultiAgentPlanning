(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)
  (:objects
    michelle steven jerry - agent

    ;; 60-minute meeting start times (half-hour granularity), last allowed start is 16:00 -> ends 17:00
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    ;; Michelle: busy 11:00-12:00 -> slots that overlap that period are unavailable:
    ;; unavailable for michelle: s1030 (10:30-11:30), s1100 (11:00-12:00), s1130 (11:30-12:30)
    ;; Therefore available are all other defined slots:
    (available michelle s0900)
    (available michelle s0930)
    (available michelle s1000)
    (available michelle s1200)
    (available michelle s1230)
    (available michelle s1300)
    (available michelle s1330)
    (available michelle s1400)
    (available michelle s1430)
    (available michelle s1500)
    (available michelle s1530)
    (available michelle s1600)

    ;; Steven: busy at 9:00-9:30, 11:30-12:00, 13:30-14:00, 15:30-16:00
    ;; That makes these 60-min starts unavailable: s0900, s1100, s1130, s1300, s1330, s1500, s1530
    ;; Available are the rest:
    (available steven s0930)
    (available steven s1000)
    (available steven s1030)
    (available steven s1200)
    (available steven s1230)
    (available steven s1400)
    (available steven s1430)
    (available steven s1600)

    ;; Jerry: busy at 9:00-9:30, 10:00-11:00, 11:30-12:30, 13:00-14:30, 15:30-16:00, 16:30-17:00
    ;; After analyzing overlaps, the only full 60-minute slot (from our enumerated starts) that is free is s1430 (14:30-15:30)
    (available jerry s1430)

    ;; Note: The public constraints (work hours 9:00-17:00 and meeting duration 60 min) were used to define allowed slot objects.
  )

  ;; Goal: schedule a one-hour meeting (meeting predicate) at a slot that all three agree on.
  ;; From the combined availabilities there exists at least one slot; explicit goal set for the common free slot discovered.
  (:goal (meeting s1430))
)