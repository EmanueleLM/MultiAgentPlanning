(define (problem schedule_monday)
  (:domain schedule_meeting)

  (:objects
    david debra kevin - person
    meeting1 - meeting

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; meeting initially unscheduled
    (unscheduled meeting1)

    ;; next relations (consecutive 30-min slots)
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    ;; canonicalized availabilities (30-min slots)
    ;; david: no meetings => free all slots
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
    (available david s1630)

    ;; debra: busy 09:30-10:00 (s0930), 11:00-11:30 (s1100), 12:00-13:00 (s1200,s1230),
    ;;        14:00-14:30 (s1400), 16:00-16:30 (s1600)
    ;; therefore available are all other slots
    (available debra s0900)
    (available debra s1000)
    (available debra s1030)
    (available debra s1130)
    (available debra s1300)
    (available debra s1330)
    (available debra s1430)
    (available debra s1500)
    (available debra s1530)
    (available debra s1630)

    ;; kevin: busy 09:00-12:00 => s0900,s0930,s1000,s1030,s1100,s1130
    ;;        busy 14:00-17:00 => s1400,s1430,s1500,s1530,s1600,s1630
    ;; therefore available: s1200,s1230,s1300,s1330
    (available kevin s1200)
    (available kevin s1230)
    (available kevin s1300)
    (available kevin s1330)
  )

  (:goal (scheduled meeting1))
)