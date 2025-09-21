(define (problem schedule-monday-integrated)
  (:domain integrated-meeting)

  (:objects
    ;; canonical 30-minute start times between 09:00 and 16:30 (inclusive)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    ;; participants (collected from agent submissions)
    samantha marilyn mark andrea matthew arthur - person
  )

  (:init
    ;; declare timeslots and persons
    (timeslot t0900) (timeslot t0930) (timeslot t1000) (timeslot t1030)
    (timeslot t1100) (timeslot t1130) (timeslot t1200) (timeslot t1230)
    (timeslot t1300) (timeslot t1330) (timeslot t1400) (timeslot t1430)
    (timeslot t1500) (timeslot t1530) (timeslot t1600) (timeslot t1630)

    (person samantha) (person marilyn) (person mark) (person andrea) (person matthew) (person arthur)

    ;; meeting not yet scheduled
    (meeting-not-scheduled)

    ;; --- Availability facts merged & normalized to the canonical timeslot names ---
    ;; Samantha's free slots (from her submission; busy: 11:00,13:00,15:30,16:30)
    (free samantha t0900) (free samantha t0930) (free samantha t1000) (free samantha t1030)
    (free samantha t1130) (free samantha t1200) (free samantha t1230)
    (free samantha t1330) (free samantha t1400) (free samantha t1430)
    (free samantha t1500) (free samantha t1600)

    ;; Matthew: claimed free the whole Monday 09:00-17:00 (all slots)
    (free matthew t0900) (free matthew t0930) (free matthew t1000) (free matthew t1030)
    (free matthew t1100) (free matthew t1130) (free matthew t1200) (free matthew t1230)
    (free matthew t1300) (free matthew t1330) (free matthew t1400) (free matthew t1430)
    (free matthew t1500) (free matthew t1530) (free matthew t1600) (free matthew t1630)

    ;; Marilyn's free slots (mapped: s2=10:00, s5=11:30, s8=13:00, s9=13:30,
    ;;                            s11=14:30, s12=15:00, s13=15:30, s15=16:30)
    (free marilyn t1000) (free marilyn t1130) (free marilyn t1300) (free marilyn t1330)
    (free marilyn t1430) (free marilyn t1500) (free marilyn t1530) (free marilyn t1630)

    ;; Mark's free slots (from his submission)
    (free mark t0900) (free mark t1100) (free mark t1330) (free mark t1430)
    (free mark t1600) (free mark t1630)

    ;; Andrea's free slots (from her submission)
    (free andrea t0900) (free andrea t1100) (free andrea t1430)
    (free andrea t1530) (free andrea t1600) (free andrea t1630)

    ;; Arthur: in his submission he indicated free all Monday 09:00-17:00
    (free arthur t0900) (free arthur t0930) (free arthur t1000) (free arthur t1030)
    (free arthur t1100) (free arthur t1130) (free arthur t1200) (free arthur t1230)
    (free arthur t1300) (free arthur t1330) (free arthur t1400) (free arthur t1430)
    (free arthur t1500) (free arthur t1530) (free arthur t1600) (free arthur t1630)
  )

  ;; Goal: meeting scheduled and all participants attending.
  (:goal (and
    (meeting-scheduled)
    (attending samantha) (attending marilyn) (attending mark)
    (attending andrea) (attending matthew) (attending arthur)
  ))
)