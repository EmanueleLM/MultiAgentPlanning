(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  ;; Time slots are 30-minute start times between 09:00 and 16:30 (meeting duration 30 minutes).
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630
    - slot
  )

  (:init
    ;; declare slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Joyce's private availability derived from:
    ;; busy 11:00-11:30 -> s1100 busy
    ;; busy 13:30-14:00 -> s1330 busy
    ;; busy 14:30-16:30 -> s1430, s1500, s1530, s1600 busy
    ;; Therefore free slots for Joyce:
    (free-joyce s0900) (free-joyce s0930) (free-joyce s1000) (free-joyce s1030)
    (free-joyce s1130) (free-joyce s1200) (free-joyce s1230) (free-joyce s1300)
    (free-joyce s1400) (free-joyce s1630)

    ;; Christine's private information:
    ;; "I have no meetings on Monday" but "I cannot meet before 12:00"
    ;; So Christine is free for all slots at or after 12:00:
    (free-christine s1200) (free-christine s1230) (free-christine s1300) (free-christine s1330)
    (free-christine s1400) (free-christine s1430) (free-christine s1500) (free-christine s1530)
    (free-christine s1600) (free-christine s1630)

    ;; Alexander's private availability derived from:
    ;; busy 09:00-11:00 -> s0900,s0930,s1000,s1030 busy
    ;; busy 12:00-12:30 -> s1200 busy
    ;; busy 13:30-15:00 -> s1330,s1400,s1430 busy
    ;; busy 15:30-16:00 -> s1530 busy
    ;; busy 16:30-17:00 -> s1630 busy
    ;; Therefore free slots for Alexander:
    (free-alexander s1100) (free-alexander s1130) (free-alexander s1230)
    (free-alexander s1300) (free-alexander s1500) (free-alexander s1600)

    ;; Public/shared information (encoded as facts where helpful)
    ;; Meeting must be on Monday between 09:00 and 17:00 and duration is 30 minutes.
    ;; (These are not used as explicit predicates here beyond the slot definitions
    ;;  and the 30-minute slot granularity chosen above.)
  )

  ;; The planning goal is simply that a meeting is scheduled (at least one slot).
  (:goal (scheduled))
)