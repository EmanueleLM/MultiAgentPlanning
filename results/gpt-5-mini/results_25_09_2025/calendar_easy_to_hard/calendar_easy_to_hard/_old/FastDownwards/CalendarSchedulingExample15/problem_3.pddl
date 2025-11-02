(define (problem schedule-monday-integrated)
  (:domain integrated-scheduling)
  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130
    slot-1200 slot-1230 slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
    m1 - meeting
  )
  (:init
    (is-meeting m1)

    (is-slot slot-0900) (is-slot slot-0930) (is-slot slot-1000) (is-slot slot-1030)
    (is-slot slot-1100) (is-slot slot-1130) (is-slot slot-1200) (is-slot slot-1230)
    (is-slot slot-1300) (is-slot slot-1330) (is-slot slot-1400) (is-slot slot-1430)
    (is-slot slot-1500) (is-slot slot-1530) (is-slot slot-1600) (is-slot slot-1630)

    (slot-available slot-0900) (slot-available slot-0930) (slot-available slot-1000)
    (slot-available slot-1030) (slot-available slot-1100) (slot-available slot-1130)
    (slot-available slot-1200) (slot-available slot-1230) (slot-available slot-1300)
    (slot-available slot-1330) (slot-available slot-1400) (slot-available slot-1430)
    (slot-available slot-1500) (slot-available slot-1530) (slot-available slot-1600)
    (slot-available slot-1630)

    (attends joyce m1)
    (attends christine m1)
    (attends alexander m1)

    (free-joyce slot-0900) (free-joyce slot-0930) (free-joyce slot-1000) (free-joyce slot-1030)
    (free-joyce slot-1130) (free-joyce slot-1200) (free-joyce slot-1230) (free-joyce slot-1300)
    (free-joyce slot-1400) (free-joyce slot-1630)

    (free-christine slot-1200) (free-christine slot-1230) (free-christine slot-1300)
    (free-christine slot-1330) (free-christine slot-1400) (free-christine slot-1430)
    (free-christine slot-1500) (free-christine slot-1530) (free-christine slot-1600)
    (free-christine slot-1630)

    (free-alexander slot-1100) (free-alexander slot-1130) (free-alexander slot-1230)
    (free-alexander slot-1300) (free-alexander slot-1500) (free-alexander slot-1600)
  )
  (:goal (meeting-confirmed m1))
)