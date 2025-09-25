(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)

  ;; objects: three agents and 30-min granularity slots from 09:00-09:30 through 16:30-17:00
  (:objects
    bobby scott kimberly - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; next relations (30-minute steps)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Bobby: available entire Monday (all 30-min slots)
    (free bobby s0900) (free bobby s0930) (free bobby s1000) (free bobby s1030)
    (free bobby s1100) (free bobby s1130) (free bobby s1200) (free bobby s1230)
    (free bobby s1300) (free bobby s1330) (free bobby s1400) (free bobby s1430)
    (free bobby s1500) (free bobby s1530) (free bobby s1600) (free bobby s1630)

    ;; Scott: busy 11:30-12:00 (s1130) and 15:30-16:00 (s1530). All other slots free.
    (free scott s0900) (free scott s0930) (free scott s1000) (free scott s1030)
    (free scott s1100)                     ; s1130 busy -> not declared free
    (free scott s1200) (free scott s1230) (free scott s1300) (free scott s1330)
    (free scott s1400) (free scott s1430) (free scott s1500)                ; s1530 busy -> not declared free
    (free scott s1600) (free scott s1630)

    ;; Kimberly: busy intervals:
    ;; 11:00-12:00 -> s1100 and s1130 busy
    ;; 12:30-13:00 -> s1230 busy
    ;; 13:30-14:00 -> s1330 busy
    ;; 14:30-15:00 -> s1430 busy
    ;; 15:30-17:00 -> s1530, s1600, s1630 busy
    ;; All other slots are free (only encoding what Kimberly knows)
    (free kimberly s0900) (free kimberly s0930) (free kimberly s1000) (free kimberly s1030)
    ;; s1100 and s1130 not free (busy)
    (free kimberly s1200)
    ;; s1230 busy -> not free
    (free kimberly s1300)
    ;; s1330 busy -> not free
    (free kimberly s1400)
    ;; s1430 busy -> not free
    (free kimberly s1500)
    ;; s1530, s1600, s1630 busy -> not free

    ;; Note: meeting duration is 60 minutes (two consecutive 30-min slots).
    ;; Work hours are 09:00-17:00 and time slots are quantized to 30-min boundaries.
    ;; There exists at least one time that works for all participants (encoded via availabilities above).
  )

  (:goal (meeting-scheduled))
)