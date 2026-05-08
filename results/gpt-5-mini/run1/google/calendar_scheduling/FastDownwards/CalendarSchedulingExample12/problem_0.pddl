(define (problem schedule-monday)
  (:domain schedule-meeting)

  (:objects
    david debra kevin - person
    meeting1 - meeting

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    ; persons and meeting scaffold
    (person david)
    (person debra)
    (person kevin)

    (meeting meeting1)
    (unscheduled meeting1)

    ; declare all enumerated slots (30-minute start granularity from auditor canonical schedule)
    (slot s0900)  (slot s0930)  (slot s1000)  (slot s1030)  (slot s1100)
    (slot s1130)  (slot s1200)  (slot s1230)  (slot s1300)  (slot s1330)
    (slot s1400)  (slot s1430)  (slot s1500)  (slot s1530)  (slot s1600)

    ; explicit successor order among adjacent 30-minute start slots (enforces the enumerated timeline)
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)

    ; Canonicalized availability (hard constraints). These facts encode the auditor-canonical 60-minute start slots
    ; intersected with each participant's canonical availability. Every preference is enforced as a strict constraint:
    ; a meeting may only be scheduled at a slot that has an (available ?person ?slot) fact for every participant.

    ; David: auditor-provided available 60-minute starts (no busy intervals)
    (available david s0900)
    (available david s0930)
    (available david s1000)
    (available david s1030)
    (available david s1100)
    (available david s1130)
    (available david s1200)
    (available david s1230)
    (available david s1300)
    (available david s1330)
    (available david s1400)
    (available david s1430)
    (available david s1500)
    (available david s1530)
    (available david s1600)

    ; Debra: canonicalized hard-available 60-minute starts derived from provided intervals
    ; (only slots where Debra is free for the entire 60-minute window are included)
    (available debra s1000)   ; 10:00-11:00
    (available debra s1300)   ; 13:00-14:00
    (available debra s1430)   ; 14:30-15:30
    (available debra s1500)   ; 15:00-16:00

    ; Kevin: canonicalized hard-available 60-minute starts (explicit valid 60-min starts given)
    (available kevin s1200)   ; 12:00-13:00
    (available kevin s1230)   ; 12:30-13:30
    (available kevin s1300)   ; 13:00-14:00
  )

  ; Goal: enforce the mandated terminal conditions explicitly.
  ; The plan must produce a scheduled meeting at the single slot that satisfies all participants' hard constraints.
  (:goal (and
           (scheduled meeting1 s1300)
           (meeting-scheduled meeting1)
         )
  )
)