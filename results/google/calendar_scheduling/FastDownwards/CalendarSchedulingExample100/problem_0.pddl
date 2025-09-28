(define (problem schedule-meeting-monday)
  (:domain meeting-scheduler)

  ;; Objects: slots are 30-minute-start granularity from 09:00 to 16:00 inclusive.
  ;; A meeting scheduled at slot sHHMM denotes a 60-minute contiguous meeting
  ;; starting at HH:MM and ending at HH:MM+60.
  (:objects
    denise joseph henry christian - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    ;; participants
    (participant denise)
    (participant joseph)
    (participant henry)
    (participant christian)

    ;; slots present (all are within work hours 09:00-17:00 and valid start times for a 60-min meeting)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100)
    (slot s1130) (slot s1200) (slot s1230) (slot s1300) (slot s1330)
    (slot s1400) (slot s1430) (slot s1500) (slot s1530) (slot s1600)

    ;; Busy facts derived directly from participants' availability reports.
    ;; Denise: no busy intervals on Monday (available entire workday) -> no busy-denise facts.

    ;; Joseph: no busy intervals on Monday -> no busy-joseph facts.

    ;; Henry busy intervals: 09:00-09:30, 10:00-10:30, 12:00-14:30, 15:00-16:00, 16:30-17:00
    ;; Mark any slot whose 60-minute window overlaps a busy interval as unavailable for Henry.
    ;; Computed overlaps (slots blocked for Henry):
    (busy-henry s0900)   ; 09:00-10:00 overlaps 09:00-09:30
    (busy-henry s0930)   ; 09:30-10:30 overlaps 10:00-10:30
    (busy-henry s1000)   ; 10:00-11:00 overlaps 10:00-10:30
    (busy-henry s1130)   ; 11:30-12:30 overlaps 12:00-14:30
    (busy-henry s1200)   ; 12:00-13:00 overlaps 12:00-14:30
    (busy-henry s1230)   ; 12:30-13:30 overlaps 12:00-14:30
    (busy-henry s1300)   ; 13:00-14:00 overlaps 12:00-14:30
    (busy-henry s1330)   ; 13:30-14:30 overlaps 12:00-14:30
    (busy-henry s1400)   ; 14:00-15:00 overlaps 12:00-14:30 (14:00-14:30 portion) -> blocked
    (busy-henry s1430)   ; 14:30-15:30 overlaps 15:00-16:00 (15:00-15:30)
    (busy-henry s1500)   ; 15:00-16:00 overlaps 15:00-16:00
    (busy-henry s1530)   ; 15:30-16:30 overlaps 15:00-16:00 (15:30-16:00)
    (busy-henry s1600)   ; 16:00-17:00 overlaps 16:30-17:00 (16:30-17:00)

    ;; Christian busy intervals: 09:00-11:00, 14:30-15:30, 16:00-17:00
    ;; Mark slots overlapping these intervals as unavailable for Christian:
    (busy-christian s0900)  ; 09:00-10:00
    (busy-christian s0930)  ; 09:30-10:30
    (busy-christian s1000)  ; 10:00-11:00
    (busy-christian s1030)  ; 10:30-11:30 overlaps until 11:00
    (busy-christian s1400)  ; 14:00-15:00 overlaps 14:30-15:00
    (busy-christian s1430)  ; 14:30-15:30
    (busy-christian s1500)  ; 15:00-16:00 overlaps 14:30-15:30
    (busy-christian s1530)  ; 15:30-16:30 overlaps 16:00-17:00 (16:00-16:30)
    (busy-christian s1600)  ; 16:00-17:00

    ;; No busy predicates for denise or joseph, reflecting their full availability in work hours.

    ;; Note: The model only encodes unavailability reported above; all other slots are considered free
    ;; unless explicitly marked busy. The earliest slot that is free for all participants is s1100 (11:00-12:00).
  )

  ;; Goal: schedule exactly one meeting of 60 minutes during the workday.
  ;; To prioritize the earliest feasible meeting slot (treated here as a hard preference),
  ;; this problem requests the meeting to be scheduled at the earliest slot that is available for all:
  ;; s1100 (11:00-12:00). This reflects the instructions to prefer earliest feasible slot and
  ;; is consistent with the provided availability constraints.
  (:goal (and
    (meeting-scheduled s1100)
  ))
)