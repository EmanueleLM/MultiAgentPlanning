(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    stephen elijah william jeremy timothy - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; initial total cost
    (= (total-cost) 0)

    ;; Busy intervals (interpreted as unavailable slots)
    ;; Stephen: free entire day -> no busy facts

    ;; Elijah busy: 09:00-09:30, 12:30-13:00, 14:30-15:00, 16:00-16:30
    (busy elijah s0900)
    (busy elijah s1230)
    (busy elijah s1430)
    (busy elijah s1600)

    ;; William busy: 09:30-10:00, 15:30-16:00
    (busy william s0930)
    (busy william s1530)

    ;; Jeremy busy: 09:00-09:30, 10:00-12:00, 13:00-15:00, 15:30-17:00
    ;; 10:00-12:00 covers s1000, s1030, s1100, s1130
    ;; 13:00-15:00 covers s1300, s1330, s1400, s1430
    ;; 15:30-17:00 covers s1530, s1600, s1630
    (busy jeremy s0900)
    (busy jeremy s1000)
    (busy jeremy s1030)
    (busy jeremy s1100)
    (busy jeremy s1130)
    (busy jeremy s1300)
    (busy jeremy s1330)
    (busy jeremy s1400)
    (busy jeremy s1430)
    (busy jeremy s1530)
    (busy jeremy s1600)
    (busy jeremy s1630)

    ;; Timothy busy: 10:00-10:30, 11:30-14:30, 15:30-16:00
    ;; 11:30-14:30 covers s1130, s1200, s1230, s1300, s1330, s1400
    (busy timothy s1000)
    (busy timothy s1130)
    (busy timothy s1200)
    (busy timothy s1230)
    (busy timothy s1300)
    (busy timothy s1330)
    (busy timothy s1400)
    (busy timothy s1530)
  )

  ;; Goal: have one scheduled meeting (the planner will minimize total-cost
  ;; to prefer the earliest feasible slot)
  (:goal (meeting-scheduled))

  ;; Prefer actions that produce the earliest feasible slot by minimizing total-cost
  (:metric minimize (total-cost))
)