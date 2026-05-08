(define (problem trip-plan-9days)
  (:domain trip-planning)

  (:objects
    ; cities
    brussels valencia nice - city

    ; days (9 calendar days indexed)
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day

    ; slots enforcing per-city desired stay counts (these are the strict preferences encoded as hard constraints)
    brussels-slot1 brussels-slot2 - slot
    valencia-slot1 valencia-slot2 valencia-slot3 - slot
    nice-slot1 nice-slot2 nice-slot3 nice-slot4 nice-slot5 nice-slot6 - slot
  )

  (:init
    ; initially all days are unassigned
    (day-unassigned day1) (day-unassigned day2) (day-unassigned day3)
    (day-unassigned day4) (day-unassigned day5) (day-unassigned day6)
    (day-unassigned day7) (day-unassigned day8) (day-unassigned day9)

    ; first day pointer
    (first-day day1)

    ; successor (ordering of days)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)

    ; all slots initially unused
    (slot-unused brussels-slot1) (slot-unused brussels-slot2)
    (slot-unused valencia-slot1) (slot-unused valencia-slot2) (slot-unused valencia-slot3)
    (slot-unused nice-slot1) (slot-unused nice-slot2) (slot-unused nice-slot3)
    (slot-unused nice-slot4) (slot-unused nice-slot5) (slot-unused nice-slot6)

    ; map slots to the city they belong to (these encode the traveler's desired per-city stays)
    (slot-belongs brussels-slot1 brussels)
    (slot-belongs brussels-slot2 brussels)

    (slot-belongs valencia-slot1 valencia)
    (slot-belongs valencia-slot2 valencia)
    (slot-belongs valencia-slot3 valencia)

    (slot-belongs nice-slot1 nice)
    (slot-belongs nice-slot2 nice)
    (slot-belongs nice-slot3 nice)
    (slot-belongs nice-slot4 nice)
    (slot-belongs nice-slot5 nice)
    (slot-belongs nice-slot6 nice)

    ; flight connectivity: only direct flights allowed (hub model)
    (allowed-flight brussels valencia)
    (allowed-flight valencia brussels)
    (allowed-flight brussels nice)
    (allowed-flight nice brussels)
    ; Note: there is NO allowed-flight valencia nice or nice valencia

    ; meeting is required in Nice on a day between day1 and day6 (inclusive)
    (meeting-day day1) (meeting-day day2) (meeting-day day3)
    (meeting-day day4) (meeting-day day5) (meeting-day day6)

    ; meeting-held is false initially (no predicate)
  )

  (:goal
    (and
      ; meeting must be held (an eligible day in Nice must be assigned and declare-meeting applied)
      (meeting-held)

      ; every day must be assigned to some city (no unassigned day remains)
      (not (day-unassigned day1)) (not (day-unassigned day2)) (not (day-unassigned day3))
      (not (day-unassigned day4)) (not (day-unassigned day5)) (not (day-unassigned day6))
      (not (day-unassigned day7)) (not (day-unassigned day8)) (not (day-unassigned day9))

      ; every desired per-city slot must be consumed (these are strict preferences encoded as hard constraints)
      ; NOTE: the sum of desired slots is 11 while the trip has only 9 days. This makes the planning problem infeasible:
      ; the solver will prove there is no plan that can fill all slots given only 9 days.
      (not (slot-unused brussels-slot1)) (not (slot-unused brussels-slot2))
      (not (slot-unused valencia-slot1)) (not (slot-unused valencia-slot2)) (not (slot-unused valencia-slot3))
      (not (slot-unused nice-slot1)) (not (slot-unused nice-slot2)) (not (slot-unused nice-slot3))
      (not (slot-unused nice-slot4)) (not (slot-unused nice-slot5)) (not (slot-unused nice-slot6))
    )
  )
)