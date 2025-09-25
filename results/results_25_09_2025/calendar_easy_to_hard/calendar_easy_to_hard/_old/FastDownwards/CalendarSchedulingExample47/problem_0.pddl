(define (problem schedule-all-participants-monday)
  (:domain integrated-scheduling)

  ;; 30-minute start slots from 09:00 to 16:30
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    alice daniel scott lori cynthia jeffrey hannah - person
  )

  (:init
    ;; declare slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; --- Availabilities per participant (integrated from the seven agents) ---
    ;; Alice: free the entire day (09:00-16:30)
    (available alice s0900) (available alice s0930) (available alice s1000) (available alice s1030)
    (available alice s1100) (available alice s1130) (available alice s1200) (available alice s1230)
    (available alice s1300) (available alice s1330) (available alice s1400) (available alice s1430)
    (available alice s1500) (available alice s1530) (available alice s1600) (available alice s1630)

    ;; Daniel: busy at 10:00, 15:00-16:00, 16:30-17:00 -> available at these starts:
    (available daniel s0900) (available daniel s0930) (available daniel s1030)
    (available daniel s1100) (available daniel s1130) (available daniel s1200)
    (available daniel s1230) (available daniel s1300) (available daniel s1330)
    (available daniel s1400) (available daniel s1430) (available daniel s1600)

    ;; Scott: available slots listed by Scott
    (available scott s1000) (available scott s1030) (available scott s1100) (available scott s1130)
    (available scott s1300) (available scott s1330) (available scott s1430) (available scott s1500)
    (available scott s1530) (available scott s1630)

    ;; Lori: busy 12:30-13:00 (s1230) and 16:00-16:30 (s1600) -> other slots free
    (available lori s0900) (available lori s0930) (available lori s1000) (available lori s1030)
    (available lori s1100) (available lori s1130) (available lori s1200)
    (available lori s1300) (available lori s1330) (available lori s1400)
    (available lori s1430) (available lori s1500) (available lori s1530) (available lori s1630)

    ;; Cynthia: free slots as provided
    (available cynthia s0930) (available cynthia s1000) (available cynthia s1030)
    (available cynthia s1130) (available cynthia s1300) (available cynthia s1430)
    (available cynthia s1500) (available cynthia s1630)

    ;; Jeffrey: only free at 11:30 and 16:00 per his encoding
    (available jeffrey s1130) (available jeffrey s1600)

    ;; Hannah: free slots as provided
    (available hannah s1100) (available hannah s1130) (available hannah s1230)
    (available hannah s1500) (available hannah s1530) (available hannah s1600)
  )

  ;; Goal: finalize a meeting that all listed participants attend
  (:goal (meeting-scheduled))
)