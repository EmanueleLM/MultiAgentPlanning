(define (problem schedule-integrated-monday)
  (:domain integrated-meeting-scheduler)

  (:objects
    meeting1 - meeting
    heather nicholas zachary - person
    slot-09-00 slot-09-30 slot-10-00 slot-10-30
    slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )

  (:init
    ;; Declare persons and slots
    (person heather) (person nicholas) (person zachary)

    (slot slot-09-00) (slot slot-09-30) (slot slot-10-00) (slot slot-10-30)
    (slot slot-11-00) (slot slot-11-30) (slot slot-12-00) (slot slot-12-30)
    (slot slot-13-00) (slot slot-13-30) (slot slot-14-00) (slot slot-14-30)
    (slot slot-15-00) (slot slot-15-30) (slot slot-16-00) (slot slot-16-30)

    ;; Heather's availability (from Heather's input, converted to unified slot names)
    (available heather slot-09-30)
    (available heather slot-10-00)
    (available heather slot-11-00)
    (available heather slot-11-30)
    (available heather slot-12-00)
    (available heather slot-12-30)
    (available heather slot-14-00)
    (available heather slot-15-00)
    (available heather slot-15-30)
    (available heather slot-16-30)

    ;; Nicholas's availability: per Nicholas's input, all work-hour slots are available.
    (available nicholas slot-09-00) (available nicholas slot-09-30)
    (available nicholas slot-10-00) (available nicholas slot-10-30)
    (available nicholas slot-11-00) (available nicholas slot-11-30)
    (available nicholas slot-12-00) (available nicholas slot-12-30)
    (available nicholas slot-13-00) (available nicholas slot-13-30)
    (available nicholas slot-14-00) (available nicholas slot-14-30)
    (available nicholas slot-15-00) (available nicholas slot-15-30)
    (available nicholas slot-16-00) (available nicholas slot-16-30)

    ;; Zachary's known availability (converted from Zachary's s-notation to unified slot names).
    ;; Zachary's free slots from his input: s3 -> slot-10-30, s6 -> slot-12-00, s8 -> slot-13-00, s15 -> slot-16-30
    (available zachary slot-10-30)
    (available zachary slot-12-00)
    (available zachary slot-13-00)
    (available zachary slot-16-30)
  )

  ;; Goal: schedule meeting1 (a single 30-minute meeting involving Heather, Nicholas and Zachary
  ;; must be produced by one of the agent-specific schedule actions).
  (:goal (meeting-scheduled meeting1))
)