(define (problem schedule-monday-integrated)
  (:domain integrated-meeting)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    samantha brian arthur matthew marilyn mark andrea - person
  )

  (:init
    (is-timeslot t0900) (is-timeslot t0930) (is-timeslot t1000) (is-timeslot t1030)
    (is-timeslot t1100) (is-timeslot t1130) (is-timeslot t1200) (is-timeslot t1230)
    (is-timeslot t1300) (is-timeslot t1330) (is-timeslot t1400) (is-timeslot t1430)
    (is-timeslot t1500) (is-timeslot t1530) (is-timeslot t1600) (is-timeslot t1630)

    (is-person samantha) (is-person brian) (is-person arthur) (is-person matthew)
    (is-person marilyn) (is-person mark) (is-person andrea)

    (meeting-not-scheduled)

    (free samantha t0900) (free samantha t0930) (free samantha t1000) (free samantha t1030)
    (free samantha t1130) (free samantha t1200) (free samantha t1230)
    (free samantha t1330) (free samantha t1400) (free samantha t1430)
    (free samantha t1500) (free samantha t1600)

    (free brian t0900) (free brian t0930) (free brian t1000) (free brian t1030)
    (free brian t1100) (free brian t1130) (free brian t1200) (free brian t1230)
    (free brian t1300) (free brian t1330) (free brian t1400) (free brian t1430)
    (free brian t1500) (free brian t1530) (free brian t1600) (free brian t1630)

    (free arthur t0900) (free arthur t0930) (free arthur t1000) (free arthur t1030)
    (free arthur t1100) (free arthur t1130) (free arthur t1200) (free arthur t1230)
    (free arthur t1300) (free arthur t1400) (free arthur t1430)
    (free arthur t1500) (free arthur t1530) (free arthur t1630)

    (free matthew t0900) (free matthew t0930) (free matthew t1000) (free matthew t1030)
    (free matthew t1100) (free matthew t1130) (free matthew t1200) (free matthew t1230)
    (free matthew t1300) (free matthew t1330) (free matthew t1400) (free matthew t1430)
    (free matthew t1500) (free matthew t1530) (free matthew t1600) (free matthew t1630)

    (free marilyn t1000) (free marilyn t1130) (free marilyn t1300) (free marilyn t1330)
    (free marilyn t1430) (free marilyn t1500) (free marilyn t1530) (free marilyn t1630)

    (free mark t0900) (free mark t1100) (free mark t1330) (free mark t1430)
    (free mark t1600) (free mark t1630)

    (free andrea t0900) (free andrea t1100) (free andrea t1430)
    (free andrea t1530) (free andrea t1600) (free andrea t1630)
  )

  (:goal (and
    (meeting-scheduled)
    (attending samantha) (attending brian) (attending arthur)
    (attending matthew) (attending marilyn) (attending mark) (attending andrea)
  ))
)