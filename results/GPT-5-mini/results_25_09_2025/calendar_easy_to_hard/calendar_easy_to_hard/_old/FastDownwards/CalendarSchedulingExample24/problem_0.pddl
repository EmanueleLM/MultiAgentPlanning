(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)
  (:objects
    ben hannah brenda - person
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; meeting and participants
    (meeting m1)
    (participant ben)
    (participant hannah)
    (participant brenda)

    ;; define who the meeting must include (used by actions that reason about participants)
    (participant_of m1 ben)
    (participant_of m1 hannah)
    (participant_of m1 brenda)

    ;; slots and workhours (Monday 09:00-17:00, 30-min start slots)
    (slot s0900) (within_workhours s0900) (free_slot s0900)
    (slot s0930) (within_workhours s0930) (free_slot s0930)
    (slot s1000) (within_workhours s1000) (free_slot s1000)
    (slot s1030) (within_workhours s1030) (free_slot s1030)
    (slot s1100) (within_workhours s1100) (free_slot s1100)
    (slot s1130) (within_workhours s1130) (free_slot s1130)
    (slot s1200) (within_workhours s1200) (free_slot s1200)
    (slot s1230) (within_workhours s1230) (free_slot s1230)
    (slot s1300) (within_workhours s1300) (free_slot s1300)
    (slot s1330) (within_workhours s1330) (free_slot s1330)
    (slot s1400) (within_workhours s1400) (free_slot s1400)
    (slot s1430) (within_workhours s1430) (free_slot s1430)
    (slot s1500) (within_workhours s1500) (free_slot s1500)
    (slot s1530) (within_workhours s1530) (free_slot s1530)
    (slot s1600) (within_workhours s1600) (free_slot s1600)
    (slot s1630) (within_workhours s1630) (free_slot s1630)

    ;; Benjamin's preference (from Agent 1): prefers not to meet after 09:30 on Monday.
    ;; Acceptable start slots: 09:00 and 09:30.
    (ben_pref_ok s0900)
    (ben_pref_ok s0930)

    ;; Hannah's known availability (Agent 2): Hannah is free the entire day.
    (available hannah s0900) (available hannah s0930) (available hannah s1000) (available hannah s1030)
    (available hannah s1100) (available hannah s1130) (available hannah s1200) (available hannah s1230)
    (available hannah s1300) (available hannah s1330) (available hannah s1400) (available hannah s1430)
    (available hannah s1500) (available hannah s1530) (available hannah s1600) (available hannah s1630)

    ;; Brenda's known busy slots (Agent 3). Mapping of slot indices to times:
    ;; slot2 = 09:30 -> s0930
    ;; slot6 = 11:30 -> s1130
    ;; slot7 = 12:00 -> s1200
    ;; slot11 = 14:00 -> s1400
    ;; slot12 = 14:30 -> s1430
    ;; slot13 = 15:00 -> s1500
    ;; slot14 = 15:30 -> s1530
    ;; slot15 = 16:00 -> s1600
    (busy brenda s0930)
    (busy brenda s1130)
    (busy brenda s1200)
    (busy brenda s1400)
    (busy brenda s1430)
    (busy brenda s1500)
    (busy brenda s1530)
    (busy brenda s1600)

    ;; No explicit busy facts for Benjamin (unknown availability), and no other meetings known,
    ;; thus slots are currently marked free_slot and not occupied.
  )

  ;; Goal: find a valid 30-minute slot on Monday between 09:00 and 17:00
  ;; that satisfies Benjamin's preference, Hannah's availability, and Brenda's busy constraints,
  ;; schedule the meeting there and invite all participants.
  ;; Based on the combined constraints, s0900 is the only common feasible start slot.
  (:goal (and
    (meeting_at m1 s0900)
    (proposed m1)
    (invited m1 ben)
    (invited m1 hannah)
    (invited m1 brenda)
  ))
)