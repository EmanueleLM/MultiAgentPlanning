(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)
  (:objects
    kathryn charlotte lauren - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; initialize total-cost
    (= (total-cost) 0)

    ;; Kathryn's available 30-min start slots (blocked: 09:00,10:30,11:30,13:30-14:30,16:30)
    (available kathryn s0930)
    (available kathryn s1000)
    (available kathryn s1100)
    (available kathryn s1200)
    (available kathryn s1230)
    (available kathryn s1300)
    (available kathryn s1430)
    (available kathryn s1500)
    (available kathryn s1530)
    (available kathryn s1600)

    ;; Charlotte's available slots (blocked: 12:00,16:00 ; preference/hard constraint: no starts after 13:30)
    ;; => only include starts at or before 13:30, and exclude 12:00
    (available charlotte s0900)
    (available charlotte s0930)
    (available charlotte s1000)
    (available charlotte s1030)
    (available charlotte s1100)
    (available charlotte s1130)
    (available charlotte s1230)
    (available charlotte s1300)
    (available charlotte s1330)

    ;; Lauren's available slots (blocked: 09:00-10:00,12:00,13:30-14:30,15:00-16:00,16:30-17:00)
    (available lauren s1000)
    (available lauren s1030)
    (available lauren s1100)
    (available lauren s1130)
    (available lauren s1230)
    (available lauren s1300)
    (available lauren s1430)
    (available lauren s1600)
  )

  ;; Goal: schedule one 30-minute meeting start that satisfies all hard constraints.
  (:goal (and (meeting-scheduled)))

  ;; Prefer the earliest feasible start by minimizing total-cost (earlier starts have lower cost).
  (:metric minimize (total-cost))
)