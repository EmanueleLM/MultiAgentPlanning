(define (problem city-trip-problem)
  (:domain city-trip)
  (:objects
    DBV FRA KRK - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ; successor day links (explicit contiguity)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ; Allowed direct transitions (includes stays). Only these may be used.
    ; From FRA: FRA->FRA, FRA->KRK, FRA->DBV
    (can-transition FRA FRA)
    (can-transition FRA KRK)
    (can-transition FRA DBV)

    ; From KRK: KRK->KRK, KRK->FRA
    (can-transition KRK KRK)
    (can-transition KRK FRA)

    ; From DBV: DBV->DBV, DBV->FRA
    (can-transition DBV DBV)
    (can-transition DBV FRA)

    ; Mark which days are permitted for KRK assignments (enforces KRK exactly on day9 and day10)
    (krk-day day9)
    (krk-day day10)

    ; Starting assignment: day1 = DBV (feasible start city chosen)
    (at DBV day1)
    (occupied day1)
  )

  ; Hard goals: total days 1..10 must be assigned; enforce day8=FRA and day9/day10=KRK;
  ; also ensure visit of all three cities at least once by fixing DBV day1 and FRA day8 as part of goal
  (:goal
    (and
      ; every day must be assigned (one city per day enforced by occupied facts)
      (occupied day1)
      (occupied day2)
      (occupied day3)
      (occupied day4)
      (occupied day5)
      (occupied day6)
      (occupied day7)
      (occupied day8)
      (occupied day9)
      (occupied day10)

      ; Mandatory city placements (hard constraints)
      (at FRA day8)   ; deduced/required to reach KRK on day9 given network (enforced as hard)
      (at KRK day9)   ; wedding day 1 (hard)
      (at KRK day10)  ; wedding day 2 (hard)

      ; Ensure Dubrovnik is visited at least once (satisfied by initial day1=DBV)
      (at DBV day1)
    )
  )
)