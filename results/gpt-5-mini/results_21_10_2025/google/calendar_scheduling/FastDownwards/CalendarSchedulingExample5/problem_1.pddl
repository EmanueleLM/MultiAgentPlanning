(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    ;; agents
    kathryn charlotte lauren - agent

    ;; 30-minute slot start times from Monday 09:00 to 16:30
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; declare agents and slots
    (agent kathryn) (agent charlotte) (agent lauren)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Kathryn's free 30-min slots (busy: 09:00,10:30,11:30,13:30-14:30,16:30)
    (free kathryn s0930) (free kathryn s1000) (free kathryn s1100)
    (free kathryn s1200) (free kathryn s1230) (free kathryn s1300)
    (free kathryn s1430) (free kathryn s1500) (free kathryn s1530) (free kathryn s1600)

    ;; Charlotte's free 30-min slots (busy: 12:00,16:00; preference: do not meet after 13:30)
    ;; Preference enforced by not declaring free for slots starting after 13:00.
    (free charlotte s0900) (free charlotte s0930) (free charlotte s1000)
    (free charlotte s1030) (free charlotte s1100) (free charlotte s1130)
    (free charlotte s1230) (free charlotte s1300)

    ;; Lauren's free 30-min slots (busy: 09:00-10:00,12:00,13:30-14:30,15:00-16:00,16:30-17:00)
    (free lauren s1000) (free lauren s1030) (free lauren s1100)
    (free lauren s1130) (free lauren s1230) (free lauren s1300)
    (free lauren s1430) (free lauren s1600)
  )

  ;; Goal: a meeting has been scheduled (any valid common free slot satisfying constraints)
  (:goal (meeting-scheduled))
)