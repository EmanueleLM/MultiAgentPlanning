(define (problem orchestrate-meeting)
  (:domain orchestrated-meeting)
  (:objects
    anthony pamela zachary
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30
  )

  (:init
    ;; persons
    (person anthony) (person pamela) (person zachary)

    ;; slots (09:00 - 16:30 at 30-minute granularity)
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; adjacency for one-hour meetings (two contiguous half-hour slots)
    (next s09_00 s09_30) (next s09_30 s10_00) (next s10_00 s10_30) (next s10_30 s11_00)
    (next s11_00 s11_30) (next s11_30 s12_00) (next s12_00 s12_30) (next s12_30 s13_00)
    (next s13_00 s13_30) (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)

    ;; --- Agent-provided private availabilities ---
    ;; Anthony (from agent 1): explicit free slots (only these are known free)
    ;; (Busy slots such as s09_30, s12_00, s12_30, s16_00 were omitted in the provided list)
    (free anthony s09_00)
    (free anthony s10_00) (free anthony s10_30)
    (free anthony s11_00) (free anthony s11_30)
    (free anthony s13_00) (free anthony s13_30)
    (free anthony s14_00) (free anthony s14_30)
    (free anthony s15_00) (free anthony s15_30)
    (free anthony s16_30)

    ;; Pamela (from agent 2): Pamela's known free starts for a full 1-hour (preference: no meetings after 14:30).
    ;; These correspond to starts at 10:00..13:30 (i.e. s10_00 .. s13_30),
    ;; but note the last start s13_30 is not usable by Pamela if the next half-hour is busy; the explicit free facts below
    ;; reflect the start slots that the Pamela agent declared free for the whole hour window.
    (free pamela s10_00) (free pamela s10_30)
    (free pamela s11_00) (free pamela s11_30)
    (free pamela s12_00) (free pamela s12_30)
    (free pamela s13_00) (free pamela s13_30)

    ;; Zachary (from agent 3): only explicitly free half-hour slots were provided for Zachary.
    ;; From the provided mapping these are: 11:30, 12:30, 13:30, 14:00, 15:00, 15:30
    (free zachary s11_30) (free zachary s12_30) (free zachary s13_30)
    (free zachary s14_00) (free zachary s15_00) (free zachary s15_30)
  )

  ;; Goal: all three participants must be included in the scheduled one-hour meeting.
  (:goal (and
    (meeting-scheduled)
    (meeting-with anthony)
    (meeting-with pamela)
    (meeting-with zachary)
  ))
)