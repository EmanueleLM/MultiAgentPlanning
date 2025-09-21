(define (problem schedule-integrated-monday)
  (:domain integrated-meeting-scheduler)

  (:objects
    meeting1 - meeting
    slot-09-00 slot-09-30 slot-10-00 slot-10-30
    slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )

  (:init
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

    (available nicholas slot-09-00) (available nicholas slot-09-30)
    (available nicholas slot-10-00) (available nicholas slot-10-30)
    (available nicholas slot-11-00) (available nicholas slot-11-30)
    (available nicholas slot-12-00) (available nicholas slot-12-30)
    (available nicholas slot-13-00) (available nicholas slot-13-30)
    (available nicholas slot-14-00) (available nicholas slot-14-30)
    (available nicholas slot-15-00) (available nicholas slot-15-30)
    (available nicholas slot-16-00) (available nicholas slot-16-30)

    (available zachary slot-10-30)
    (available zachary slot-12-00)
    (available zachary slot-13-00)
    (available zachary slot-16-30)
  )

  (:goal (meeting-scheduled meeting1))
)