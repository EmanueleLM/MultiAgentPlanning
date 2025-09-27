(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)

  (:objects
    ;; participants
    diane helen arthur ethan beverly deborah - participant

    ;; allowed start times for a 30-minute meeting on Monday between 09:00 and 15:30 inclusive.
    ;; Diane prefers to avoid meetings after 15:30, so we do NOT include start times after 15:30.
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 - time
  )

  (:init
    ;; Meeting not yet scheduled; total cost starts at 0.
    (unscheduled)
    (= (total-cost) 0)

    ;; Cost-of encodes preference for the earliest feasible time by numeric cost (minutes since 09:00).
    (= (cost-of t0900) 0)
    (= (cost-of t0930) 30)
    (= (cost-of t1000) 60)
    (= (cost-of t1030) 90)
    (= (cost-of t1100) 120)
    (= (cost-of t1130) 150)
    (= (cost-of t1200) 180)
    (= (cost-of t1230) 210)
    (= (cost-of t1300) 240)
    (= (cost-of t1330) 270)
    (= (cost-of t1400) 300)
    (= (cost-of t1430) 330)
    (= (cost-of t1500) 360)
    (= (cost-of t1530) 390)

    ;; Participant availabilities.
    ;; No unavailable slots were provided in the inputs, and work hours are 09:00-17:00.
    ;; We therefore mark all participants available at every allowed start time (09:00-15:30).
    ;; Diane's preference to avoid meetings after 15:30 is treated as a hard constraint by
    ;; not offering start times after 15:30.
    ;; Diane
    (available diane t0900) (available diane t0930) (available diane t1000) (available diane t1030)
    (available diane t1100) (available diane t1130) (available diane t1200) (available diane t1230)
    (available diane t1300) (available diane t1330) (available diane t1400) (available diane t1430)
    (available diane t1500) (available diane t1530)

    ;; Helen
    (available helen t0900) (available helen t0930) (available helen t1000) (available helen t1030)
    (available helen t1100) (available helen t1130) (available helen t1200) (available helen t1230)
    (available helen t1300) (available helen t1330) (available helen t1400) (available helen t1430)
    (available helen t1500) (available helen t1530)

    ;; Arthur
    (available arthur t0900) (available arthur t0930) (available arthur t1000) (available arthur t1030)
    (available arthur t1100) (available arthur t1130) (available arthur t1200) (available arthur t1230)
    (available arthur t1300) (available arthur t1330) (available arthur t1400) (available arthur t1430)
    (available arthur t1500) (available arthur t1530)

    ;; Ethan
    (available ethan t0900) (available ethan t0930) (available ethan t1000) (available ethan t1030)
    (available ethan t1100) (available ethan t1130) (available ethan t1200) (available ethan t1230)
    (available ethan t1300) (available ethan t1330) (available ethan t1400) (available ethan t1430)
    (available ethan t1500) (available ethan t1530)

    ;; Beverly
    (available beverly t0900) (available beverly t0930) (available beverly t1000) (available beverly t1030)
    (available beverly t1100) (available beverly t1130) (available beverly t1200) (available beverly t1230)
    (available beverly t1300) (available beverly t1330) (available beverly t1400) (available beverly t1430)
    (available beverly t1500) (available beverly t1530)

    ;; Deborah
    (available deborah t0900) (available deborah t0930) (available deborah t1000) (available deborah t1030)
    (available deborah t1100) (available deborah t1130) (available deborah t1200) (available deborah t1230)
    (available deborah t1300) (available deborah t1330) (available deborah t1400) (available deborah t1430)
    (available deborah t1500) (available deborah t1530)
  )

  ;; Minimize the total cost to pick the earliest feasible start time that satisfies all constraints.
  (:metric minimize (total-cost))

  ;; Goal: a single meeting must be scheduled (meeting-at will be set by the scheduling action).
  (:goal (scheduled))
)