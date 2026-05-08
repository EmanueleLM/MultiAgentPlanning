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

    ;; direct flights (bidirectional where available)
    (flight porto berlin)
    (flight berlin porto)
    (flight berlin reykjavik)
    (flight reykjavik berlin)

    ;; initial location: start in porto on day1
    (at traveler porto day1)

    ;; days available to assign (day1 already assigned; mark day2..day16 free)
    (day_free day2) (day_free day3) (day_free day4) (day_free day5)
    (day_free day6) (day_free day7) (day_free day8) (day_free day9)
    (day_free day10) (day_free day11) (day_free day12) (day_free day13)
    (day_free day14) (day_free day15) (day_free day16)

    ;; meeting window: day12..day16 inclusive
    (eligible_meet_day day12) (eligible_meet_day day13) (eligible_meet_day day14)
    (eligible_meet_day day15) (eligible_meet_day day16)

    ;; slot ownership encodes required total days per city
    (slot_belongs p_slot1 porto) (slot_belongs p_slot2 porto) (slot_belongs p_slot3 porto)
    (slot_belongs p_slot4 porto) (slot_belongs p_slot5 porto) (slot_belongs p_slot6 porto)
    (slot_belongs p_slot7 porto)

    (slot_belongs b_slot1 berlin) (slot_belongs b_slot2 berlin) (slot_belongs b_slot3 berlin)
    (slot_belongs b_slot4 berlin) (slot_belongs b_slot5 berlin) (slot_belongs b_slot6 berlin)

    (slot_belongs r_slot1 reykjavik) (slot_belongs r_slot2 reykjavik) (slot_belongs r_slot3 reykjavik)
    (slot_belongs r_slot4 reykjavik) (slot_belongs r_slot5 reykjavik)

    ;; available slots: all slots start available except the porto slot consumed by day1
    (slot_available p_slot2) (slot_available p_slot3) (slot_available p_slot4)
    (slot_available p_slot5) (slot_available p_slot6) (slot_available p_slot7)

    (slot_available b_slot1) (slot_available b_slot2) (slot_available b_slot3)
    (slot_available b_slot4) (slot_available b_slot5) (slot_available b_slot6)

    (slot_available r_slot1) (slot_available r_slot2) (slot_available r_slot3)
    (slot_available r_slot4) (slot_available r_slot5)

    ;; reflect that day1 in porto consumed one porto slot
    (slot_used p_slot1)
  )

  ;; Goals: encode the user's hard constraints exactly.
  ;; Note: requested stays (porto 7 + berlin 6 + reykjavik 5 = 18) exceed available days (16).
  ;; This encodes the (likely) inconsistent specification faithfully; solver may report unsolvable.
  (:goal (and
    ;; end in reykjavik on day16
    (at traveler reykjavik day16)

    ;; meeting must have occurred on an eligible day in reykjavik
    (met)

    ;; enforce all city-slot usage equal to requested stays
    ;; Porto: 7
    (slot_used p_slot1) (slot_used p_slot2) (slot_used p_slot3)
    (slot_used p_slot4) (slot_used p_slot5) (slot_used p_slot6) (slot_used p_slot7)

    ;; Berlin: 6
    (slot_used b_slot1) (slot_used b_slot2) (slot_used b_slot3)
    (slot_used b_slot4) (slot_used b_slot5) (slot_used b_slot6)

    ;; Reykjavik: 5
    (slot_used r_slot1) (slot_used r_slot2) (slot_used r_slot3)
    (slot_used r_slot4) (slot_used r_slot5)
  ))
)