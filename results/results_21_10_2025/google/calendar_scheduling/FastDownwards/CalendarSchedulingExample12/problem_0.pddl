(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: three participants and discrete 30-min start times from 09:00 to 16:00 inclusive
  (:objects
    david debra kevin - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - time
  )

  (:init
    ;; David: available any 60-min start between 09:00 and 16:00 (no prior busy intervals)
    (available david t0900) (available david t0930) (available david t1000) (available david t1030)
    (available david t1100) (available david t1130) (available david t1200) (available david t1230)
    (available david t1300) (available david t1330) (available david t1400) (available david t1430)
    (available david t1500) (available david t1530) (available david t1600)

    ;; Debra: available_for_60_min list and preferences encoded as allowed start times
    ;; Derived from Debra's report:
    ;;   allowed 60-min starts: 10:00 (t1000), 13:00 (t1300), 14:30 (t1430), 15:00 (t1500)
    (available debra t1000)
    (available debra t1300)
    (available debra t1430)
    (available debra t1500)

    ;; Kevin: available_for_60m: 12:00-14:00 -> allowed starts t1200 and t1300
    ;; Kevin's expressed preference for 12:00 or 13:00 is encoded as allowed starts {t1200,t1300}
    (available kevin t1200)
    (available kevin t1300)
  )

  ;; Goal: schedule a single 60-minute meeting (all participants) within Monday 09:00-17:00.
  ;; Based on combined availabilities and preferences encoded above, the common feasible start is 13:00.
  (:goal (meeting-scheduled t1300))
)