(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    walter danielle julia samuel lori - person
    slot-09-00 slot-09-30 slot-10-00 slot-10-30 slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30 slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )
  (:init
    (person walter) (person danielle) (person julia) (person samuel) (person lori)
    (slot slot-09-00) (slot slot-09-30) (slot slot-10-00) (slot slot-10-30)
    (slot slot-11-00) (slot slot-11-30) (slot slot-12-00) (slot slot-12-30)
    (slot slot-13-00) (slot slot-13-30) (slot slot-14-00) (slot slot-14-30)
    (slot slot-15-00) (slot slot-15-30) (slot slot-16-00) (slot slot-16-30)
    (before slot-09-00 slot-09-30) (before slot-09-00 slot-10-00) (before slot-09-00 slot-10-30)
    (before slot-09-00 slot-11-00) (before slot-09-00 slot-11-30) (before slot-09-00 slot-12-00)
    (before slot-09-00 slot-12-30) (before slot-09-00 slot-13-00) (before slot-09-00 slot-13-30)
    (before slot-09-00 slot-14-00) (before slot-09-00 slot-14-30) (before slot-09-00 slot-15-00)
    (before slot-09-00 slot-15-30) (before slot-09-00 slot-16-00) (before slot-09-00 slot-16-30)

    (before slot-09-30 slot-10-00) (before slot-09-30 slot-10-30) (before slot-09-30 slot-11-00)
    (before slot-09-30 slot-11-30) (before slot-09-30 slot-12-00) (before slot-09-30 slot-12-30)
    (before slot-09-30 slot-13-00) (before slot-09-30 slot-13-30) (before slot-09-30 slot-14-00)
    (before slot-09-30 slot-14-30) (before slot-09-30 slot-15-00) (before slot-09-30 slot-15-30)
    (before slot-09-30 slot-16-00) (before slot-09-30 slot-16-30)

    (before slot-10-00 slot-10-30) (before slot-10-00 slot-11-00) (before slot-10-00 slot-11-30)
    (before slot-10-00 slot-12-00) (before slot-10-00 slot-12-30) (before slot-10-00 slot-13-00)
    (before slot-10-00 slot-13-30) (before slot-10-00 slot-14-00) (before slot-10-00 slot-14-30)
    (before slot-10-00 slot-15-00) (before slot-10-00 slot-15-30) (before slot-10-00 slot-16-00)
    (before slot-10-00 slot-16-30)

    (before slot-10-30 slot-11-00) (before slot-10-30 slot-11-30) (before slot-10-30 slot-12-00)
    (before slot-10-30 slot-12-30) (before slot-10-30 slot-13-00) (before slot-10-30 slot-13-30)
    (before slot-10-30 slot-14-00) (before slot-10-30 slot-14-30) (before slot-10-30 slot-15-00)
    (before slot-10-30 slot-15-30) (before slot-10-30 slot-16-00) (before slot-10-30 slot-16-30)

    (before slot-11-00 slot-11-30) (before slot-11-00 slot-12-00) (before slot-11-00 slot-12-30)
    (before slot-11-00 slot-13-00) (before slot-11-00 slot-13-30) (before slot-11-00 slot-14-00)
    (before slot-11-00 slot-14-30) (before slot-11-00 slot-15-00) (before slot-11-00 slot-15-30)
    (before slot-11-00 slot-16-00) (before slot-11-00 slot-16-30)

    (before slot-11-30 slot-12-00) (before slot-11-30 slot-12-30) (before slot-11-30 slot-13-00)
    (before slot-11-30 slot-13-30) (before slot-11-30 slot-14-00) (before slot-11-30 slot-14-30)
    (before slot-11-30 slot-15-00) (before slot-11-30 slot-15-30) (before slot-11-30 slot-16-00)
    (before slot-11-30 slot-16-30)

    (before slot-12-00 slot-12-30) (before slot-12-00 slot-13-00) (before slot-12-00 slot-13-30)
    (before slot-12-00 slot-14-00) (before slot-12-00 slot-14-30) (before slot-12-00 slot-15-00)
    (before slot-12-00 slot-15-30) (before slot-12-00 slot-16-00) (before slot-12-00 slot-16-30)

    (before slot-12-30 slot-13-00) (before slot-12-30 slot-13-30) (before slot-12-30 slot-14-00)
    (before slot-12-30 slot-14-30) (before slot-12-30 slot-15-00) (before slot-12-30 slot-15-30)
    (before slot-12-30 slot-16-00) (before slot-12-30 slot-16-30)

    (before slot-13-00 slot-13-30) (before slot-13-00 slot-14-00) (before slot-13-00 slot-14-30)
    (before slot-13-00 slot-15-00) (before slot-13-00 slot-15-30) (before slot-13-00 slot-16-00)
    (before slot-13-00 slot-16-30)

    (before slot-13-30 slot-14-00) (before slot-13-30 slot-14-30) (before slot-13-30 slot-15-00)
    (before slot-13-30 slot-15-30) (before slot-13-30 slot-16-00) (before slot-13-30 slot-16-30)

    (before slot-14-00 slot-14-30) (before slot-14-00 slot-15-00) (before slot-14-00 slot-15-30)
    (before slot-14-00 slot-16-00) (before slot-14-00 slot-16-30)

    (before slot-14-30 slot-15-00) (before slot-14-30 slot-15-30) (before slot-14-30 slot-16-00)
    (before slot-14-30 slot-16-30)

    (before slot-15-00 slot-15-30) (before slot-15-00 slot-16-00) (before slot-15-00 slot-16-30)

    (before slot-15-30 slot-16-00) (before slot-15-30 slot-16-30)

    (before slot-16-00 slot-16-30)
  )
  (:goal (exists (?s - slot) (chosen ?s)))
)