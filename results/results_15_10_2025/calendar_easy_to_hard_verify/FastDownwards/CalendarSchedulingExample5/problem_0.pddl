(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  ;; Objects: 30-minute slot start times between 09:00 and 17:00 (inclusive start at 16:30 -> ends 17:00)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    kathryn charlotte lauren - person
  )

  (:init
    ;; slot declarations
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130)
    (slot s1200) (slot s1230) (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; person declarations
    (person kathryn) (person charlotte) (person lauren)

    ;; Allowed meeting start slots (Charlotte's hard preference: meeting must not start after 13:30)
    ;; Allowed starts = 09:00 .. 13:30 inclusive
    (allowed-start s0900) (allowed-start s0930) (allowed-start s1000) (allowed-start s1030)
    (allowed-start s1100) (allowed-start s1130) (allowed-start s1200) (allowed-start s1230)
    (allowed-start s1300) (allowed-start s1330)

    ;; Free slots derived from participants' blocked intervals (all busy intervals interpreted as unavailable).
    ;; Kathryn blocked: 09:00, 10:30, 11:30, 13:30-14:30 (13:30 & 14:00), 16:30
    ;; => Kathryn free at: 09:30,10:00,11:00,12:00,12:30,13:00,14:30,15:00,15:30,16:00
    (free kathryn s0930) (free kathryn s1000) (free kathryn s1100) (free kathryn s1200)
    (free kathryn s1230) (free kathryn s1300) (free kathryn s1430) (free kathryn s1500)
    (free kathryn s1530) (free kathryn s1600)

    ;; Charlotte blocked: 12:00, 16:00; preference (hard) no starts after 13:30
    ;; => Charlotte free at allowed starts (09:00..13:30) except 12:00
    (free charlotte s0900) (free charlotte s0930) (free charlotte s1000) (free charlotte s1030)
    (free charlotte s1100) (free charlotte s1130) (free charlotte s1230) (free charlotte s1300)
    (free charlotte s1330)

    ;; Lauren blocked: 09:00-10:00 (09:00 & 09:30), 12:00, 13:30-14:30 (13:30 & 14:00), 15:00-16:00 (15:00 & 15:30), 16:30
    ;; => Lauren free at: 10:00,10:30,11:00,11:30,12:30,13:00,14:30,16:00
    (free lauren s1000) (free lauren s1030) (free lauren s1100) (free lauren s1130)
    (free lauren s1230) (free lauren s1300) (free lauren s1430) (free lauren s1600)
  )

  ;; Goal: find a single valid 30-minute meeting start time satisfying all constraints.
  (:goal (scheduled))
)