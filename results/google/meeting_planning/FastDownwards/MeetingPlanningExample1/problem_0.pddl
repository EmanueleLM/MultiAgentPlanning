(define (problem meet-betty-earliest)
  (:domain multiagent-meeting)

  ;; Objects: two agents and two locations
  (:objects
    you betty - agent
    richmond-district financial-district - location
  )

  ;; Initial state:
  ;; - You arrive / start at Richmond District at 09:00 (540 minutes after midnight).
  ;; - Betty will be at Financial District during her availability window (17:15-21:45).
  ;;   We model her location as Financial District and enforce the temporal window via numeric conditions
  ;;   on the meeting action (no meeting can start before 1035 or end after 1305).
  ;; - Travel durations are encoded as action durations in the domain (22 and 21 minutes).
  ;; - met-time is initially 0.
  (:init
    ;; initial clock = 09:00 = 540 minutes
    (= (current-time) 540)

    ;; initial locations
    (at you richmond-district)
    (at betty financial-district)

    ;; no meeting time yet
    (= (met-time you betty) 0)
    (= (met-time betty you) 0)

    ;; (met you betty) is false by absence; will be set at meeting end
  )

  ;; Goal:
  ;; - You must meet Betty for at least 60 minutes during her availability window (17:15-21:45).
  ;;   This is encoded as a numeric goal on met-time (>= 60).
  ;; The domain encodes that the meeting must happen at Financial District and within Betty's window.
  (:goal (and
           (>= (met-time you betty) 60)
          ))

  ;; Comments / additional modelling notes:
  ;; - Betty's availability window has been encoded as hard numeric constraints inside the meet-at-financial action:
  ;;   meeting start_time >= 1035 and start_time + duration <= 1305 (i.e., fully inside 17:15-21:45).
  ;; - The planner is therefore constrained to schedule the meeting at the earliest feasible time that satisfies
  ;;   travel durations, initial time, and Betty's availability window.
  ;; - No additional availability/busy intervals were provided; all other time is free for the traveler.
)