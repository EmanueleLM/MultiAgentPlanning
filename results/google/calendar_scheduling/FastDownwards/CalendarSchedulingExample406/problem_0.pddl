(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  ;; Objects:
  ;; - One meeting object (m1)
  ;; - Monday 30-minute start-time slots from 09:00 to 16:30
  (:objects
    m1 - meeting

    ;; slots: t0900 means 09:00-09:30, t0930 means 09:30-10:00, ..., t1630 means 16:30-17:00
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot

    ;; Participants: INSERT participant objects here, e.g. alice bob carol - participant
  )

  (:init
    ;; INSERT availability facts here, one per line, of the form:
    ;; (available <participant> <slot>)
    ;; Example (do not use unless these are your real, provided availabilities):
    ;; (available alice t0900)
    ;; (available alice t0930)
    ;; (available bob t0930)
    ;; (available bob t1000)
    ;;
    ;; INSERT attendee declarations here, one per attendee:
    ;; (attendee <participant> m1)
    ;;
    ;; IMPORTANT: Treat natural-language preferences as hard constraints:
    ;; Only list (available ...) for slots the participant truly can attend.
    ;; Do NOT list slots that are unavailable.
    ;;
    ;; If no (available ...) fact is given for a participant+slot pair, that participant is considered unavailable at that slot.
  )

  (:goal
    ;; The solver must produce a state where m1 is scheduled at some slot.
    (scheduled m1)
  )

  ;; Note: The earliest feasible slot will be chosen by the planner because the action is parameterized
  ;; over slots; to force earliest-slot preference as a hard requirement instead of relying on planner heuristics,
  ;; you can supply constraints by removing availability from earlier slots where participants cannot attend.
)