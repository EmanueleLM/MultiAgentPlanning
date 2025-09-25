(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    kathryn charlotte lauren - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; define time slots
    (time-slot s0900) (time-slot s0930) (time-slot s1000) (time-slot s1030)
    (time-slot s1100) (time-slot s1130) (time-slot s1200) (time-slot s1230)
    (time-slot s1300) (time-slot s1330) (time-slot s1400) (time-slot s1430)
    (time-slot s1500) (time-slot s1530) (time-slot s1600) (time-slot s1630)

    ;; Meeting initially not scheduled
    (meeting-not-scheduled)

    ;; Kathryn's availability (private blocks applied)
    ;; Kathryn blocked: s0900, s1030, s1130, s1330, s1400, s1630
    (available kathryn s0930) (available kathryn s1000) (available kathryn s1100)
    (available kathryn s1200) (available kathryn s1230) (available kathryn s1300)
    (available kathryn s1430) (available kathryn s1500) (available kathryn s1530)
    (available kathryn s1600)

    ;; Charlotte's availability (private blocks and preference applied)
    ;; Charlotte blocked: s1200, s1600 and prefers no meetings after 13:30 (so slots > s1330 not available)
    (available charlotte s0900) (available charlotte s0930) (available charlotte s1000)
    (available charlotte s1030) (available charlotte s1100) (available charlotte s1130)
    (available charlotte s1230) (available charlotte s1300) (available charlotte s1330)

    ;; Lauren's availability (private blocks applied)
    ;; Lauren blocked: s0900, s0930, s1200, s1330, s1400, s1500, s1530, s1630
    (available lauren s1000) (available lauren s1030) (available lauren s1100)
    (available lauren s1130) (available lauren s1230) (available lauren s1300)
    (available lauren s1430) (available lauren s1600)
  )

  ;; Goal: a single meeting is scheduled (domain actions ensure all participants were available)
  (:goal (meeting-scheduled))
)