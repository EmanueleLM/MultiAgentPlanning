(define (problem schedule-monday-all-participants)
  (:domain unified-meeting-scheduling)

  (:objects
    ;; 30-minute start slots from 09:00 to 16:30 (covering 09:00-17:00)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot

    ;; participants (kept explicit so availability facts remain traceable)
    adam frances natalie patrick willie diana - person
  )

  (:init
    ;; work hours: all listed slots are within work hours
    (within t0900) (within t0930) (within t1000) (within t1030)
    (within t1100) (within t1130) (within t1200) (within t1230)
    (within t1300) (within t1330) (within t1400) (within t1430)
    (within t1500) (within t1530) (within t1600) (within t1630)

    ;; ------------------------
    ;; Agent: Adam
    ;; Adam reported busy at t1000 and t1230; therefore available at all other work slots.
    ;; (kept explicit for traceability)
    (available adam t0900) (available adam t0930) (available adam t1030)
    (available adam t1100) (available adam t1130) (available adam t1200)
    (available adam t1300) (available adam t1330) (available adam t1400)
    (available adam t1430) (available adam t1500) (available adam t1530)
    (available adam t1600) (available adam t1630)

    ;; ------------------------
    ;; Agent: Frances
    ;; Frances reported busy at t1230 and t1400; available at all other work slots.
    (available frances t0900) (available frances t0930) (available frances t1000)
    (available frances t1030) (available frances t1100) (available frances t1130)
    (available frances t1200) (available frances t1300) (available frances t1330)
    (available frances t1430) (available frances t1500) (available frances t1530)
    (available frances t1600) (available frances t1630)

    ;; ------------------------
    ;; Agent: Natalie
    ;; Natalie provided explicit busy times and an explicit available list.
    ;; Use the provided available list directly.
    (available natalie t0900) (available natalie t0930) (available natalie t1000)
    (available natalie t1100) (available natalie t1130) (available natalie t1200)
    (available natalie t1330) (available natalie t1400) (available natalie t1430)
    (available natalie t1500) (available natalie t1530) (available natalie t1630)

    ;; ------------------------
    ;; Agent: Patrick
    ;; Patrick reported busy at t1030, t1200, t1230, t1300, t1330, t1430, t1500, t1530.
    ;; Available at other slots:
    (available patrick t0900) (available patrick t0930) (available patrick t1000)
    (available patrick t1100) (available patrick t1130)
    (available patrick t1400) (available patrick t1600) (available patrick t1630)

    ;; ------------------------
    ;; Agent: Willie
    ;; Willie provided explicit busy and free lists (mapped to these slots).
    ;; Free slots (willie): t1000, t1130, t1300, t1330, t1530, t1630
    (available willie t1000) (available willie t1130) (available willie t1300)
    (available willie t1330) (available willie t1530) (available willie t1630)

    ;; ------------------------
    ;; Agent: Diana
    ;; Diana reported known free slots: slot4 (10:30-11:00 -> t1030) and slot16 (16:30-17:00 -> t1630)
    (available diana t1030) (available diana t1630)

    ;; Note: No (meeting-scheduled) fact in the init; scheduling is available.
  )

  ;; Global goal: schedule a 30-minute meeting within work hours that includes all participants.
  ;; The schedule-meeting action, when applied to a slot available to every participant,
  ;; will achieve these predicates.
  (:goal (and
    (meeting-scheduled)
    (includes-all-participants)
  ))
)