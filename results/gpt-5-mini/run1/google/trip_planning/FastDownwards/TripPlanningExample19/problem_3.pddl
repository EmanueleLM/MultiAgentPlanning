(define (problem trip-plan-9days)
  (:domain trip-planning)

  (:objects
    brussels valencia nice - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day

    brussels-slot1 brussels-slot2 - slot
    valencia-slot1 valencia-slot2 valencia-slot3 - slot
    nice-slot1 nice-slot2 nice-slot3 nice-slot4 - slot
  )

  (:init
    ;; all days start unassigned
    (day-unassigned day1) (day-unassigned day2) (day-unassigned day3)
    (day-unassigned day4) (day-unassigned day5) (day-unassigned day6)
    (day-unassigned day7) (day-unassigned day8) (day-unassigned day9)

    ;; first day marker and day order
    (first-day day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)

    ;; slots reflect the audited, adjusted per-city stay counts that sum to 9:
    ;; brussels: 2 days, valencia: 3 days, nice: 4 days (adjusted from requested 6)
    (slot-unused brussels-slot1) (slot-unused brussels-slot2)
    (slot-unused valencia-slot1) (slot-unused valencia-slot2) (slot-unused valencia-slot3)
    (slot-unused nice-slot1) (slot-unused nice-slot2) (slot-unused nice-slot3) (slot-unused nice-slot4)

    (slot-belongs brussels-slot1 brussels)
    (slot-belongs brussels-slot2 brussels)

    (slot-belongs valencia-slot1 valencia)
    (slot-belongs valencia-slot2 valencia)
    (slot-belongs valencia-slot3 valencia)

    (slot-belongs nice-slot1 nice)
    (slot-belongs nice-slot2 nice)
    (slot-belongs nice-slot3 nice)
    (slot-belongs nice-slot4 nice)

    ;; available direct flights (bidirectional where listed)
    (allowed-flight brussels valencia)
    (allowed-flight valencia brussels)
    (allowed-flight brussels nice)
    (allowed-flight nice brussels)

    ;; meeting must occur in Nice between day1 and day6 inclusive
    (meeting-day day1) (meeting-day day2) (meeting-day day3)
    (meeting-day day4) (meeting-day day5) (meeting-day day6)
    (is-meeting-city nice)
  )

  (:goal
    (and
      ;; meeting must be declared (held)
      (meeting-held)

      ;; all days must be assigned
      (not (day-unassigned day1)) (not (day-unassigned day2)) (not (day-unassigned day3))
      (not (day-unassigned day4)) (not (day-unassigned day5)) (not (day-unassigned day6))
      (not (day-unassigned day7)) (not (day-unassigned day8)) (not (day-unassigned day9))

      ;; all required per-city slots must be used (enforces exact per-city durations)
      (not (slot-unused brussels-slot1)) (not (slot-unused brussels-slot2))
      (not (slot-unused valencia-slot1)) (not (slot-unused valencia-slot2)) (not (slot-unused valencia-slot3))
      (not (slot-unused nice-slot1)) (not (slot-unused nice-slot2)) (not (slot-unused nice-slot3)) (not (slot-unused nice-slot4))
    )
  )
)