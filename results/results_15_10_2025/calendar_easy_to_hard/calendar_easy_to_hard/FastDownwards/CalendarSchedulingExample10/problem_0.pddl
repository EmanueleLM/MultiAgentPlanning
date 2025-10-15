(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    denise joseph henry christian - participant
    s09 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ; Work-hour slots (09:00-17:00) discretized as one-hour starts:
    ; s09 = 09:00-10:00, s10 = 10:00-11:00, s11 = 11:00-12:00,
    ; s12 = 12:00-13:00, s13 = 13:00-14:00, s14 = 14:00-15:00,
    ; s15 = 15:00-16:00, s16 = 16:00-17:00.

    ; Availability derived from busy intervals (any overlap marks slot unavailable).
    ; Denise: available entire workday
    (available denise s09)
    (available denise s10)
    (available denise s11)
    (available denise s12)
    (available denise s13)
    (available denise s14)
    (available denise s15)
    (available denise s16)

    ; Joseph: available entire workday
    (available joseph s09)
    (available joseph s10)
    (available joseph s11)
    (available joseph s12)
    (available joseph s13)
    (available joseph s14)
    (available joseph s15)
    (available joseph s16)

    ; Henry: busy at 09:00-09:30, 10:00-10:30, 12:00-14:30, 15:00-16:00, 16:30-17:00
    ; This blocks s09 (09-10), s10 (10-11), s12 (12-13), s13 (13-14), s14 (14-15), s15 (15-16), s16 (16-17)
    ; Henry is available only at 11:00-12:00 (s11)
    (available henry s11)

    ; Christian: busy at 09:00-11:00, 14:30-15:30, 16:00-17:00
    ; This blocks s09 (09-10), s10 (10-11), s14 (14-15), s15 (15-16), s16 (16-17)
    ; Christian is available at s11 (11-12), s12 (12-13), s13 (13-14)
    (available christian s11)
    (available christian s12)
    (available christian s13)

    ; No meeting scheduled initially
    ; (meeting-scheduled) is false initially, so no fact needed here.
  )

  ; Goal: schedule a single one-hour meeting on Monday within work hours for all participants.
  (:goal (meeting-scheduled))
)