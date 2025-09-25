(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    ; participants
    eric jeremy joe brian brittany julia - participant

    ; canonical 30-minute slots between 09:00 and 16:30 (start times)
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; declare participants and slots
    (participant eric) (participant jeremy) (participant joe)
    (participant brian) (participant brittany) (participant julia)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; allowed_slot = all slots in Monday 09:00-17:00 window (used by Julia's action)
    (allowed_slot s0900) (allowed_slot s0930) (allowed_slot s1000) (allowed_slot s1030)
    (allowed_slot s1100) (allowed_slot s1130) (allowed_slot s1200) (allowed_slot s1230)
    (allowed_slot s1300) (allowed_slot s1330) (allowed_slot s1400) (allowed_slot s1430)
    (allowed_slot s1500) (allowed_slot s1530) (allowed_slot s1600) (allowed_slot s1630)

    ;; --- Busy constraints gathered from each participant's problem (mapped to canonical slot names) ---
    ;; Eric (from Eric's problem): busy 10:00-10:30 (s1000), 12:30-13:00 (s1230)
    (busy eric s1000)
    (busy eric s1230)

    ;; Jeremy (from Jeremy's problem): busy 11:00-11:30 (s1100), 11:30-12:00 (s1130),
    ;; 12:30-13:00 (s1230), 15:00-15:30 (s1500)
    (busy jeremy s1100)
    (busy jeremy s1130)
    (busy jeremy s1230)
    (busy jeremy s1500)

    ;; Joe (from Joe's problem): Joe is available for all slots (explicit available facts)
    (available joe s0900) (available joe s0930) (available joe s1000) (available joe s1030)
    (available joe s1100) (available joe s1130) (available joe s1200) (available joe s1230)
    (available joe s1300) (available joe s1330) (available joe s1400) (available joe s1430)
    (available joe s1500) (available joe s1530) (available joe s1600) (available joe s1630)

    ;; Brian (from Brian's problem): busy 09:00, 09:30, 10:00; 11:00, 11:30, 12:00, 12:30;
    ;; 13:30; 14:30, 15:00, 15:30; 16:30
    (busy brian s0900) (busy brian s0930) (busy brian s1000)
    (busy brian s1100) (busy brian s1130) (busy brian s1200) (busy brian s1230)
    (busy brian s1330)
    (busy brian s1430) (busy brian s1500) (busy brian s1530)
    (busy brian s1630)

    ;; Brittany (from Brittany's problem): busy 09:00; 10:30, 11:00, 11:30; 13:30, 14:00; 15:00; 16:30
    (busy brittany s0900)
    (busy brittany s1030) (busy brittany s1100) (busy brittany s1130)
    (busy brittany s1330) (busy brittany s1400)
    (busy brittany s1500)
    (busy brittany s1630)

    ;; Julia (from Julia's problem): busy 09:00, 09:30, 10:00, 10:30; 12:30; 13:30, 14:00, 14:30; 16:00, 16:30
    (busy julia s0900) (busy julia s0930) (busy julia s1000) (busy julia s1030)
    (busy julia s1230)
    (busy julia s1330) (busy julia s1400) (busy julia s1430)
    (busy julia s1600) (busy julia s1630)

    ;; Note: some contributor models declared generic "participant" facts for their actions. Those are included above.
  )

  ;; Goal: a single 30-minute meeting scheduled within Monday 09:00-17:00 that satisfies everyone's encoded constraints.
  ;; Any of the scheduling actions in the domain can achieve this, but meaningful solutions will be those that avoid
  ;; slots where any participant is marked busy.
  (:goal (meeting-scheduled))
)