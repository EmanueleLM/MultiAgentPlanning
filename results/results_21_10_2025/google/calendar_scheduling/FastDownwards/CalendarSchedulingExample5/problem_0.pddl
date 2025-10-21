(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    ;; agents
    kathryn charlotte lauren - agent

    ;; 30-minute slots from Monday 09:00 to 16:30 (start times)
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Declare objects as agents and slots
    (agent kathryn) (agent charlotte) (agent lauren)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Kathryn's availability (from provided available_30min_slots)
    ;; busy: 09:00, 10:30, 11:30, 13:30-14:30 (so 13:30 and 14:00 blocked), 16:30
    ;; available list (explicitly used as free):
    ;; 09:30-10:00, 10:00-10:30, 11:00-11:30, 12:00-12:30, 12:30-13:00,
    ;; 13:00-13:30, 14:30-15:00, 15:00-15:30, 15:30-16:00, 16:00-16:30
    (free kathryn s0930) (free kathryn s1000) (free kathryn s1100)
    (free kathryn s1200) (free kathryn s1230) (free kathryn s1300)
    (free kathryn s1430) (free kathryn s1500) (free kathryn s1530) (free kathryn s1600)

    ;; Charlotte's availability (candidate_30min_slots) and preference that meetings must end by 13:30
    ;; candidate slots: 09:00, 09:30, 10:00, 10:30, 11:00, 11:30, 12:30, 13:00
    ;; (12:00 and 16:00 are busy and excluded)
    (free charlotte s0900) (free charlotte s0930) (free charlotte s1000)
    (free charlotte s1030) (free charlotte s1100) (free charlotte s1130)
    (free charlotte s1230) (free charlotte s1300)

    ;; Lauren's availability (candidate_free_slots_30min)
    ;; busy: 09:00-10:00 (so 09:00 and 09:30 busy), 12:00-12:30, 13:30-14:30,
    ;; 15:00-16:00, 16:30-17:00
    ;; candidate free: 10:00,10:30,11:00,11:30,12:30,13:00,14:30,16:00
    (free lauren s1000) (free lauren s1030) (free lauren s1100)
    (free lauren s1130) (free lauren s1230) (free lauren s1300)
    (free lauren s1430) (free lauren s1600)
  )

  (:goal (meeting-scheduled))
)