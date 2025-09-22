(define (problem schedule-meeting-monday-combined)
  (:domain meeting-scheduling-combined)

  (:objects
    kathryn charlotte lauren - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ; declare all slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ; Kathryn's availability (from Kathryn's input)
    ; Kathryn blocked: s0900, s1030, s1130, s1330, s1400, s1630
    (available kathryn s0930)
    (available kathryn s1000)
    (available kathryn s1100)
    (available kathryn s1200)
    (available kathryn s1230)
    (available kathryn s1300)
    (available kathryn s1430)
    (available kathryn s1500)
    (available kathryn s1530)
    (available kathryn s1600)

    ; Charlotte's availability and preference (from Charlotte's input)
    ; Blocked slots: s1200, s1600. Preference: no meeting starting after 13:30 -> we assert availability only up to s1330.
    (available charlotte s0900)
    (available charlotte s0930)
    (available charlotte s1000)
    (available charlotte s1030)
    (available charlotte s1100)
    (available charlotte s1130)
    ; (s1200) intentionally not asserted for Charlotte (blocked)
    (available charlotte s1230)
    (available charlotte s1300)
    (available charlotte s1330)

    ; Lauren's availability (from Lauren's input, mapped to same slot names)
    ; Lauren blocked: s0900, s0930, s1200, s1330, s1400, s1500, s1530, s1630 (per her blocking list mapped)
    ; Available slots per Lauren's input:
    (available lauren s1000)
    (available lauren s1030)
    (available lauren s1100)
    (available lauren s1130)
    (available lauren s1230)
    (available lauren s1300)
    (available lauren s1430)
    (available lauren s1600)

    ; Note: Kathryn/Charlotte/Lauren availability intersection includes s1000, s1100, s1230, s1300
    ; which satisfies all agents' constraints/preferences. No slots are initially booked and no meeting is scheduled.
  )

  ;; Goal: schedule a single 30-minute meeting (any valid common slot)
  (:goal (meeting-scheduled))
)