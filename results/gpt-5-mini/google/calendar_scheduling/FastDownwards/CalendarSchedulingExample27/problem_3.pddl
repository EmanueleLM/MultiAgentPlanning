(define (problem calendar_scheduling_example27)
  (:domain calendar_scheduling)

  (:objects
    jesse kathryn megan - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Normalized combined availability (30-minute slots) for all participants.
    ;; Computed from given busy intervals:
    ;; Jesse busy: s1000, s1530
    ;; Kathryn: all slots free
    ;; Megan busy: s1030, s1130, s1200, s1330, s1400, s1500, s1530, s1600
    ;; Therefore slot is free for the meeting only if all three are available.
    (slot_free s0900)
    (slot_free s0930)
    (slot_free s1100)
    (slot_free s1230)
    (slot_free s1300)
    (slot_free s1430)
    (slot_free s1630)

    ;; No slot is scheduled initially.
  )

  (:goal (meeting_scheduled))
)