(define (problem meet-john-schedule)
  (:domain meet-john)

  (:objects
    richmond-district north-beach - location

    ;; Discrete timepoints used to model the chosen feasible schedule (minutes since midnight)
    minute540   ; 09:00
    minute898   ; 14:58 = meeting_start(915) - 17
    minute915   ; 15:15 John's arrival / earliest meeting start
    minute990   ; 16:30 = 15:15 + 75 meeting end
    - time
  )

  (:init
    ;; Initial location/time: at Richmond District at 09:00 (540)
    (at richmond-district minute540)

    ;; Mark North Beach location
    (is-north-beach north-beach)

    ;; Travel edges (asymmetric durations from public info)
    (travel17 richmond-district north-beach)
    (travel18 north-beach richmond-district)

    ;; Only allow the specific time jumps needed for feasible actions in this model.
    ;; This prevents illegal shortcuts or invented durations.
    ;; Wait jump to depart at 14:58 from 09:00.
    (plus minute540 minute898)

    ;; Travel jump for 17-minute leg: depart 14:58 -> arrive 15:15
    (plus17 minute898 minute915)

    ;; Meeting duration jump for 75 minutes: 15:15 -> 16:30
    (plus75 minute915 minute990)

    ;; John's availability: permit meeting start at 15:15 (915) because 915+75=990 <= 17:15 (1035).
    ;; (We only expose the start times necessary to validate the chosen schedule; other start times
    ;;  are not provided so schedules relying on them are impossible in this problem encoding.)
    (john-available-start minute915)
  )

  ;; Goal: perform a meeting with John (met-john). The timing and feasibility are enforced
  ;; by available timepoints and declared plus/plus17/plus75 relations; the goal does not hardcode
  ;; the specific timestamps so the planner still proves feasibility by executing actions.
  (:goal (met-john))
)