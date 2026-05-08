(define (problem schedule_meeting_monday)
  (:domain meeting_scheduling)

  (:objects
    thomas dylan jerry - person
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )

  (:init
    ;; successor relation (30-minute increments)
    (succ s_0900 s_0930) (succ s_0930 s_1000) (succ s_1000 s_1030) (succ s_1030 s_1100)
    (succ s_1100 s_1130) (succ s_1130 s_1200) (succ s_1200 s_1230) (succ s_1230 s_1300)
    (succ s_1300 s_1330) (succ s_1330 s_1400) (succ s_1400 s_1430) (succ s_1430 s_1500)
    (succ s_1500 s_1530) (succ s_1530 s_1600) (succ s_1600 s_1630)

    ;; Thomas: free entire workday 09:00-17:00 (every listed slot)
    (available thomas s_0900) (available thomas s_0930) (available thomas s_1000) (available thomas s_1030)
    (available thomas s_1100) (available thomas s_1130) (available thomas s_1200) (available thomas s_1230)
    (available thomas s_1300) (available thomas s_1330) (available thomas s_1400) (available thomas s_1430)
    (available thomas s_1500) (available thomas s_1530) (available thomas s_1600) (available thomas s_1630)

    ;; Dylan: busy 10:30-11:00 (s_1030) and 13:30-14:00 (s_1330); available otherwise within work hours
    (available dylan s_0900) (available dylan s_0930) (available dylan s_1000)
    (available dylan s_1100) (available dylan s_1130) (available dylan s_1200) (available dylan s_1230) (available dylan s_1300)
    (available dylan s_1400) (available dylan s_1430) (available dylan s_1500) (available dylan s_1530) (available dylan s_1600) (available dylan s_1630)

    ;; Jerry: busy 09:00-11:00, 11:30-14:30, and 16:00-17:00
    ;; Therefore Jerry is available only 14:30-16:00 -> s_1430, s_1500, s_1530
    (available jerry s_1430) (available jerry s_1500) (available jerry s_1530)
  )

  ;; Goal: schedule a one-hour meeting (two contiguous 30-minute slots) where all participants are free.
  ;; From the cleaned common availability the meeting can start at 14:30 (s_1430 -> s_1500).
  (:goal (meeting_scheduled s_1430 s_1500))
)