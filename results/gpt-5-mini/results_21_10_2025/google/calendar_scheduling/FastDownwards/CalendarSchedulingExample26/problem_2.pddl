(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    katherine nicole kevin - person
    slot-09-00 slot-09-30 slot-10-00 slot-10-30 slot-11-00 slot-11-30
    slot-12-00 slot-12-30 slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )

  (:init
    (next slot-09-00 slot-09-30)
    (next slot-09-30 slot-10-00)
    (next slot-10-00 slot-10-30)
    (next slot-10-30 slot-11-00)
    (next slot-11-00 slot-11-30)
    (next slot-11-30 slot-12-00)
    (next slot-12-00 slot-12-30)
    (next slot-12-30 slot-13-00)
    (next slot-13-00 slot-13-30)
    (next slot-13-30 slot-14-00)
    (next slot-14-00 slot-14-30)
    (next slot-14-30 slot-15-00)
    (next slot-15-00 slot-15-30)
    (next slot-15-30 slot-16-00)
    (next slot-16-00 slot-16-30)

    (free katherine slot-09-00) (free katherine slot-09-30) (free katherine slot-10-00) (free katherine slot-10-30)
    (free katherine slot-11-00) (free katherine slot-11-30) (free katherine slot-12-00) (free katherine slot-12-30)
    (free katherine slot-13-00) (free katherine slot-13-30) (free katherine slot-14-00) (free katherine slot-14-30)
    (free katherine slot-15-00) (free katherine slot-15-30) (free katherine slot-16-00) (free katherine slot-16-30)

    (free nicole slot-09-00) (free nicole slot-09-30) (free nicole slot-10-00) (free nicole slot-10-30)
    (free nicole slot-11-00) (free nicole slot-11-30) (free nicole slot-12-00) (free nicole slot-12-30)
    (free nicole slot-13-00) (free nicole slot-13-30) (free nicole slot-14-00) (free nicole slot-14-30)
    (free nicole slot-15-00) (free nicole slot-15-30) (free nicole slot-16-00) (free nicole slot-16-30)

    (free kevin slot-10-00) (free kevin slot-11-30) (free kevin slot-15-30) (free kevin slot-16-00)
  )

  (:goal
    (meeting-scheduled)
  )
)