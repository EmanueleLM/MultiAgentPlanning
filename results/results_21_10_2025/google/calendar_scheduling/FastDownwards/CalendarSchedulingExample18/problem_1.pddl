(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Objects: three participants and 16 half-hour slots s1..s16 from 09:00-09:30 (s1) to 16:30-17:00 (s16).
  (:objects
    brian billy patricia - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; Brian: no meetings during 09:00-17:00 => available all slots.
    (available brian s1) (available brian s2) (available brian s3) (available brian s4)
    (available brian s5) (available brian s6) (available brian s7) (available brian s8)
    (available brian s9) (available brian s10) (available brian s11) (available brian s12)
    (available brian s13) (available brian s14) (available brian s15) (available brian s16)

    ;; Billy: busy on 10:00-10:30 (s3), 11:30-12:00 (s6), 14:00-14:30 (s11), 16:30-17:00 (s16).
    ;; Billy also prefers to avoid meetings after 15:30. This preference is encoded here as making
    ;; Billy unavailable for slots starting at or after 15:30 (s14,s15,s16), so the planner will
    ;; choose a slot before 15:30 when possible. Remaining available slots:
    ;; s1(09:00), s2(09:30), s4(10:30), s5(11:00), s7(12:00), s8(12:30), s9(13:00), s10(13:30), s12(14:30), s13(15:00)
    (available billy s1) (available billy s2) (available billy s4) (available billy s5)
    (available billy s7) (available billy s8) (available billy s9) (available billy s10)
    (available billy s12) (available billy s13)

    ;; Patricia: busy 09:00-12:30 (s1..s7), 13:30-14:00 (s10), 14:30-16:00 (s12,s13,s14), 16:30-17:00 (s16).
    ;; Therefore Patricia is available at s8(12:30-13:00), s9(13:00-13:30), s11(14:00-14:30), s15(16:00-16:30).
    (available patricia s8) (available patricia s9) (available patricia s11) (available patricia s15)

    ;; No meeting scheduled yet and meeting-made flag false.
    ;; (meeting-scheduled ...) facts are absent (implicitly false).
    ;; meeting-made is absent (implicitly false).
  )

  ;; Goal: have one meeting scheduled (meeting-made). The goal does not hard-code a specific slot;
  ;; any valid slot that satisfies all hard constraints (and the represented preference) is acceptable.
  (:goal (meeting-made))
)