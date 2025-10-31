(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    diane kelly deborah - person

    s_09_00_09_30 s_09_30_10_00 s_10_00_10_30 s_10_30_11_00
    s_11_00_11_30 s_11_30_12_00 s_12_00_12_30 s_12_30_13_00
    s_13_00_13_30 s_13_30_14_00 s_14_00_14_30 s_14_30_15_00
    s_15_00_15_30 s_15_30_16_00 s_16_00_16_30 s_16_30_17_00 - slot
  )

  (:init
    ;; persons
    (person diane)
    (person kelly)
    (person deborah)

    ;; slots (all 30-minute slots within the work hours 09:00-17:00)
    (slot s_09_00_09_30)
    (slot s_09_30_10_00)
    (slot s_10_00_10_30)
    (slot s_10_30_11_00)
    (slot s_11_00_11_30)
    (slot s_11_30_12_00)
    (slot s_12_00_12_30)
    (slot s_12_30_13_00)
    (slot s_13_00_13_30)
    (slot s_13_30_14_00)
    (slot s_14_00_14_30)
    (slot s_14_30_15_00)
    (slot s_15_00_15_30)
    (slot s_15_30_16_00)
    (slot s_16_00_16_30)
    (slot s_16_30_17_00)

    ;; Availabilities derived from participants' private busy intervals.
    ;; Diane busy: 09:00-09:30, 12:00-12:30, 14:30-15:30
    ;; Diane is available at all other work-hour 30-min slots:
    (available diane s_09_30_10_00)
    (available diane s_10_00_10_30)
    (available diane s_10_30_11_00)
    (available diane s_11_00_11_30)
    (available diane s_11_30_12_00)
    (available diane s_12_30_13_00)
    (available diane s_13_00_13_30)
    (available diane s_13_30_14_00)
    (available diane s_14_00_14_30)
    (available diane s_15_30_16_00)
    (available diane s_16_00_16_30)
    (available diane s_16_30_17_00)

    ;; Kelly busy: 09:30-10:00, 10:30-11:00
    ;; Kelly is available at remaining slots:
    (available kelly s_09_00_09_30)
    (available kelly s_10_00_10_30)
    (available kelly s_11_00_11_30)
    (available kelly s_11_30_12_00)
    (available kelly s_12_00_12_30)
    (available kelly s_12_30_13_00)
    (available kelly s_13_00_13_30)
    (available kelly s_13_30_14_00)
    (available kelly s_14_00_14_30)
    (available kelly s_14_30_15_00)
    (available kelly s_15_00_15_30)
    (available kelly s_15_30_16_00)
    (available kelly s_16_00_16_30)
    (available kelly s_16_30_17_00)

    ;; Deborah busy: 09:00-09:30, 10:00-14:00, 14:30-17:00
    ;; Deborah is available only at 09:30-10:00 and 14:00-14:30 within work hours:
    (available deborah s_09_30_10_00)
    (available deborah s_14_00_14_30)
  )

  ;; Goal: ensure a meeting for the three participants is scheduled.
  ;; The goal does not name the slot explicitly; the only way to reach this goal
  ;; is to run the schedule action at a slot where all three participants are available.
  (:goal (meeting-scheduled))
)