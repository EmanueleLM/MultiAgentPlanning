(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    roy kathryn amy - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; Roy's availability (busy: 09:00-09:30 s0900, 10:00-10:30 s1000, 11:00-11:30 s1100, 12:30-13:00 s1230)
    (available roy s0930)
    (available roy s1030)
    (available roy s1130)
    (available roy s1200)
    (available roy s1300)
    (available roy s1330)
    (available roy s1400)
    (available roy s1430)
    (available roy s1500)
    (available roy s1530)
    (available roy s1600)
    (available roy s1630)

    ;; Kathryn's availability (busy: 09:30-10:00 s0930, 16:30-17:00 s1630)
    (available kathryn s0900)
    (available kathryn s1000)
    (available kathryn s1030)
    (available kathryn s1100)
    (available kathryn s1130)
    (available kathryn s1200)
    (available kathryn s1230)
    (available kathryn s1300)
    (available kathryn s1330)
    (available kathryn s1400)
    (available kathryn s1430)
    (available kathryn s1500)
    (available kathryn s1530)
    (available kathryn s1600)

    ;; Amy's availability and preference treated as hard constraint:
    ;; Busy 09:00-14:30 -> blocks s0900..s1400
    ;; Busy 15:00-16:00 -> blocks s1500 and s1530
    ;; Busy 16:30-17:00 -> blocks s1630
    ;; Preference "would rather not meet after 15:30" encoded as hard constraint -> disallow slots starting after 15:30 (s1530,s1600,s1630)
    ;; The only slot allowed by these hard constraints is 14:30-15:00 (s1430)
    (available amy s1430)
  )
  (:goal (and (meeting-scheduled)))
)