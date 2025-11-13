(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    ;; The auditor-provided intersection timeslot(s). Only these timeslots are declared.
    (within_work slot_10_00)

    ;; All participants are invited to the meeting.
    (invited donna) (invited john) (invited billy)

    ;; No busy facts for slot_10_00 because auditor found it free for all participants.
    ;; (Any other half-hour slots are intentionally NOT declared as objects.)
  )

  ;; Goal: ensure some timeslot becomes scheduled. Using an existential goal
  ;; avoids hard-coding the chosen slot name while enforcing that exactly one
  ;; allowed slot is scheduled by the planner's action.
  (:goal (exists (?s - timeslot) (scheduled ?s)))
)