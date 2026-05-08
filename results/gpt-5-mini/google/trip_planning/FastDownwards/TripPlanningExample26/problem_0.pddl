(define (problem trip-16days)
  (:domain trip-planning)

  (:objects
    traveler - person

    Porto Berlin Reykjavik - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    ; slots: Porto 7, Berlin 6, Reykjavik 5
    p-slot1 p-slot2 p-slot3 p-slot4 p-slot5 p-slot6 p-slot7 -
      slot
    b-slot1 b-slot2 b-slot3 b-slot4 b-slot5 b-slot6 -
      slot
    r-slot1 r-slot2 r-slot3 r-slot4 r-slot5 -
      slot
  )

  (:init
    ; linear day order
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    ; flights (only allowed where flight facts exist)
    ; Direct flights included as explicit facts. Planner may only fly when a flight fact exists.
    (flight Porto Berlin)
    (flight Berlin Porto)
    (flight Berlin Reykjavik)
    (flight Reykjavik Berlin)
    (flight Porto Reykjavik)
    (flight Reykjavik Porto)

    ; initial occupancy: day1 already assigned (start in Porto on day1)
    (at traveler Porto day1)
    (day-occupied day1)

    ; mark eligible meeting days (day12..day16 inclusive)
    (eligible-meet-day day12)
    (eligible-meet-day day13)
    (eligible-meet-day day14)
    (eligible-meet-day day15)
    (eligible-meet-day day16)

    ; slot ownership facts (static)
    (slot-belongs p-slot1 Porto) (slot-belongs p-slot2 Porto) (slot-belongs p-slot3 Porto)
    (slot-belongs p-slot4 Porto) (slot-belongs p-slot5 Porto) (slot-belongs p-slot6 Porto)
    (slot-belongs p-slot7 Porto)

    (slot-belongs b-slot1 Berlin) (slot-belongs b-slot2 Berlin) (slot-belongs b-slot3 Berlin)
    (slot-belongs b-slot4 Berlin) (slot-belongs b-slot5 Berlin) (slot-belongs b-slot6 Berlin)

    (slot-belongs r-slot1 Reykjavik) (slot-belongs r-slot2 Reykjavik) (slot-belongs r-slot3 Reykjavik)
    (slot-belongs r-slot4 Reykjavik) (slot-belongs r-slot5 Reykjavik)

    ; all slots start available (must all become used to meet the strict city-day totals)
    (slot-available p-slot1 Porto) (slot-available p-slot2 Porto) (slot-available p-slot3 Porto)
    (slot-available p-slot4 Porto) (slot-available p-slot5 Porto) (slot-available p-slot6 Porto)
    (slot-available p-slot7 Porto)

    (slot-available b-slot1 Berlin) (slot-available b-slot2 Berlin) (slot-available b-slot3 Berlin)
    (slot-available b-slot4 Berlin) (slot-available b-slot5 Berlin) (slot-available b-slot6 Berlin)

    (slot-available r-slot1 Reykjavik) (slot-available r-slot2 Reykjavik) (slot-available r-slot3 Reykjavik)
    (slot-available r-slot4 Reykjavik) (slot-available r-slot5 Reykjavik)
  )

  ; Goals: enforce hard constraints exactly as specified:
  ; - traveler is in Reykjavik on the final day (day16)
  ; - meet_friend occurs on some day in [day12..day16] (the meet_friend action is required to set (met))
  ; - all city slots must have been consumed exactly (Porto 7, Berlin 6, Reykjavik 5)
  ; Note: because the sum of required slots is 18 while the timeline contains only 16 days, this formulation is intentionally strict
  ; and will be unsatisfiable; the encoding enforces the user's requirements as rigid constraints.
  (:goal (and
    (at traveler Reykjavik day16)
    (met)

    ; all Porto slots must be used (Porto: 7)
    (slot-used p-slot1 Porto) (slot-used p-slot2 Porto) (slot-used p-slot3 Porto)
    (slot-used p-slot4 Porto) (slot-used p-slot5 Porto) (slot-used p-slot6 Porto)
    (slot-used p-slot7 Porto)

    ; all Berlin slots must be used (Berlin: 6)
    (slot-used b-slot1 Berlin) (slot-used b-slot2 Berlin) (slot-used b-slot3 Berlin)
    (slot-used b-slot4 Berlin) (slot-used b-slot5 Berlin) (slot-used b-slot6 Berlin)

    ; all Reykjavik slots must be used (Reykjavik: 5)
    (slot-used r-slot1 Reykjavik) (slot-used r-slot2 Reykjavik) (slot-used r-slot3 Reykjavik)
    (slot-used r-slot4 Reykjavik) (slot-used r-slot5 Reykjavik)
  ))
)