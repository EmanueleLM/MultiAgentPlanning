(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    denise joseph henry christian - participant
    s09_10 s10_11 s11_12 s12_13 s13_14 s14_15 s15_16 s16_17 - slot
  )

  (:init
    ;; participants and slots
    (participant denise) (participant joseph) (participant henry) (participant christian)
    (slot s09_10) (slot s10_11) (slot s11_12) (slot s12_13) (slot s13_14) (slot s14_15) (slot s15_16) (slot s16_17)

    ;; Work hours discretized into one-hour slots (09:00-17:00). A meeting must occupy one full slot.
    ;; Availability facts: explicit only for free slots. Any busy interval given in the input is
    ;; interpreted as unavailable (i.e., absence of an (available ...) fact for that slot).

    ;; Denise: available entire workday (no busy intervals)
    (available denise s09_10) (available denise s10_11) (available denise s11_12)
    (available denise s12_13) (available denise s13_14) (available denise s14_15)
    (available denise s15_16) (available denise s16_17)

    ;; Joseph: available entire workday (no busy intervals)
    (available joseph s09_10) (available joseph s10_11) (available joseph s11_12)
    (available joseph s12_13) (available joseph s13_14) (available joseph s14_15)
    (available joseph s15_16) (available joseph s16_17)

    ;; Henry: busy on Monday during 09:00-09:30, 10:00-10:30, 12:00-14:30, 15:00-16:00, and 16:30-17:00.
    ;; That blocks slots that overlap those intervals. The only full one-hour slot free for Henry is 11:00-12:00.
    (available henry s11_12)

    ;; Christian: busy on Monday during 09:00-11:00, 14:30-15:30, and 16:00-17:00.
    ;; That blocks 09-10, 10-11, 14-15, 15-16, 16-17. Christian is available 11-12, 12-13, 13-14.
    (available christian s11_12) (available christian s12_13) (available christian s13_14)

    ;; Meeting has not been scheduled yet
    (meeting-not-scheduled)
  )

  ;; Goal: schedule exactly one meeting (one action will set meeting-scheduled).
  (:goal (and (meeting-scheduled)))
)