(define (problem trip-15-days)
  (:domain trip-itinerary)
  (:objects
    valencia amsterdam tallinn - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day

    ; slot tokens enforce exact days per city (we reconcile 5/5/5 to fit total 15)
    vslot1 vslot2 vslot3 vslot4 vslot5 - val_slot
    aslot1 aslot2 aslot3 aslot4 aslot5 - ams_slot
    tslot1 tslot2 tslot3 tslot4 tslot5 - tal_slot
  )

  (:init
    ; Trip initial condition: starting city not yet chosen
    (not_started)

    ; mark first day
    (first day1)

    ; successor days
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)

    ; direct flight connectivity (bidirectional facts)
    (flight amsterdam tallinn)
    (flight tallinn amsterdam)
    (flight valencia amsterdam)
    (flight amsterdam valencia)

    ; All slots initially unused (enforces exact counts when consumed)
    (val_slot_unused vslot1)
    (val_slot_unused vslot2)
    (val_slot_unused vslot3)
    (val_slot_unused vslot4)
    (val_slot_unused vslot5)

    (ams_slot_unused aslot1)
    (ams_slot_unused aslot2)
    (ams_slot_unused aslot3)
    (ams_slot_unused aslot4)
    (ams_slot_unused aslot5)

    (tal_slot_unused tslot1)
    (tal_slot_unused tslot2)
    (tal_slot_unused tslot3)
    (tal_slot_unused tslot4)
    (tal_slot_unused tslot5)

    ; Meeting allowed days for Tallinn: day9 .. day15 (friend available between day 9 and 15)
    (meeting_day day9)
    (meeting_day day10)
    (meeting_day day11)
    (meeting_day day12)
    (meeting_day day13)
    (meeting_day day14)
    (meeting_day day15)
  )

  (:goal
    (and
      ; All 15 days must be assigned to some city (ensures total trip length of 15 days)
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
      (occupied day11)
      (occupied day12)
      (occupied day13)
      (occupied day14)
      (occupied day15)

      ; Enforce reconciled desired stay counts by requiring all city slots to be consumed:
      ; Valencia: exactly 5 days
      (not (val_slot_unused vslot1))
      (not (val_slot_unused vslot2))
      (not (val_slot_unused vslot3))
      (not (val_slot_unused vslot4))
      (not (val_slot_unused vslot5))

      ; Amsterdam: exactly 5 days
      (not (ams_slot_unused aslot1))
      (not (ams_slot_unused aslot2))
      (not (ams_slot_unused aslot3))
      (not (ams_slot_unused aslot4))
      (not (ams_slot_unused aslot5))

      ; Tallinn: exactly 5 days (remaining days after setting Valencia and Amsterdam)
      (not (tal_slot_unused tslot1))
      (not (tal_slot_unused tslot2))
      (not (tal_slot_unused tslot3))
      (not (tal_slot_unused tslot4))
      (not (tal_slot_unused tslot5))

      ; Meeting in Tallinn must occur during the allowed window (day9..day15):
      (meeting_done)
    )
  )
)