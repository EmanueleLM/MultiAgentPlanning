(define (problem schedule_monday)
  (:domain schedule_meeting)

  (:objects
    david debra kevin - person
    meeting1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    (unscheduled meeting1)

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

    (available debra s1000)
    (available debra s1300)
    (available debra s1430)
    (available debra s1500)

    (available kevin s1200)
    (available kevin s1230)
    (available kevin s1300)
  )

  (:goal (scheduled meeting1))
)