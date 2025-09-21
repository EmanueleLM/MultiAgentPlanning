(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)
  (:objects
    benjamin hannah brenda - person
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (within_workhours s0900)
    (within_workhours s0930)
    (within_workhours s1000)
    (within_workhours s1030)
    (within_workhours s1100)
    (within_workhours s1130)
    (within_workhours s1200)
    (within_workhours s1230)
    (within_workhours s1300)
    (within_workhours s1330)
    (within_workhours s1400)
    (within_workhours s1430)
    (within_workhours s1500)
    (within_workhours s1530)
    (within_workhours s1600)
    (within_workhours s1630)

    (participant_of m1 benjamin)
    (participant_of m1 hannah)
    (participant_of m1 brenda)

    (busy brenda s0930)
    (busy brenda s1130)
    (busy brenda s1200)
    (busy brenda s1400)
    (busy brenda s1430)
    (busy brenda s1500)
    (busy brenda s1530)
    (busy brenda s1600)
  )

  (:goal (meeting_at m1 s1300))
)