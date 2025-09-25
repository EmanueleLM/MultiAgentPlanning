(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)
  (:objects
    ben hannah brenda - person
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (is_meeting m1)
    (participant ben)
    (participant hannah)
    (participant brenda)

    (participant_of m1 ben)
    (participant_of m1 hannah)
    (participant_of m1 brenda)

    (is_slot s0900) (within_workhours s0900) (free_slot s0900)
    (is_slot s0930) (within_workhours s0930) (free_slot s0930)
    (is_slot s1000) (within_workhours s1000) (free_slot s1000)
    (is_slot s1030) (within_workhours s1030) (free_slot s1030)
    (is_slot s1100) (within_workhours s1100) (free_slot s1100)
    (is_slot s1130) (within_workhours s1130) (free_slot s1130)
    (is_slot s1200) (within_workhours s1200) (free_slot s1200)
    (is_slot s1230) (within_workhours s1230) (free_slot s1230)
    (is_slot s1300) (within_workhours s1300) (free_slot s1300)
    (is_slot s1330) (within_workhours s1330) (free_slot s1330)
    (is_slot s1400) (within_workhours s1400) (free_slot s1400)
    (is_slot s1430) (within_workhours s1430) (free_slot s1430)
    (is_slot s1500) (within_workhours s1500) (free_slot s1500)
    (is_slot s1530) (within_workhours s1530) (free_slot s1530)
    (is_slot s1600) (within_workhours s1600) (free_slot s1600)
    (is_slot s1630) (within_workhours s1630) (free_slot s1630)

    (ben_pref_ok s0900)
    (ben_pref_ok s0930)

    (available hannah s0900) (available hannah s0930) (available hannah s1000) (available hannah s1030)
    (available hannah s1100) (available hannah s1130) (available hannah s1200) (available hannah s1230)
    (available hannah s1300) (available hannah s1330) (available hannah s1400) (available hannah s1430)
    (available hannah s1500) (available hannah s1530) (available hannah s1600) (available hannah s1630)

    (busy brenda s0930)
    (busy brenda s1130)
    (busy brenda s1200)
    (busy brenda s1400)
    (busy brenda s1430)
    (busy brenda s1500)
    (busy brenda s1530)
    (busy brenda s1600)
  )

  (:goal (and
    (meeting_at m1 s0900)
    (proposed m1)
    (invited m1 ben)
    (invited m1 hannah)
    (invited m1 brenda)
  ))
)