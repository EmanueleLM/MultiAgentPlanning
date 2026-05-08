(define (problem schedule_meeting_monday)
  (:domain meeting_scheduling)

  (:objects
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )

  (:init
    ;; successor (half-hour) chain
    (succ s_0900 s_0930) (succ s_0930 s_1000) (succ s_1000 s_1030) (succ s_1030 s_1100)
    (succ s_1100 s_1130) (succ s_1130 s_1200) (succ s_1200 s_1230) (succ s_1230 s_1300)
    (succ s_1300 s_1330) (succ s_1330 s_1400) (succ s_1400 s_1430) (succ s_1430 s_1500)
    (succ s_1500 s_1530) (succ s_1530 s_1600) (succ s_1600 s_1630)

    ;; thomas: available all work slots 09:00-17:00 (represented by listed half-hour starts)
    (available thomas s_0900) (available thomas s_0930) (available thomas s_1000) (available thomas s_1030)
    (available thomas s_1100) (available thomas s_1130) (available thomas s_1200) (available thomas s_1230)
    (available thomas s_1300) (available thomas s_1330) (available thomas s_1400) (available thomas s_1430)
    (available thomas s_1500) (available thomas s_1530) (available thomas s_1600) (available thomas s_1630)

    ;; dylan: busy 10:30-11:00 (s_1030) and 13:30-14:00 (s_1330) -> those slots absent
    (available dylan s_0900) (available dylan s_0930) (available dylan s_1000)
    (available dylan s_1100) (available dylan s_1130) (available dylan s_1200) (available dylan s_1230) (available dylan s_1300)
    (available dylan s_1400) (available dylan s_1430) (available dylan s_1500) (available dylan s_1530) (available dylan s_1600) (available dylan s_1630)

    ;; jerry: busy 09:00-11:00 (s_0900,s_0930,s_1000,s_1030), 11:30-14:30 (s_1130,s_1200,s_1230,s_1300,s_1330,s_1400),
    ;; and 16:00-17:00 (s_1600) => available from 14:30-16:00 as half-hour starts s_1430, s_1500, s_1530
    (available jerry s_1430) (available jerry s_1500) (available jerry s_1530)
  )

  ;; Goal: schedule the one-hour meeting at the common free one-hour interval found (14:30-15:30),
  ;; represented by the two consecutive half-hour slots s_1430 and s_1500.
  (:goal (meeting_scheduled s_1430 s_1500))
)