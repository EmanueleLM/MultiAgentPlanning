(define (problem trip_16days)
  (:domain trip_planning)

  (:objects
    traveler - person

    porto berlin reykjavik - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    p_slot1 p_slot2 p_slot3 p_slot4 p_slot5 p_slot6 p_slot7 - slot
    b_slot1 b_slot2 b_slot3 b_slot4 b_slot5 b_slot6 - slot
    r_slot1 r_slot2 r_slot3 r_slot4 r_slot5 - slot
  )

  (:init
    ;; linear day order
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    ;; direct flights (bidirectional where specified)
    (flight porto berlin)
    (flight berlin porto)
    (flight berlin reykjavik)
    (flight reykjavik berlin)

    ;; initial location: start in porto on day1
    (at traveler porto day1)
    (day-occupied day1)

    ;; meeting window: day12..day16 inclusive
    (eligible-meet-day day12) (eligible-meet-day day13) (eligible-meet-day day14)
    (eligible-meet-day day15) (eligible-meet-day day16)

    ;; slot ownership (encode required total days per city as number of slots)
    (slot-belongs p_slot1 porto) (slot-belongs p_slot2 porto) (slot-belongs p_slot3 porto)
    (slot-belongs p_slot4 porto) (slot-belongs p_slot5 porto) (slot-belongs p_slot6 porto)
    (slot-belongs p_slot7 porto)

    (slot-belongs b_slot1 berlin) (slot-belongs b_slot2 berlin) (slot-belongs b_slot3 berlin)
    (slot-belongs b_slot4 berlin) (slot-belongs b_slot5 berlin) (slot-belongs b_slot6 berlin)

    (slot-belongs r_slot1 reykjavik) (slot-belongs r_slot2 reykjavik) (slot-belongs r_slot3 reykjavik)
    (slot-belongs r_slot4 reykjavik) (slot-belongs r_slot5 reykjavik)

    ;; available slots: all slots start available except the porto slot consumed by day1
    (slot-available p_slot2) (slot-available p_slot3) (slot-available p_slot4)
    (slot-available p_slot5) (slot-available p_slot6) (slot-available p_slot7)

    (slot-available b_slot1) (slot-available b_slot2) (slot-available b_slot3)
    (slot-available b_slot4) (slot-available b_slot5) (slot-available b_slot6)

    (slot-available r_slot1) (slot-available r_slot2) (slot-available r_slot3)
    (slot-available r_slot4) (slot-available r_slot5)

    ;; reflect that day1 in porto consumed one porto slot
    (slot-used p_slot1)
  )

  ;; Goals: encode the user's hard constraints exactly.
  ;; Note: the sum of required days (porto 7 + berlin 6 + reykjavik 5 = 18) exceeds available days (16).
  ;; This encodes the (likely) inconsistent specification faithfully; solver may report unsolvable.
  (:goal (and
    ;; end in reykjavik on day16
    (at traveler reykjavik day16)

    ;; meeting must have occurred on an eligible day in reykjavik
    (met)

    ;; enforce all city-slot usage equal to requested stays
    ;; Porto: 7
    (slot-used p_slot1) (slot-used p_slot2) (slot-used p_slot3)
    (slot-used p_slot4) (slot-used p_slot5) (slot-used p_slot6) (slot-used p_slot7)

    ;; Berlin: 6
    (slot-used b_slot1) (slot-used b_slot2) (slot-used b_slot3)
    (slot-used b_slot4) (slot-used b_slot5) (slot-used b_slot6)

    ;; Reykjavik: 5
    (slot-used r_slot1) (slot-used r_slot2) (slot-used r_slot3)
    (slot-used r_slot4) (slot-used r_slot5)
  ))
)