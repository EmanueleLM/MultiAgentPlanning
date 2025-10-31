(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    diane helen arthur ethan beverly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 - timeslot
  )

  (:init
    ;; Numeric initial: high value to be minimized by planner; will be assigned by chosen schedule action.
    (= (meeting-start) 10000)

    ;; Work hours: 09:00-17:00. Meeting duration 30 minutes.
    ;; Participants' availability: no participant-level unavailability provided beyond Diane's preference,
    ;; so we encode that all participants are free at each candidate start slot from 09:00 through 15:00 inclusive.
    ;; (This leaves the solver able to choose the earliest feasible slot while respecting Diane's constraint.)
    ;; Diane prefers to avoid meetings after 15:30 -> enforced by allowing scheduling only up to 15:00 (meeting end 15:30).

    ;; Diane availability (assumed free on Monday between 09:00 and 15:00 inclusive)
    (free diane t0900) (free diane t0930) (free diane t1000) (free diane t1030) (free diane t1100)
    (free diane t1130) (free diane t1200) (free diane t1230) (free diane t1300) (free diane t1330)
    (free diane t1400) (free diane t1430) (free diane t1500)

    ;; Helen availability (assumed free during work hours for scheduling)
    (free helen t0900) (free helen t0930) (free helen t1000) (free helen t1030) (free helen t1100)
    (free helen t1130) (free helen t1200) (free helen t1230) (free helen t1300) (free helen t1330)
    (free helen t1400) (free helen t1430) (free helen t1500)

    ;; Arthur availability
    (free arthur t0900) (free arthur t0930) (free arthur t1000) (free arthur t1030) (free arthur t1100)
    (free arthur t1130) (free arthur t1200) (free arthur t1230) (free arthur t1300) (free arthur t1330)
    (free arthur t1400) (free arthur t1430) (free arthur t1500)

    ;; Ethan availability
    (free ethan t0900) (free ethan t0930) (free ethan t1000) (free ethan t1030) (free ethan t1100)
    (free ethan t1130) (free ethan t1200) (free ethan t1230) (free ethan t1300) (free ethan t1330)
    (free ethan t1400) (free ethan t1430) (free ethan t1500)

    ;; Beverly availability
    (free beverly t0900) (free beverly t0930) (free beverly t1000) (free beverly t1030) (free beverly t1100)
    (free beverly t1130) (free beverly t1200) (free beverly t1230) (free beverly t1300) (free beverly t1330)
    (free beverly t1400) (free beverly t1430) (free beverly t1500)

    ;; Deborah availability
    (free deborah t0900) (free deborah t0930) (free deborah t1000) (free deborah t1030) (free deborah t1100)
    (free deborah t1130) (free deborah t1200) (free deborah t1230) (free deborah t1300) (free deborah t1330)
    (free deborah t1400) (free deborah t1430) (free deborah t1500)
  )

  ;; Goal: schedule a single meeting that includes all participants.
  (:goal (meeting-scheduled))

  ;; Objective: choose the earliest feasible meeting start time (minimize numeric meeting-start).
  (:metric minimize (meeting-start))
)