(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    wayne edward lauren helen michael joseph vincent - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; slot declarations
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Availability facts (30-minute slots within 09:00-17:00)
    ;; wayne: busy 14:30-15:00 (s1430) and 15:30-16:00 (s1530) -> unavailable those slots
    (available wayne s0900) (available wayne s0930) (available wayne s1000)
    (available wayne s1030) (available wayne s1100) (available wayne s1130)
    (available wayne s1200) (available wayne s1230) (available wayne s1300)
    (available wayne s1330) (available wayne s1400) (available wayne s1500)
    (available wayne s1600) (available wayne s1630)

    ;; edward: free entire work day
    (available edward s0900) (available edward s0930) (available edward s1000)
    (available edward s1030) (available edward s1100) (available edward s1130)
    (available edward s1200) (available edward s1230) (available edward s1300)
    (available edward s1330) (available edward s1400) (available edward s1430)
    (available edward s1500) (available edward s1530) (available edward s1600)
    (available edward s1630)

    ;; lauren: free entire work day
    (available lauren s0900) (available lauren s0930) (available lauren s1000)
    (available lauren s1030) (available lauren s1100) (available lauren s1130)
    (available lauren s1200) (available lauren s1230) (available lauren s1300)
    (available lauren s1330) (available lauren s1400) (available lauren s1430)
    (available lauren s1500) (available lauren s1530) (available lauren s1600)
    (available lauren s1630)

    ;; helen: free entire work day
    (available helen s0900) (available helen s0930) (available helen s1000)
    (available helen s1030) (available helen s1100) (available helen s1130)
    (available helen s1200) (available helen s1230) (available helen s1300)
    (available helen s1330) (available helen s1400) (available helen s1430)
    (available helen s1500) (available helen s1530) (available helen s1600)
    (available helen s1630)

    ;; michael: busy 09:00-10:00 (s0900,s0930), 10:30-11:30 (s1030,s1100),
    ;; 12:00-13:00 (s1200,s1230), 13:30-14:30 (s1330,s1400), 16:00-17:00 (s1600,s1630)
    ;; therefore available: s1000, s1130, s1300, s1430, s1500, s1530
    (available michael s1000) (available michael s1130) (available michael s1300)
    (available michael s1430) (available michael s1500) (available michael s1530)

    ;; joseph: busy 09:00-12:00 (s0900,s0930,s1000,s1030,s1100,s1130),
    ;; 14:00-14:30 (s1400), 15:30-16:00 (s1530)
    ;; therefore available: s1200,s1230,s1300,s1330,s1430,s1500,s1600,s1630
    (available joseph s1200) (available joseph s1230) (available joseph s1300)
    (available joseph s1330) (available joseph s1430) (available joseph s1500)
    (available joseph s1600) (available joseph s1630)

    ;; vincent: busy 09:00-10:30 (s0900,s0930,s1000), 11:30-13:00 (s1130,s1200,s1230),
    ;; 13:30-14:00 (s1330), 14:30-17:00 (s1430,s1500,s1530,s1600,s1630)
    ;; therefore available: s1030, s1100, s1300, s1400
    (available vincent s1030) (available vincent s1100) (available vincent s1300)
    (available vincent s1400)

    ;; Earliest-feasible constraint (converted preference -> hard constraint).
    ;; The earliest 30-minute slot where all participants are available is 13:00-13:30 -> s1300
    (earliest s1300)
  )

  (:goal (scheduled s1300))
)