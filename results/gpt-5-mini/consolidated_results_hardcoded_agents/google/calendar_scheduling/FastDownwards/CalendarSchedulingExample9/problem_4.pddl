(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - participant

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; participants
    (participant diane) (participant kelly) (participant deborah)

    ;; slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; work hours slots (09:00-17:00 at 30-min granularity)
    (work_slot s0900) (work_slot s0930) (work_slot s1000) (work_slot s1030)
    (work_slot s1100) (work_slot s1130) (work_slot s1200) (work_slot s1230)
    (work_slot s1300) (work_slot s1330) (work_slot s1400) (work_slot s1430)
    (work_slot s1500) (work_slot s1530) (work_slot s1600) (work_slot s1630)

    ;; explicit successor relation between contiguous 30-min slots
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Free facts derived from public busy schedules (closed-open intervals [start,end))
    ;; Diane busy: [09:00,09:30), [12:00,12:30), [14:30,15:30) -> busy slots s0900, s1200, s1430, s1500
    ;; Diane free = all work slots minus busy slots
    (free diane s0930) (free diane s1000) (free diane s1030)
    (free diane s1100) (free diane s1130) (free diane s1230)
    (free diane s1300) (free diane s1330) (free diane s1400)
    (free diane s1530) (free diane s1600) (free diane s1630)

    ;; Kelly busy: [09:30,10:00), [10:30,11:00) -> busy slots s0930, s1030
    ;; Kelly free = all work slots minus busy slots
    (free kelly s0900) (free kelly s1000) (free kelly s1100)
    (free kelly s1130) (free kelly s1200) (free kelly s1230)
    (free kelly s1300) (free kelly s1330) (free kelly s1400)
    (free kelly s1430) (free kelly s1500) (free kelly s1530)
    (free kelly s1600) (free kelly s1630)

    ;; Deborah busy: [09:00,09:30), [10:00,14:00), [14:30,17:00)
    ;; busy slots: s0900, s1000, s1030, s1100, s1130, s1200, s1230, s1300, s1330, s1430, s1500, s1530, s1600, s1630
    ;; Deborah free = remaining work slots
    (free deborah s0930)
    (free deborah s1400)
  )

  (:goal (scheduled))
)